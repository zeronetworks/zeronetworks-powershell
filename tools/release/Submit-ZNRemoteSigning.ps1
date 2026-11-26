<#
.SYNOPSIS
  Uploads the staged module to gs://zn-sign-bucket, runs the remote signing workflow in
  zeronetworks/ci-cd-actions, and downloads the signed result to release/<version>/signed/ZeroNetworks.
  Outputs the signed module path on the pipeline.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$StagePath,
    [Parameter(Mandatory)][string]$Version
)
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $true
. (Join-Path $PSScriptRoot 'ZNReleaseCommon.ps1')

$StagePath = (Resolve-Path $StagePath).Path
Assert-ZNBinComplete -ModulePath $StagePath

$bucket = 'gs://zn-sign-bucket'
$name   = "ZeroNetworks-$Version"
$repo   = 'zeronetworks/ci-cd-actions'
$wf     = 'upload-and-signing.yaml'
$signed = Join-Path $script:ReleaseRoot "$Version/signed/ZeroNetworks"

Write-Host "Uploading $StagePath -> $bucket/$name"
# Clear any leftovers from a previous attempt at this version so nothing stale gets signed/shipped.
foreach ($p in "$bucket/$name", "$bucket/signed/$name") {
    & gsutil -q ls "$p/**" 2>$null | Out-Null
    if ($LASTEXITCODE -eq 0) { & gsutil -m -q rm -r $p }
}
$global:LASTEXITCODE = 0
& gsutil -m -q rsync -r $StagePath "$bucket/$name"

$since = (Get-Date).ToUniversalTime().AddSeconds(-5)
Write-Host "Triggering $wf on $repo with path=$name"
& gh workflow run $wf -R $repo -f "path=$name"

$runId = $null
for ($i = 0; $i -lt 30 -and -not $runId; $i++) {
    Start-Sleep -Seconds 3
    $runs = & gh run list -R $repo -w $wf -e workflow_dispatch -L 5 --json databaseId,createdAt | ConvertFrom-Json
    $runId = ($runs | Where-Object { ([datetime]$_.createdAt).ToUniversalTime() -ge $since } |
              Sort-Object createdAt | Select-Object -First 1).databaseId
}
if (-not $runId) { throw "Could not find the triggered run of $wf on $repo." }
Write-Host "Run: https://github.com/$repo/actions/runs/$runId"
& gh run watch $runId -R $repo --exit-status --interval 15 | Out-Host

if (Test-Path $signed) { Remove-Item $signed -Recurse -Force }
New-Item -ItemType Directory -Path $signed -Force | Out-Null
Write-Host "Downloading $bucket/signed/$name -> $signed"
& gsutil -m -q rsync -r "$bucket/signed/$name" $signed

Assert-ZNBinComplete -ModulePath $signed
$stageCount  = (Get-ChildItem $StagePath -Recurse -File).Count
$signedCount = (Get-ChildItem $signed -Recurse -File).Count
if ($stageCount -ne $signedCount) {
    throw "Signed output has $signedCount files but stage had $stageCount - investigate before publishing."
}
$signed
