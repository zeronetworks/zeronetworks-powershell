if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSettingsVersionMaintenanceWindow'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSettingsVersionMaintenanceWindow.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSettingsVersionMaintenanceWindow' {
    It 'UpdateExpanded' {
        $maintwindow = New-ZNSettingsVersionMaintenanceWindow -StartTime 0 -WeekDay Sunday
        Update-ZNSettingsVersionMaintenanceWindow -Product segment-server -MaintenanceWindows @($maintwindow)
        $updateResult = Get-ZNSettingsVersionMaintenanceWindow -Product segment-server
        $updateResult.Weekday | Should -Be 1
    }
}
