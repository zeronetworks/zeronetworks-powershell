if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNSettingsPostureChecksExcludedUsersUserCandidate'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNSettingsPostureChecksExcludedUsersUserCandidate.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNSettingsPostureChecksExcludedUsersUserCandidate' {
    It 'Get' {
        (Get-ZNSettingsPostureChecksExcludedUsersUserCandidate).Items.Count | Should -BeGreaterThan 0
    }
}
