if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNK8SClusterNamespaceService'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNK8SClusterNamespaceService.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNK8SClusterNamespaceService' {
    It 'List' {
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
        $k8snamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8scluster.id -Limit 400).Items | where {$_.Name -eq "powershell"}
        (Get-ZNK8SClusterNamespaceService -K8SClusterId $k8scluster.id -K8SNamespaceId $k8snamespace.Id).Items.Count | Should -BeGreaterThan 0
    }

    It 'Get' {
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
        $k8snamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8scluster.id -Limit 400).Items | where {$_.Name -eq "powershell"}
        $k8sService = (Get-ZNK8SClusterNamespaceService -K8SClusterId $k8scluster.id -K8SNamespaceId $k8snamespace.Id).Items | select -First 1
        (Get-ZNK8SClusterNamespaceService -K8SClusterId $k8scluster.id -K8SNamespaceId $k8snamespace.Id -K8SServiceId $k8sService.Id).EntityId | Should -Be $k8sService.Id
    }
}
