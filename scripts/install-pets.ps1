param(
    [ValidateSet('amelia','amumu','hatsune-miku','lux','nall','rebecca')]
    [string[]]$Pet = @('amelia','amumu','hatsune-miku','lux','nall','rebecca'),
    [string]$PetsDirectory
)
$ErrorActionPreference = 'Stop'
$collectionRoot = Split-Path -Parent $PSScriptRoot
if (!$PetsDirectory) {
    $codexDirectory = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $env:USERPROFILE '.codex' }
    $PetsDirectory = Join-Path $codexDirectory 'pets'
}
$PetsDirectory = [IO.Path]::GetFullPath($PetsDirectory)
$catalog = Get-Content -LiteralPath (Join-Path $collectionRoot 'catalog.json') -Raw | ConvertFrom-Json
foreach ($id in $Pet) {
    $entry = $catalog.pets | Where-Object id -eq $id
    $source = Join-Path $collectionRoot "pets/$id"
    $destination = Join-Path $PetsDirectory $id
    if (Test-Path -LiteralPath $destination) { throw "Already installed: $destination. Back it up and move it aside before installing." }
    $actual = (Get-FileHash -LiteralPath (Join-Path $source 'spritesheet.webp') -Algorithm SHA256).Hash
    if ($actual -ne $entry.sha256) { throw "Sprite checksum mismatch: $id" }
}
foreach ($id in $Pet) {
    $destination = Join-Path $PetsDirectory $id
    New-Item -ItemType Directory -Path $destination -Force | Out-Null
    Copy-Item -LiteralPath (Join-Path $collectionRoot "pets/$id/pet.json") -Destination (Join-Path $destination 'pet.json')
    Copy-Item -LiteralPath (Join-Path $collectionRoot "pets/$id/spritesheet.webp") -Destination (Join-Path $destination 'spritesheet.webp')
    Write-Output "Installed $id to $destination"
}
Write-Output 'Refresh Settings > Pets in Codex, then select your pet.'
