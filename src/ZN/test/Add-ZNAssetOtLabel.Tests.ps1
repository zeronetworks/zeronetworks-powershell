if(($null -eq $TestName) -or ($TestName -contains 'Add-ZNAssetOtLabel'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Add-ZNAssetOtLabel.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Add-ZNAssetOtLabel' {
    It 'AddExpanded' {
        $asset= (Search-ZNAsset -Fqdn poshOTv1.posh.local).AssetId
        Add-ZNAssetOtLabel -AssetId $asset -Labels @(@{"key"="AddLabel";"value"="NewValue"})
        (Get-ZNAssetOtLabel -AssetId $asset).Items.Key | Should -Contain AddLabel
        Remove-ZNAssetOtLabel -AssetId $asset -Labels @(@{"key"="AddLabel";"value"="NewValue"})
    }
}
