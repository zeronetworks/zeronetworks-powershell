if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNAssetOutboundUnrestrict'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAssetOutboundUnrestrict.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNAssetOutboundUnrestrict' {
    It 'UpdateExpanded' {
        $asset= (Search-ZNAsset -Fqdn al01.posh.local).AssetId
        Invoke-ZNAssetNetworkOutboundQueue -AssetIds @($asset) -Directions 1 -QueueDays 14
        { Update-ZNAssetOutboundUnrestrict -AssetIds @($asset) -Directions 1 } | Should -Not -Throw
    }
}
