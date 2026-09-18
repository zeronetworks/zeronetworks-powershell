if(($null -eq $TestName) -or ($TestName -contains 'New-ZNK8SClusterDesiredPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNK8SClusterDesiredPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNK8SClusterDesiredPolicy' {
    It 'CreateExpanded' {
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
        $rule = New-ZNK8SDesiredRuleBody -Action Allow -Direction Inbound -NamespaceName "powershell" -NetworkPolicyName "testpolicy3"
        $newpolicy = New-ZNK8SClusterDesiredPolicy -K8SClusterId $k8scluster.Id -IsEgressPolicy -IsIngressPolicy -Name "wewpolicy" -NamespaceName "powershell" -DesiredRules @($rule) 
        $newpolicy.ItemId | Should -Not -BeNullOrEmpty
        Remove-ZNK8SClusterDesiredPolicy -K8SClusterId $k8scluster.Id -PolicyId $newpolicy.ItemId
    }
}
