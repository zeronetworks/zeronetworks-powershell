if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSwitchInterface'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSwitchInterface.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSwitchInterface' {
    It 'UpdateExpanded' {
        $switch = (Get-ZNSwitch).Items | Select-Object -First 1
        $switch | Should -Not -BeNullOrEmpty
        $interface = (Get-ZNSwitchInterface -SwitchId $switch.Id).Items | Select-Object -Last 1
        $interface | Should -Not -BeNullOrEmpty
        $interfaceName = $interface.Name
        $originalMonitored = [bool]$interface.IsMonitored
        $updated = -not $originalMonitored
        try {
            Update-ZNSwitchInterface -SwitchId $switch.Id -Interfaces @($interfaceName) -ShouldMonitor:$updated
            $after = (Get-ZNSwitchInterface -SwitchId $switch.Id).Items | Where-Object { $_.Name -eq $interfaceName } | Select-Object -First 1
            $after.IsMonitored | Should -Be $updated
        } finally {
            Update-ZNSwitchInterface -SwitchId $switch.Id -Interfaces @($interfaceName) -ShouldMonitor:$originalMonitored -ErrorAction SilentlyContinue
        }
    }
}
