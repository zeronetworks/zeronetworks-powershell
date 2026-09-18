if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNSettingsK8SAntiTamperingConfig'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNSettingsK8SAntiTamperingConfig.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNSettingsK8SAntiTamperingConfig' {
    It 'Get' {
        (Get-ZNSettingsK8SAntiTamperingConfig).AuditCooldownMinutes | Should -Not -BeNullOrEmpty
    }
}
