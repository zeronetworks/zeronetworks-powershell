if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNK8SWorkloadLabel'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNK8SWorkloadLabel.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNK8SWorkloadLabel' {
    It 'Get' {
        $k8sWorkload = (Get-ZNK8SWorkload -Limit 400).Items | Where {$_.Name -eq "znk8s-visibility"} | Select-Object -First 1
        $k8sWorkload | Should -Not -BeNullOrEmpty
        (Get-ZNK8SWorkloadLabel -K8SWorkloadId ([string]$k8sWorkload.Id)).Items.Count | Should -BeGreaterThan 0
    }
}
