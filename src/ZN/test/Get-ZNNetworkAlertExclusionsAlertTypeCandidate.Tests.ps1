if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNNetworkAlertExclusionsAlertTypeCandidate'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNNetworkAlertExclusionsAlertTypeCandidate.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNNetworkAlertExclusionsAlertTypeCandidate' {
    It 'List' -skip {
        #not implemeneted in staging
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
