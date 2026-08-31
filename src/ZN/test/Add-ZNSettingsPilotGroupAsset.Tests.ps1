if(($null -eq $TestName) -or ($TestName -contains 'Add-ZNSettingsPilotGroupAsset'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Add-ZNSettingsPilotGroupAsset.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Add-ZNSettingsPilotGroupAsset' {
    It 'AddExpanded' {
        $asset= (Search-ZNAsset -Fqdn wc01.posh.local).AssetId
        Add-ZNSettingsPilotGroupAsset -OSType Windows -Product cloud-connector -AssetIds @($asset)
        (Get-ZNSettingsPilotGroup -OSType windows -Product cloud-connector).Items.Name | Should -Contain WC01
        Remove-ZNSettingsPilotGroupAsset -OSType windows -Product cloud-connector -AssetIds @($asset) 
    }
}
