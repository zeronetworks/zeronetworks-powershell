if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNK8SClusterDesiredRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNK8SClusterDesiredRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNK8SClusterDesiredRule' {
    It 'Get' {
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} | Select-Object -First 1
        if (-not $k8scluster) { $k8scluster = (Get-ZNK8SCluster).Items | Select-Object -First 1 }
        $k8scluster | Should -Not -BeNullOrEmpty
        $rule = (Get-ZNK8SClusterRule -K8SClusterId $k8scluster.Id -Limit 400).Items | where {$_.IsDesired -eq $true} | Select-Object -First 1
        if (-not $rule -or -not $rule.Id) { Set-ItResult -Skipped -Because 'no desired K8S rule exists in the tenant'; return }
        (Get-ZNK8SClusterDesiredRule -K8SClusterId $k8scluster.Id -RuleId $rule.Id).ItemId | Should -Be $rule.Id
    }
}
