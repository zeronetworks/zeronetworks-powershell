if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSwitchInactive'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSwitchInactive.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSwitchInactive' {
    It 'SetExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $ip = "10.$(Get-Random -Minimum 100 -Maximum 250).$(Get-Random -Minimum 1 -Maximum 250).$(Get-Random -Minimum 1 -Maximum 250)"
        $newswitch = $null
        try {
            $newswitch = New-ZNSwitch -ip $ip -MonitorInterfaceOnOtAdded:$false -MonitorOnInterfaceDiscovery:$false -Name "PoshTestSWInactive-$sfx" -Password "test123" -Username username -Type 1
            $newswitch.SwitchId1 | Should -Not -BeNullOrEmpty
            Update-ZNSwitchInactive -SwitchIds @($newswitch.SwitchId1)
            $inactiveSwitch = Get-ZNSwitch -SwitchId $newswitch.SwitchId1
            $inactiveSwitch.EntityInactiveReason | Should -Be 2
        } finally {
            # Remove-ZNSwitch no longer exists in the API; make sure the test switch is left inactive
            if ($newswitch -and $newswitch.SwitchId1) { Update-ZNSwitchInactive -SwitchIds @($newswitch.SwitchId1) -ErrorAction SilentlyContinue }
        }
    }
}
