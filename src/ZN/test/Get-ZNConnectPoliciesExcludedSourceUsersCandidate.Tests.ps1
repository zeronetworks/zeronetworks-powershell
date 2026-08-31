if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNConnectPoliciesExcludedSourceUsersCandidate'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNConnectPoliciesExcludedSourceUsersCandidate.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNConnectPoliciesExcludedSourceUsersCandidate' {
    It 'List' {
        (Get-ZNConnectPoliciesExcludedSourceUsersCandidate).Items.Count | Should -BeGreaterThan 0
    }
}
