if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNK8SClusterNamespaceNetworkPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNK8SClusterNamespaceNetworkPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNK8SClusterNamespaceNetworkPolicy' {
    It 'List' {
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} | Select-Object -First 1
        if (-not $k8scluster) { $k8scluster = (Get-ZNK8SCluster).Items | Select-Object -First 1 }
        $k8scluster | Should -Not -BeNullOrEmpty
        $k8snamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8scluster.Id -Limit 400).Items | where {$_.Name -eq "powershell"} | Select-Object -First 1
        if (-not $k8snamespace) { $k8snamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8scluster.Id -Limit 400).Items | Select-Object -First 1 }
        $k8snamespace | Should -Not -BeNullOrEmpty
        $k8snamespace.Id | Should -Not -BeNullOrEmpty
        { Get-ZNK8SClusterNamespaceNetworkPolicy -K8SClusterId $k8scluster.Id -K8SNamespaceId $k8snamespace.Id } | Should -Not -Throw
    }
}
