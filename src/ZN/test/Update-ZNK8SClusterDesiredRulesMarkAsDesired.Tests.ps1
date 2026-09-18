if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNK8SClusterDesiredRulesMarkAsDesired'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNK8SClusterDesiredRulesMarkAsDesired.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNK8SClusterDesiredRulesMarkAsDesired' {
    It 'UpdateExpanded' {
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
        $rule = (Get-ZNK8SClusterRule -K8SClusterId $k8scluster.id).Items | where {$_.IsDesired -eq $false} | where {$_.NetworkPolicyName -eq "powershell-netpol"} | Select-Object -First 1
        Update-ZNK8SClusterDesiredRulesMarkAsDesired -K8SClusterId $k8scluster.id -RuleIds @($rule.Id)
        $updatedRule = (Get-ZNK8SClusterRule -K8SClusterId $k8scluster.id).Items | where {$_.Id -eq $rule.Id}
        $updatedRule.IsDesired| Should -Be $true
        $policy = (Get-ZNK8SClusterNetworkPolicy -K8SClusterId $k8scluster.id).Items | where {$_.isDesired -eq $true}
        Remove-znK8SClusterDesiredPolicy -K8SClusterId $k8scluster.Id -PolicyId $policy.Id
    }
}
