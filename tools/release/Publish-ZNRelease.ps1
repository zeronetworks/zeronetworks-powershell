<#
.SYNOPSIS
  Validates the signed module and publishes it to the PowerShell Gallery.
  Without -Confirm this is a dry run (Publish-Module -WhatIf). With -Confirm it asks you to type
  the version back, publishes for real, then verifies the Gallery copy is installable and complete.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$SignedPath,
    [Parameter(Mandatory)][string]$Version,
    [switch]$Confirm,
    [string]$NuGetApiKey
)
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'ZNReleaseCommon.ps1')

$SignedPath = (Resolve-Path $SignedPath).Path
if ((Split-Path $SignedPath -Leaf) -ne 'ZeroNetworks') { throw "SignedPath must be the 'ZeroNetworks' module folder." }

# 1. Manifest + version
$manifest = Join-Path $SignedPath 'ZeroNetworks.psd1'
Test-ModuleManifest $manifest | Out-Null
$manifestVersion = Get-ZNManifestVersion -ManifestPath $manifest
if ($manifestVersion -ne $Version) { throw "Manifest says $manifestVersion but -Version is $Version." }
Write-Host "Manifest OK: ZeroNetworks $manifestVersion" -ForegroundColor Green

# 2. bin/ completeness (the 0.26.100-preview regression)
Assert-ZNBinComplete -ModulePath $SignedPath

# 3. Signatures
function Test-PEHasSignature([string]$Path) {
    # PE certificate table = data directory #4. Non-zero size means an Authenticode blob is attached.
    $b = [IO.File]::ReadAllBytes($Path)
    $pe = [BitConverter]::ToInt32($b, 0x3C)
    $magic = [BitConverter]::ToUInt16($b, $pe + 24)
    $ddOffset = $pe + 24 + $(if ($magic -eq 0x20B) { 112 } else { 96 })
    [BitConverter]::ToUInt32($b, $ddOffset + 4 * 8 + 4) -gt 0
}
$unsigned = @()
$files = Get-ChildItem $SignedPath -Recurse -File | Where-Object { $_.Extension -in '.ps1', '.psm1', '.psd1', '.ps1xml', '.dll' }
$haveAuthenticode = [bool](Get-Command Get-AuthenticodeSignature -ErrorAction SilentlyContinue)
foreach ($f in $files) {
    if ($haveAuthenticode) {
        if ((Get-AuthenticodeSignature $f.FullName).Status -ne 'Valid') { $unsigned += $f.FullName }
    } elseif ($f.Extension -eq '.dll') {
        if (-not (Test-PEHasSignature $f.FullName)) { $unsigned += $f.FullName }
    } elseif (-not (Select-String -Path $f.FullName -SimpleMatch 'SIG # Begin signature block' -Quiet)) {
        $unsigned += $f.FullName
    }
}
if ($unsigned.Count) {
    throw "Unsigned files found - the signing step skipped something, investigate (do not force):`n  $($unsigned -join "`n  ")"
}
$how = if ($haveAuthenticode) { 'Get-AuthenticodeSignature = Valid' } else { 'signature block present; full chain validation needs Windows' }
Write-Host "Signatures OK on $($files.Count) files ($how)" -ForegroundColor Green

# 4. Publish
if (-not $Confirm) {
    Publish-Module -Path $SignedPath -NuGetApiKey 'dry-run' -Repository PSGallery -WhatIf
    Write-Host "`nDry run complete. Re-run with -Confirm -NuGetApiKey <key> to publish for real." -ForegroundColor Yellow
    return
}
if (-not $NuGetApiKey) { throw '-NuGetApiKey is required with -Confirm.' }

$typed = Read-Host "About to publish ZeroNetworks $Version to PSGallery (irreversible). Type the version to continue"
if ($typed -ne $Version) { throw 'Version mismatch - aborted, nothing published.' }

Publish-Module -Path $SignedPath -NuGetApiKey $NuGetApiKey -Repository PSGallery
Write-Host "Published ZeroNetworks $Version." -ForegroundColor Green

# 5. Post-publish verification: the Gallery copy must be installable AND have a complete bin/.
$found = $null
for ($i = 0; $i -lt 12 -and -not $found; $i++) {
    Start-Sleep -Seconds 10
    $found = Find-Module ZeroNetworks -RequiredVersion $Version -AllowPrerelease -ErrorAction SilentlyContinue
}
if (-not $found) {
    Write-Warning "Not indexed on the Gallery yet after ~2 minutes; skipping post-publish check. Re-check later with: Update-Module ZeroNetworks -AllowPrerelease"
    return
}

$verify = Join-Path ([IO.Path]::GetTempPath()) "zn-verify-$Version"
if (Test-Path $verify) { Remove-Item $verify -Recurse -Force }
Save-Module ZeroNetworks -RequiredVersion $Version -AllowPrerelease -Path $verify -Force
$saved = Get-ChildItem (Join-Path $verify 'ZeroNetworks') -Directory | Select-Object -First 1
Assert-ZNBinComplete -ModulePath $saved.FullName
Remove-Item $verify -Recurse -Force

if (Get-Module ZeroNetworks -ListAvailable) {
    Update-Module ZeroNetworks -AllowPrerelease -Force
} else {
    Install-Module ZeroNetworks -AllowPrerelease -Scope CurrentUser -Force
}
$installed = Get-Module ZeroNetworks -ListAvailable | Sort-Object Version -Descending | Select-Object -First 1
$installedVersion = if ($installed.PrivateData.PSData.Prerelease) { "$($installed.Version)-$($installed.PrivateData.PSData.Prerelease)" } else { "$($installed.Version)" }
if ($installedVersion -ne $Version) { throw "Installed version is $installedVersion, expected $Version." }
Write-Host "Verified: Gallery package installs as $installedVersion with a complete bin/." -ForegroundColor Green
