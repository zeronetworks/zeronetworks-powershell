if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNK8SNamespaceWorkloadLabel'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNK8SNamespaceWorkloadLabel.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNK8SNamespaceWorkloadLabel' {
    It 'Get' {
        $k8sCluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "okd"} | Select-Object -First 1
        $k8sCluster | Should -Not -BeNullOrEmpty
        $k8sworkload = ((Get-ZNK8SClusterWorkload -K8SClusterId $k8sCluster.Id -Limit 400).Items | where {$_.Name -eq "tcp-client"}) | Select-Object -First 1
        $k8sworkload | Should -Not -BeNullOrEmpty
        $k8snamespace = $null
        foreach ($ns in (Get-ZNK8SClusterNamespace -K8SClusterId $k8sCluster.Id -Limit 400).Items) {
            $match = (Get-ZNK8SNamespaceWorkload -K8SNamespaceId $ns.Id -Limit 400).Items | where {$_.Id -eq $k8sworkload.Id} | Select-Object -First 1
            if ($match) { $k8snamespace = $ns; break }
        }
        $k8snamespace | Should -Not -BeNullOrEmpty
        $labels = Get-ZNK8SNamespaceWorkloadLabel -K8SNamespaceId $k8snamespace.Id -K8SWorkloadId $k8sworkload.Id
        $labels.Items.Count | Should -beGreaterThan 0
    }
}
