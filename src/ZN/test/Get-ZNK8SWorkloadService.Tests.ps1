if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNK8SWorkloadService'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNK8SWorkloadService.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNK8SWorkloadService' {
    It 'List' {
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"}
        $k8snamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8sCluster.id).Items | Where {$_.Name -eq "powershell"}
        $k8sworkload = (Get-ZNK8SClusterNamespaceWorkload -K8SClusterId $k8scluster.id -k8snamespaceId $k8snamespace.id).Items | where {$_.Name -eq "powershell"} 
        (Get-ZNK8SWorkloadService -K8SWorkloadId $k8sworkload.Id).Items.Count | Should -BeGreaterThan 0
    }

    It 'Get' {
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"}
        $k8snamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8sCluster.id).Items | Where {$_.Name -eq "powershell"}
        $k8sworkload = (Get-ZNK8SClusterNamespaceWorkload -K8SClusterId $k8scluster.id -k8snamespaceId $k8snamespace.id).Items | where {$_.Name -eq "powershell"} 
        $k8sService = (Get-ZNK8SNamespaceWorkloadService -k8snamespaceId $k8snamespace.id -K8SWorkloadId $k8sworkload.Id).Items | Select -First 1
        (Get-ZNK8SWorkloadService -K8SWorkloadId $k8sworkload.Id -K8SServiceId $k8sService.Id).EntityId | Should -Be $k8sService.Id
    }
}
