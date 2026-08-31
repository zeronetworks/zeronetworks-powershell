if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNSettingsLinuxProfile'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNSettingsLinuxProfile.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNSettingsLinuxProfile' {
    It 'List' {
        (Get-ZNSettingsLinuxProfile).Count | Should -BeGreaterThan 0
    }

    It 'Get' {
        $linuxProfile = Get-ZNSettingsLinuxProfile | Select-Object -First 1
        (Get-ZNSettingsLinuxProfile -ProfileId $linuxProfile.Id).Id | Should -Be $linuxProfile.Id
    }
}
