"""Verify downloaded files, pet metadata, and ZIP payloads without dependencies."""
from pathlib import Path
import hashlib
import json
import zipfile

def main():
    root = Path(__file__).resolve().parents[1]
    verified = 0
    for line in (root / 'SHA256SUMS.txt').read_text(encoding='utf-8').splitlines():
        digest, relative = line.split('  ', 1)
        path = (root / relative).resolve()
        assert path.is_relative_to(root), 'Checksum path escapes collection'
        assert hashlib.sha256(path.read_bytes()).hexdigest() == digest, relative
        verified += 1
    pets = json.loads((root / 'catalog.json').read_text(encoding='utf-8'))['pets']
    with zipfile.ZipFile(root / 'downloads/all-pets.zip') as combined:
        for pet in pets:
            folder = root / 'pets' / pet['id']
            metadata = json.loads((folder / 'pet.json').read_text(encoding='utf-8-sig'))
            assert metadata['id'] == pet['id'] and metadata['spriteVersionNumber'] == 2
            assert metadata['spritesheetPath'] == 'spritesheet.webp'
            assert hashlib.sha256((folder / 'spritesheet.webp').read_bytes()).hexdigest() == pet['sha256']
            with zipfile.ZipFile(root / pet['download']) as archive:
                expected = {f"{pet['id']}/pet.json", f"{pet['id']}/spritesheet.webp"}
                assert set(archive.namelist()) == expected
                for name in ['pet.json', 'spritesheet.webp']:
                    local = (folder / name).read_bytes()
                    assert archive.read(f"{pet['id']}/{name}") == local
                    assert combined.read(f"{pet['id']}/{name}") == local
    print(f'PASS: {verified} file checksums and {len(pets)} portable pet packages verified.')

if __name__ == '__main__':
    main()
