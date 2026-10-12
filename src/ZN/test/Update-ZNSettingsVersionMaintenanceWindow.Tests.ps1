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
        $days = 'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'
        $original = Get-ZNSettingsVersionMaintenanceWindow -Product segment-server
        try {
            $maintwindow = New-ZNSettingsVersionMaintenanceWindowItem -StartTime 0 -WeekDay Sunday
            $maintwindow | Should -Not -BeNullOrEmpty
            Update-ZNSettingsVersionMaintenanceWindow -Product segment-server -MaintenanceWindows @($maintwindow)
            $updateResult = Get-ZNSettingsVersionMaintenanceWindow -Product segment-server
            $updateResult.Weekday | Should -Be 1
        } finally {
            # restore the original maintenance window
            $orig = $original | Select-Object -First 1
            if ($orig -and $orig.Weekday -ge 1 -and $orig.Weekday -le 7) {
                $start = if ($null -ne $orig.StartTime) { $orig.StartTime } else { 0 }
                $restore = New-ZNSettingsVersionMaintenanceWindowItem -StartTime $start -WeekDay $days[[int]$orig.Weekday - 1]
                Update-ZNSettingsVersionMaintenanceWindow -Product segment-server -MaintenanceWindows @($restore) -ErrorAction SilentlyContinue
            }
        }
    }
}
