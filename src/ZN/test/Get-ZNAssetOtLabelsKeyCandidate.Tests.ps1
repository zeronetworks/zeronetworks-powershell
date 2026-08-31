if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNAssetOtLabelsKeyCandidate'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNAssetOtLabelsKeyCandidate.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNAssetOtLabelsKeyCandidate' {
    It 'List' {
        $asset= (Search-ZNAsset -Fqdn poshotv1.posh.local).AssetId
        $key = (Get-ZNAssetLabelsKeyCandidate -AssetId $asset)[0]
        (Get-ZNAssetLabelsValueCandidate -AssetId $asset -key $key.id).Id | Should -Not -BeNullOrEmpty
    }
}
