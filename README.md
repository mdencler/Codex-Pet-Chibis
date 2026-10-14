# Codex Pet Chibis

Custom animated pets for the Codex desktop app, collected by Mark Dencler.
Each pet includes the two files needed to install it: `pet.json` and
`spritesheet.webp`. Download one pet or the [complete collection](downloads/all-pets.zip).

| Pet | Preview | Download | Greeting |
| --- | --- | --- | --- |
| Amelia | ![Amelia idle animation](previews/amelia/idle.gif) | [Amelia ZIP](downloads/amelia.zip) | [Small British flag wave](previews/amelia/waving.gif) |
| Amumu | ![Amumu idle animation](previews/amumu/idle.gif) | [Amumu ZIP](downloads/amumu.zip) | [Wave](previews/amumu/waving.gif) |
| Hatsune Miku | ![Hatsune Miku idle animation](previews/hatsune-miku/idle.gif) | [Miku ZIP](downloads/hatsune-miku.zip) | [Wave](previews/hatsune-miku/waving.gif) |
| Lux | ![Lux idle animation](previews/lux/idle.gif) | [Lux ZIP](downloads/lux.zip) | [Wave with her light mage staff](previews/lux/waving.gif) |
| Rebecca | ![Rebecca idle animation](previews/rebecca/idle.gif) | [Rebecca ZIP](downloads/rebecca.zip) | [Pistol draw and wink](previews/rebecca/waving.gif) |
| Nall | ![Nall idle animation](previews/nall/idle.gif) | [Nall ZIP](downloads/nall.zip) | [Wave](previews/nall/waving.gif) |
| Vayne | ![Vayne idle animation](previews/vayne/idle.gif) | [Vayne ZIP](downloads/vayne.zip) | [Wave with wrist crossbow lowered](previews/vayne/waving.gif) |

Amelia, Amumu, Hatsune Miku, and Rebecca include the October 11, 2026 animation-size corrections.
Lux uses her classic Demacian armor and light mage staff, with consistent proportions across animations.
Nall is included as an additional custom companion.
Vayne keeps her red glasses, crimson cape, and attached Night Hunter crossbows.

## Lunar collection

The sixteen selected Lunar previews are now animated pets. Preview numbers match the selection catalog.

| Preview | Pet | Animation | Download |
| --- | --- | --- | --- |
| 1 | Alex | ![Alex idle animation](previews/alex/idle.gif) | [Alex ZIP](downloads/alex.zip) |
| 2 | Luna | ![Luna idle animation](previews/luna/idle.gif) | [Luna ZIP](downloads/luna.zip) |
| 3 | Mia | ![Mia idle animation](previews/mia/idle.gif) | [Mia ZIP](downloads/mia.zip) |
| 9 | Jessica (Horns) | ![Jessica (Horns) idle animation](previews/jessica-horns/idle.gif) | [Jessica (Horns) ZIP](downloads/jessica-horns.zip) |
| 5 | Nash | ![Nash idle animation](previews/nash/idle.gif) | [Nash ZIP](downloads/nash.zip) |
| 6 | Kyle | ![Kyle idle animation](previews/kyle/idle.gif) | [Kyle ZIP](downloads/kyle.zip) |
| 11 | Dark Luna (Black Gown) | ![Dark Luna (Black Gown) idle animation](previews/dark-luna/idle.gif) | [Dark Luna (Black Gown) ZIP](downloads/dark-luna.zip) |
| 12 | Alex (Dragonmaster Blue Armor) | ![Alex (Dragonmaster Blue Armor) idle animation](previews/alex-dragonmaster-v2/idle.gif) | [Alex (Dragonmaster Blue Armor) ZIP](downloads/alex-dragonmaster-v2.zip) |
| 13 | Xenobia (Silver-Hair Concept) | ![Xenobia (Silver-Hair Concept) idle animation](previews/xenobia/idle.gif) | [Xenobia (Silver-Hair Concept) ZIP](downloads/xenobia.zip) |
| 14 | Dark Luna (Althena) | ![Dark Luna (Althena) idle animation](previews/dark-luna-althena/idle.gif) | [Dark Luna (Althena) ZIP](downloads/dark-luna-althena.zip) |
| 15 | Luna Classic | ![Luna Classic idle animation](previews/luna-classic/idle.gif) | [Luna Classic ZIP](downloads/luna-classic.zip) |
| 16 | Ghaleon (Dark Robes) | ![Ghaleon (Dark Robes) idle animation](previews/ghaleon-dark-robes-v2/idle.gif) | [Ghaleon (Dark Robes) ZIP](downloads/ghaleon-dark-robes-v2.zip) |
| 17 | Xenobia Classic | ![Xenobia Classic idle animation](previews/xenobia-classic-v2/idle.gif) | [Xenobia Classic ZIP](downloads/xenobia-classic-v2.zip) |
| 18 | Dragonmaster Alex (Classic) | ![Dragonmaster Alex (Classic) idle animation](previews/dragonmaster-alex-classic/idle.gif) | [Dragonmaster Alex (Classic) ZIP](downloads/dragonmaster-alex-classic.zip) |
| 19 | Ghaleon Classic | ![Ghaleon Classic idle animation](previews/ghaleon-classic/idle.gif) | [Ghaleon Classic ZIP](downloads/ghaleon-classic.zip) |
| 20 | Dark Emperor Ghaleon | ![Dark Emperor Ghaleon idle animation](previews/dark-emperor-ghaleon/idle.gif) | [Dark Emperor Ghaleon ZIP](downloads/dark-emperor-ghaleon.zip) |

