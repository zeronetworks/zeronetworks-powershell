if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNAssetLabel'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNAssetLabel.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNAssetLabel' {
    It 'RemoveExpanded' {
        $asset= (Search-ZNAsset -Fqdn dc01.posh.local).AssetId 
        Add-ZNAssetLabel -AssetId $asset -Labels @(@{"key"="RemoveTest"})
        { Remove-ZNAssetLabel -AssetId $asset -Labels @(@{"key"="RemoveTest"}) } | Should -Not -Throw
    }
}
