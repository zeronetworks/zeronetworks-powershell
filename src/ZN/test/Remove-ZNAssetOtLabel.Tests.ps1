if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNAssetOtLabel'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNAssetOtLabel.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNAssetOtLabel' {
    It 'RemoveExpanded' {
        $asset= (Search-ZNAsset -Fqdn poshotv1.posh.local).AssetId 
        Add-ZNAssetOTLabel -AssetId $asset -Labels @(@{"key"="RemoveTest"})
        { Remove-ZNAssetOTLabel -AssetId $asset -Labels @(@{"key"="RemoveTest"}) } | Should -Not -Throw
    }
}