Each Lunar pet includes nine standard animations and sixteen gaze directions. Model size was reviewed across animation states.

## Install a pet

1. Open a pet's ZIP link above, then click **Download raw file** on GitHub.
2. Extract the ZIP. Keep `pet.json` and `spritesheet.webp` together inside the named pet folder.
3. Copy that folder into your Codex pets directory:
   - Windows: `%USERPROFILE%\.codex\pets\`
   - macOS/Linux: `~/.codex/pets/`
   - If you set `CODEX_HOME`, use the `pets` folder inside that directory instead.
4. In Codex, open **Settings → Pets**, refresh the list, and select the pet.

For example, Rebecca should be installed as:

```text
.codex/
  pets/
    rebecca/
      pet.json
      spritesheet.webp
```

If that pet folder already exists, back it up before replacing its two files.
If an update does not appear, refresh or restart Codex so it reloads the sprite sheet.
These instructions describe the local custom-pet layout used by this collection;
the app interface can vary by version.

### Optional PowerShell installer

Download the repository with **Code → Download ZIP**, extract it, and run:

```powershell
./scripts/install-pets.ps1 -Pet rebecca
```

To install the entire collection, run `./scripts/install-pets.ps1` without `-Pet`.
The script verifies the selected sprite checksums and refuses to overwrite an
existing pet folder. You can specify a custom destination with `-PetsDirectory`.

## Files and animation format

- `pets/<id>/`: installable metadata and transparent sprite sheet.
- `downloads/`: one ZIP per pet and a combined ZIP containing all 23 pets.
- `previews/<id>/`: thumbnails and GIFs for all nine standard animations.
- `catalog.json`: names, descriptions, download paths, and sprite SHA-256 hashes.
- `SHA256SUMS.txt`: checksums for the published files.
- [FORMAT.md](FORMAT.md): atlas layout and animation rows.

All pets use `spriteVersionNumber: 2`, an 8 × 11 atlas of 192 × 208 cells,
and a 1536 × 2288 transparent WebP image. No image-generation service or API key
is needed to install them. Preview GIFs have a gray background for readability;
the installable sprite sheets are transparent.

## Verification

The published sheets match the installed local versions byte for byte. Atlas
dimensions, used cells, transparency, ZIP contents, and checksums were checked.
The four size-corrected chibis also passed independent static visual review.
Lux and Vayne passed independent review of ordered animation frames, model size, and all sixteen gaze directions.
All sixteen Lunar pets passed independent review of ordered animation frames, model size, and the sixteen-direction gaze loop. The four cardinal directions also passed blind checks; subtle intermediate cues were assessed in the ordered loop.
Live Codex rendering and timed app playback were not independently verified.

After downloading the repository, you can verify file integrity with Python 3:

```text
python scripts/verify.py
```
