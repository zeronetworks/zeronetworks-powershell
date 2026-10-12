if(($null -eq $TestName) -or ($TestName -contains 'Invoke-ZNAssetNetworkOutboundExtendQueue'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Invoke-ZNAssetNetworkOutboundExtendQueue.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Invoke-ZNAssetNetworkOutboundExtendQueue' {
   It 'QueueExpanded' {
        $asset= (Search-ZNAsset -Fqdn al01.posh.local).AssetId
        Invoke-ZNAssetNetworkOutboundQueue -AssetIds @($asset) -Directions 1 -QueueDays 14
        {Invoke-ZNAssetNetworkOutboundExtendQueue -AssetIds @($asset) -Directions 1 -ExtendByDays 14} | should -not -throw
        Update-ZNAssetOutboundUnrestrict -AssetIds @($asset) -Directions 1
    }
}
