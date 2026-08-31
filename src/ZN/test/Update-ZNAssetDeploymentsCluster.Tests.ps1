if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNAssetDeploymentsCluster'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAssetDeploymentsCluster.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNAssetDeploymentsCluster' {
    It 'UpdateExpanded' {
        $asset = (Search-ZNAsset -Fqdn "dc01.posh.local").AssetId
        $deploymentCluster = Get-ZNSettingsDeploymentsCluster | where {$_.Name -eq "ZN deployments cluster"}
        { Update-ZNAssetDeploymentsCluster -AssetIds @($asset) -DeploymentsClusterId $deploymentCluster.Id } | Should -Not -Throw
        Update-ZNAssetDeploymentsCluster -AssetIds @($asset)
                
    }
}
