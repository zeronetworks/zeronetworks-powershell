if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNK8SNamespaceOutboundRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNK8SNamespaceOutboundRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNK8SNamespaceOutboundRule' {
    It 'List' {
        $k8sNamespace = (Get-ZNK8SNamespace -Limit 400).Items | where {$_.Name -eq "znK8s"} | Select-Object -First 1
        if (-not $k8sNamespace) { $k8sNamespace = (Get-ZNK8SNamespace -Limit 400).Items | Select-Object -First 1 }
        $k8sNamespace | Should -Not -BeNullOrEmpty
        $k8sNamespace.Id | Should -Not -BeNullOrEmpty
        { Get-ZNK8SNamespaceOutboundRule -K8SNamespaceId $k8sNamespace.Id } | Should -Not -Throw
    }
}
