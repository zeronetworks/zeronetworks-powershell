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
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $ip = "10.$(Get-Random -Minimum 100 -Maximum 250).$(Get-Random -Minimum 1 -Maximum 250).$(Get-Random -Minimum 1 -Maximum 250)"
        $newswitch = $null
        try {
            $newswitch = New-ZNSwitch -ip $ip -MonitorInterfaceOnOtAdded:$false -MonitorOnInterfaceDiscovery:$false -Name "PoshTestSWActive-$sfx" -Password "test123" -Username username -Type 1
            $newswitch.SwitchId1 | Should -Not -BeNullOrEmpty
            Update-ZNSwitchInactive -SwitchIds @($newswitch.SwitchId1)
            Update-ZNSwitchActive -SwitchIds @($newswitch.SwitchId1)
            $activeSwitch = Get-ZNSwitch -SwitchId $newswitch.SwitchId1
            $activeSwitch.EntityInactiveReason | Should -Be 3
        } finally {
            # Remove-ZNSwitch no longer exists in the API; deactivate the test switch instead
            if ($newswitch -and $newswitch.SwitchId1) { Update-ZNSwitchInactive -SwitchIds @($newswitch.SwitchId1) -ErrorAction SilentlyContinue }
        }
    }
}
