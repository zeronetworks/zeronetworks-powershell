if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNK8SClusterDesiredRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNK8SClusterDesiredRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNK8SClusterDesiredRule' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $newpolicy = $null
        $k8scluster = $null
        try {
            $k8scluster = (Get-ZNK8SCluster).Items | Where-Object {$_.Name -eq "rke"} | Select-Object -First 1
            $k8scluster | Should -Not -BeNullOrEmpty
            $rule = New-ZNK8SDesiredRuleBody -Action Allow -Direction Inbound -NamespaceName "powershell" -NetworkPolicyName "rulepolicy-$sfx" -Description "powershell"
            $newpolicy = New-ZNK8SClusterDesiredPolicy -K8SClusterId $k8scluster.Id -IsEgressPolicy -IsIngressPolicy -Name "rulepolicy-$sfx" -NamespaceName "powershell" -DesiredRules @($rule)
            $newpolicy.ItemId | Should -Not -BeNullOrEmpty
            $existing = (Get-ZNK8SClusterRule -K8SClusterId $k8scluster.Id -Limit 400).Items | Where-Object {$_.NetworkPolicyId -eq $newpolicy.ItemId} | Select-Object -First 1
            $existing | Should -Not -BeNullOrEmpty
            $existing.Id | Should -Not -BeNullOrEmpty
            $random = Get-Random -Minimum 1 -Maximum 100
            $updatedRule = Update-ZNK8SClusterDesiredRule -K8SClusterId $k8scluster.Id -RuleId $existing.Id -Description "powershell$random"
            $updatedRule.ItemDescription | Should -Be "powershell$random"
        }
        finally {
            if ($newpolicy -and $newpolicy.ItemId -and $k8scluster) { Remove-ZNK8SClusterDesiredPolicy -K8SClusterId $k8scluster.Id -PolicyIds @($newpolicy.ItemId) -ErrorAction SilentlyContinue }
        }
    }
}
