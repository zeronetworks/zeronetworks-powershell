if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNK8SClusterDesiredRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNK8SClusterDesiredRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNK8SClusterDesiredRule' {
    It 'DeleteExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $policy = $null
        $rule = $null
        $removed = $false
        $k8scluster = $null
        try {
            $k8scluster = (Get-ZNK8SCluster).Items | Where-Object {$_.Name -eq "rke"} | Select-Object -First 1
            if (-not $k8scluster) { $k8scluster = (Get-ZNK8SCluster).Items | Select-Object -First 1 }
            $k8scluster | Should -Not -BeNullOrEmpty
            # a desired rule must belong to an existing desired policy, so create a throwaway one first
            $body = New-ZNK8SDesiredRuleBody -Action Allow -Direction Inbound -NamespaceName "powershell" -NetworkPolicyName "rulepolicy-$sfx" -Description "powershell"
            $policy = New-ZNK8SClusterDesiredPolicy -K8SClusterId $k8scluster.Id -IsEgressPolicy -IsIngressPolicy -Name "rulepolicy-$sfx" -NamespaceName "powershell" -DesiredRules @($body)
            $policy.ItemId | Should -Not -BeNullOrEmpty -Because "$($policy.Error1) $($policy.Message)"
            $rule = New-ZNK8SClusterDesiredRule -Action 1 -NetworkPolicyName "rulepolicy-$sfx" -NamespaceName powershell -K8SClusterId $k8scluster.Id -ClusterId $k8scluster.Id -NetworkPolicyId $policy.ItemId -Direction 2
            $rule.ItemId | Should -Not -BeNullOrEmpty -Because "$($rule.Error1) $($rule.Message)"
            { Remove-ZNK8SClusterDesiredRule -K8SClusterId $k8scluster.Id -RuleIds @($rule.ItemId) } | Should -Not -Throw
            $removed = $true
            (Get-ZNK8SClusterRule -K8SClusterId $k8scluster.Id -Limit 400).Items | Where-Object {$_.Id -eq $rule.ItemId} | Should -BeNullOrEmpty
        }
        finally {
            if (-not $removed -and $rule -and $rule.ItemId -and $k8scluster) { Remove-ZNK8SClusterDesiredRule -K8SClusterId $k8scluster.Id -RuleIds @($rule.ItemId) -ErrorAction SilentlyContinue }
            if ($policy -and $policy.ItemId -and $k8scluster) { Remove-ZNK8SClusterDesiredPolicy -K8SClusterId $k8scluster.Id -PolicyIds @($policy.ItemId) -ErrorAction SilentlyContinue }
        }
    }
}
