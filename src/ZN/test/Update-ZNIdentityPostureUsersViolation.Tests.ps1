if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNIdentityPostureUsersViolation'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNIdentityPostureUsersViolation.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNIdentityPostureUsersViolation' {
    It 'UpdateExpanded' {
        { Update-ZNIdentityPostureUsersViolation -PostureCheckType PASSWORD_NEVER_EXPIRE -UserIds u:a:2wl9Once -ViolationState 2 } | Should -Not -Throw
        Update-ZNIdentityPostureUsersViolation -PostureCheckType PASSWORD_NEVER_EXPIRE -UserIds u:a:2wl9Once -ViolationState 1
    }
}
