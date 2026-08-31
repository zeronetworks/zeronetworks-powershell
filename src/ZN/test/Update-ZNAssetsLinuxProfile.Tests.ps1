if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNAssetsLinuxProfile'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAssetsLinuxProfile.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNAssetsLinuxProfile' {
    It 'UpdateExpanded' {
        $linuxProfile = Get-ZNSettingsLinuxProfile | where {$_.Name -like "Default*"}
        $asset = (Search-ZNAsset -Fqdn linux1.posh.local).AssetId
        { Update-ZNAssetsLinuxProfile -AssetIds @($asset) -ProfileId $linuxProfile.Id } | Should -Not -Throw
    }
}
