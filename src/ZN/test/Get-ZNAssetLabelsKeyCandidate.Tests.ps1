if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNAssetLabelsKeyCandidate'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNAssetLabelsKeyCandidate.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNAssetLabelsKeyCandidate' {
    It 'List' {
        $asset= (Search-ZNAsset -Fqdn dc01.posh.local).AssetId
        (Get-ZNAssetLabelsKeyCandidate -AssetId $asset).Count | Should -BeGreaterThan 0
    }
}
