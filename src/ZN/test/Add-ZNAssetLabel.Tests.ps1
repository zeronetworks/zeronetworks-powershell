if(($null -eq $TestName) -or ($TestName -contains 'Add-ZNAssetLabel'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Add-ZNAssetLabel.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Add-ZNAssetLabel' {
    It 'AddExpanded' {
        $asset= (Search-ZNAsset -Fqdn dc01.posh.local).AssetId
        Add-ZNAssetLabel -AssetId $asset -Labels @(@{"key"="AddLabel";"value"="NewValue"})
        (Get-ZNAssetLabel -AssetId $asset).Items.Key | Should -Contain AddLabel
        Remove-ZNAssetLabel -AssetId $asset -Labels @(@{"key"="AddLabel";"value"="NewValue"})
    }
}
