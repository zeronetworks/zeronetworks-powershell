if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNNetworkAlertsStatsOverTime'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNNetworkAlertsStatsOverTime.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNNetworkAlertsStatsOverTime' {
    It 'Get' {
        (Get-ZNNetworkAlertsStatsOverTime -TimeFrame 1).count | Should -BeGreaterThan 0
    }
}
