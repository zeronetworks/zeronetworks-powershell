if(($null -eq $TestName) -or ($TestName -contains 'Invoke-ZNAssetNetworkOutboundQueue'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Invoke-ZNAssetNetworkOutboundQueue.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Invoke-ZNAssetNetworkOutboundQueue' {
    It 'QueueExpanded' {
        $asset= (Search-ZNAsset -Fqdn al01.posh.local).AssetId
        Invoke-ZNAssetNetworkOutboundQueue -AssetIds @($asset) -Directions 1 -QueueDays 14
        $updatedAsset = Get-ZNAsset -AssetId $asset
        $updatedAsset.InternalState | Should -Be 5
        Update-ZNAssetOutboundUnrestrict -AssetIds @($asset) -Directions 1
    }
}
