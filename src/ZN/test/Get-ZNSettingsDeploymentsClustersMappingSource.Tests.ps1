if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNSettingsDeploymentsClustersMappingSource'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNSettingsDeploymentsClustersMappingSource.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNSettingsDeploymentsClustersMappingSource' {
    It 'Get' {
        $cluster = Get-ZNSettingsDeploymentsCluster | select -First 1
        Get-ZNSettingsDeploymentsClustersMappingSource -DeploymentsClusterId $cluster.Id | Should -Not -BeNullOrEmpty
    }
}
