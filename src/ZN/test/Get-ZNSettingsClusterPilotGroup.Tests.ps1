if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNSettingsClusterPilotGroup'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNSettingsClusterPilotGroup.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNSettingsClusterPilotGroup' {
    It 'Get' {
        $clusterPilotGroup = (Get-ZNSettingsDeploymentsCluster).Items | where {$_.Name -eq "Pilot"}
        Update-ZnSettingsClusterPilotGroup -Product segment-server -ClusterId $clusterPilotGroup.Id
        (Get-ZNSettingsClusterPilotGroup -Product segment-server).ClusterId | Should -Be $clusterPilotGroup.Id
    }
}
