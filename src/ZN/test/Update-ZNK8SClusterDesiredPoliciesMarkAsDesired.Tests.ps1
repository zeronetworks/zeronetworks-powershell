if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNK8SClusterDesiredPoliciesMarkAsDesired'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNK8SClusterDesiredPoliciesMarkAsDesired.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNK8SClusterDesiredPoliciesMarkAsDesired' {
    It 'UpdateExpanded' {
        $k8scluster = $null
        $policy = $null
        try {
            $k8scluster = (Get-ZNK8SCluster).Items | Where-Object {$_.Name -eq "rke"} | Select-Object -First 1
            $k8scluster | Should -Not -BeNullOrEmpty
            $policy = (Get-ZNK8SClusterNetworkPolicy -K8SClusterId $k8scluster.Id).Items | Where-Object {$_.Name -eq "powershell-netpol"} | Select-Object -First 1
            $policy | Should -Not -BeNullOrEmpty
            $policy.Id | Should -Not -BeNullOrEmpty
            { Update-ZNK8SClusterDesiredPoliciesMarkAsDesired -K8SClusterId $k8scluster.Id -PolicyIds @($policy.Id) } | Should -Not -Throw
        }
        finally {
            if ($policy -and $policy.Id -and $k8scluster) { Remove-ZNK8SClusterDesiredPolicy -K8SClusterId $k8scluster.Id -PolicyIds @($policy.Id) -ErrorAction SilentlyContinue }
        }
    }
}
