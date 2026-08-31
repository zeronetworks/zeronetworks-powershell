if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSettingsPostureCheck'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSettingsPostureCheck.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSettingsPostureCheck' {
    It 'UpdateExpanded' {
        $postureCheck = Update-ZNSettingsPostureCheck -Enabled:$false -Severity 1 -type 1
        $postureCheck.DefinitionEnabled | Should -Be $false
        Update-ZNSettingsPostureCheck -Enabled -Severity 1 -type 1
    }
}
