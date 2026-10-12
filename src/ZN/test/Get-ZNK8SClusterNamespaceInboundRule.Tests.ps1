if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNK8SClusterNamespaceInboundRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNK8SClusterNamespaceInboundRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNK8SClusterNamespaceInboundRule' {
    It 'List' {
        $k8sCluster = (Get-ZNK8SCluster).Items | Select-Object -First 1
        $k8sCluster | Should -Not -BeNullOrEmpty
        $k8sClusterNamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8sCluster.Id -Limit 400).Items | where {$_.Name -eq "socks-shop"} | Select-Object -First 1
        if (-not $k8sClusterNamespace) { $k8sClusterNamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8sCluster.Id -Limit 400).Items | Select-Object -First 1 }
        $k8sClusterNamespace | Should -Not -BeNullOrEmpty
        $k8sClusterNamespace.Id | Should -Not -BeNullOrEmpty
        { Get-ZNK8SClusterNamespaceInboundRule -K8SClusterId $k8sCluster.Id -K8SNamespaceId $k8sClusterNamespace.Id } | Should -Not -Throw
    }
}
