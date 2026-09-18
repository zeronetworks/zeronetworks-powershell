if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNAssetsOutboundRestriction'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAssetsOutboundRestriction.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNAssetsOutboundRestriction' {
    It 'UpdateExpanded' {
        $asset = (Search-ZNAsset -Fqdn dc01.posh.local).AssetId
        { Update-ZNAssetsOutboundRestriction -AssetIds @($asset) -OutboundRestriction 1 } | Should -Not -Throw
    }
}
