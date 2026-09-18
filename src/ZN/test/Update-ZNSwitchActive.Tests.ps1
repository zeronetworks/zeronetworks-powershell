if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSwitchActive'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSwitchActive.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSwitchActive' {
    It 'SetExpanded1' {
        $newswitch = New-ZNSwitch -ip 1.2.3.4 -MonitorInterfaceOnOtAdded:$false -MonitorOnInterfaceDiscovery:$false -Name "PoshTestSW" -Password "test123" -Username username -Type 1 
        Update-ZNSwitchInactive -SwitchIds @($newswitch.SwitchId1)
        Update-ZNSwitchActive -SwitchIds @($newswitch.SwitchId1)
        $activeSwitch = Get-ZNSwitch -SwitchId $newswitch.SwitchId1
        $activeSwitch.EntityInactiveReason | Should -Be 3
        Update-ZNSwitchInactive -SwitchIds @($newswitch.SwitchId1)
    }
}
