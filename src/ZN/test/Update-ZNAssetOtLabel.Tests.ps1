if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNAssetOtLabel'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAssetOtLabel.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNAssetOtLabel' {
    It 'SetExpanded' {
        $asset = (Search-ZNAsset -Fqdn otv1.posh.local).AssetId
        { Update-ZNAssetOtLabel -AssetId $asset -Labels @(@{"key"="keytest"; "value"="test"})  } | Should -Not -Throw
    }
}
