if(($null -eq $TestName) -or ($TestName -contains 'New-ZNSwitch'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNSwitch.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNSwitch' {
    It 'CreateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $ip = "10.$(Get-Random -Minimum 1 -Maximum 254).$(Get-Random -Minimum 1 -Maximum 254).$(Get-Random -Minimum 1 -Maximum 254)"
        $switch = $null
        try {
            $switch = New-ZNSwitch -Ip $ip -MonitorInterfaceOnOtAdded -MonitorOnInterfaceDiscovery -Name "new-switch-$sfx" -Password "test" -Username "test" -Type 1
            $switch.SwitchId1 | Should -Not -BeNullOrEmpty
        } finally {
            # Remove-ZNSwitch is not exported by the module anymore; clean up only if it exists
            if ($switch -and $switch.SwitchId1 -and (Get-Command Remove-ZNSwitch -ErrorAction SilentlyContinue)) { Remove-ZNSwitch -SwitchId $switch.SwitchId1 -ErrorAction SilentlyContinue }
        }
    }
}
