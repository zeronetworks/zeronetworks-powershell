if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNK8SClusterApplicationOutboundRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNK8SClusterApplicationOutboundRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNK8SClusterApplicationOutboundRule' {
    It 'List' {
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"}
        $k8sapplication = (Get-ZNK8SClusterApplication -K8SClusterId $k8sCluster.Id).Items | where {$_.Name -eq "powershell"}
        (Get-ZNK8SClusterApplicationOutboundRule -K8SClusterId $k8sCluster.Id -ApplicationName $k8sApplication.Name).Items.Count | Should -BeGreaterThan 0
    }
}
