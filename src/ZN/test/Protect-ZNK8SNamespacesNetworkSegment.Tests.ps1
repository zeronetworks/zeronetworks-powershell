if(($null -eq $TestName) -or ($TestName -contains 'Protect-ZNK8SNamespacesNetworkSegment'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Protect-ZNK8SNamespacesNetworkSegment.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Protect-ZNK8SNamespacesNetworkSegment' {
    It 'ProtectExpanded' {
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
        $k8snamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8scluster.id -Limit 400).Items | where {$_.Name -eq "powershell"}
        { Protect-ZNK8SNamespacesNetworkSegment -NamespaceIds @($k8snamespace.id) } | Should -Not -Throw
        Unprotect-ZNK8SNamespacesNetworkSegment -NamespaceIds @($k8snamespace.id)
    }
}
