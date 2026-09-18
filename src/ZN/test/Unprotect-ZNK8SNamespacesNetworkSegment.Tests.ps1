if(($null -eq $TestName) -or ($TestName -contains 'Unprotect-ZNK8SNamespacesNetworkSegment'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Unprotect-ZNK8SNamespacesNetworkSegment.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Unprotect-ZNK8SNamespacesNetworkSegment' {
    It 'UnprotectExpanded' {
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
        $k8snamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8scluster.id -Limit 400).Items | where {$_.Name -eq "powershell"}
        Protect-ZNK8SNamespacesNetworkSegment -NamespaceIds @($k8snamespace.id) 
        { Unprotect-ZNK8SNamespacesNetworkSegment -NamespaceIds @($k8snamespace.id) } | Should -Not -Throw
    }
}
