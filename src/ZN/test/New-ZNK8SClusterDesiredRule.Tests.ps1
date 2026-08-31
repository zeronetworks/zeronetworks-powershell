if(($null -eq $TestName) -or ($TestName -contains 'New-ZNK8SClusterDesiredRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNK8SClusterDesiredRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNK8SClusterDesiredRule' {
    It 'CreateExpanded' {
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
        $rule = New-ZNK8SDesiredRule -Action 1 -NetworkPolicyName newpolicy -namespacename powershell -K8SClusterId $k8scluster.id -NetworkPolicyId k:f:rlVqIRC0 -Direction 1
        $rule.ItemId | Should -Not -BeNullOrEmpty
        Remove-ZNK8SClusterDesiredRule -K8SClusterId $k8scluster.id -RuleIds @($rule.ItemId)
    }
}
