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
        $random = Get-Random -Minimum 1 -Maximum 100
        $k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
        $rule = (Get-ZNK8SClusterRule -K8SClusterId $k8scluster.id).Items | where {$_.IsDesired -eq $true} | where {$_.Description -like "*powershell"}
        $updatedRule = Update-ZNK8SClusterDesiredRule -K8SClusterId $k8scluster.Id -RuleId $rule.id -Description "powershell$random"
        $updatedRule.Description | Should -Be "powershell$random"
    }
}
