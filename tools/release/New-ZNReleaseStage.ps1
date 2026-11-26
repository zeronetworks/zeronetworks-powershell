<#
.SYNOPSIS
  Copies the shippable module file set from src/ZN into release/<version>/ZeroNetworks/.
  Outputs the staged module path on the pipeline (all other output goes to the host).
#>
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'ZNReleaseCommon.ps1')

$version = Get-ZNManifestVersion
$stage = Join-Path $script:ReleaseRoot "$version/ZeroNetworks"
Write-Host "Staging ZeroNetworks $version -> $stage"

Assert-ZNBinComplete -ModulePath $script:ModuleRoot   # fail fast before copying anything

if (Test-Path $stage) { Remove-Item $stage -Recurse -Force }
New-Item -ItemType Directory -Path $stage -Force | Out-Null

foreach ($item in $script:ReleaseItems) {
    $src = Join-Path $script:ModuleRoot $item
    if (-not (Test-Path $src)) { throw "Release item not found: $src" }
    $dst = Join-Path $stage $item
    New-Item -ItemType Directory -Path (Split-Path $dst -Parent) -Force | Out-Null
    if ((Get-Item $src).PSIsContainer) {
        Copy-Item $src -Destination (Split-Path $dst -Parent) -Recurse -Force
    } else {
        Copy-Item $src -Destination $dst -Force
    }
}
Get-ChildItem $stage -Recurse -File -Force |
    Where-Object { $n = $_.Name; $script:ReleaseExcludePatterns | Where-Object { $n -like $_ } } |
    Remove-Item -Force

Assert-ZNBinComplete -ModulePath $stage
Test-ModuleManifest (Join-Path $stage 'ZeroNetworks.psd1') | Out-Null

Write-Host "`nStaged files:" -ForegroundColor Cyan
Get-ChildItem $stage -Recurse -File |
    Where-Object { $_.FullName -notmatch '[\\/](custom|utils)[\\/]' -or $_.Extension -ne '.md' } |
    ForEach-Object { '{0,12:N0}  {1}' -f $_.Length, $_.FullName.Substring($stage.Length + 1) } |
    Write-Host
$all = Get-ChildItem $stage -Recurse -File
Write-Host ("`n{0} files, {1:N1} MB" -f $all.Count, (($all | Measure-Object Length -Sum).Sum / 1MB))

$stage
