if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNAssetOtLabelsValueCandidate'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNAssetOtLabelsValueCandidate.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNAssetOtLabelsValueCandidate' {
    It 'List' {
        $asset= (Search-ZNAsset -Fqdn poshotv1.posh.local).AssetId
        $key = (Get-ZNAssetOTLabelsKeyCandidate -AssetId $asset)[0]
        (Get-ZNAssetOtLabelsValueCandidate -AssetId $asset -Key $key.id).Count | Should -BeGreaterThan 0
    }
}
