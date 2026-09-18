if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNK8SClusterService'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNK8SClusterService.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNK8SClusterService' {
    It 'List' {
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
        (Get-ZNK8SClusterService -K8SClusterId $k8scluster.Id).Items.Count | Should -BeGreaterThan 0
    }

    It 'Get' {
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
        $k8sService = (Get-ZNK8SClusterService -K8SClusterId $k8scluster.Id).Items | select -First 1
        (Get-ZNK8SClusterService -K8SClusterId $k8scluster.Id -K8SServiceId $k8sService.Id).EntityId | Should -Be $k8sService.Id
    }
}
