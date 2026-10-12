if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSwitch'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSwitch.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSwitch' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $ip = "10.$(Get-Random -Minimum 100 -Maximum 250).$(Get-Random -Minimum 1 -Maximum 250).$(Get-Random -Minimum 1 -Maximum 250)"
        $switch = $null
        try {
            $switch = New-ZNSwitch -IP $ip -MonitorInterfaceOnOtAdded -MonitorOnInterfaceDiscovery -Name "test-$sfx" -Password 'testP@ssw0rd' -Type 1 -Username 'zero'
            $switch.SwitchId1 | Should -Not -BeNullOrEmpty
            { Update-ZNSwitch -SwitchId $switch.SwitchId1 -IP $ip -MonitorInterfaceOnOtAdded -MonitorOnInterfaceDiscovery -Name "test-$sfx" -Password 'testP@ssw0rd2' -Type 1 -Username 'zero' } | Should -Not -Throw
        } finally {
            # Remove-ZNSwitch no longer exists in the API; deactivate the test switch instead
            if ($switch -and $switch.SwitchId1) { Update-ZNSwitchInactive -SwitchIds @($switch.SwitchId1) -ErrorAction SilentlyContinue }
        }
    }
}
