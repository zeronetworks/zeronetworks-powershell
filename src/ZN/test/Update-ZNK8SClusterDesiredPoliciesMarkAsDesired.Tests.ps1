<<<<<<<< Updated upstream:src/ZN/test/Update-ZNK8SClusterDesiredPoliciesMarkAsDesired.Tests.ps1
if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNK8SClusterDesiredPoliciesMarkAsDesired'))
========
if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNNetworkAlert'))
>>>>>>>> Stashed changes:src/ZN/test/Update-ZNNetworkAlert.Tests.ps1
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
<<<<<<<< Updated upstream:src/ZN/test/Update-ZNK8SClusterDesiredPoliciesMarkAsDesired.Tests.ps1
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNK8SClusterDesiredPoliciesMarkAsDesired.Recording.json'
========
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNNetworkAlert.Recording.json'
>>>>>>>> Stashed changes:src/ZN/test/Update-ZNNetworkAlert.Tests.ps1
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNK8SClusterDesiredPoliciesMarkAsDesired' {
    It 'UpdateExpanded' {
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1 
        $policy = (Get-ZNK8SClusterNetworkPolicy -K8SClusterId $k8scluster.id).Items | where {$_.Name -eq "powershell-netpol"} 
        { Update-ZNK8SClusterDesiredPoliciesMarkAsDesired -K8SClusterId $k8scluster.Id -PolicyIds @($policy.Id) } | Should -Not -Throw
        Remove-ZNK8SClusterDesiredPolicy -K8SClusterId $k8scluster.Id -PolicyId $policy.Id
    }
}
