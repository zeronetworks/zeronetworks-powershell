if(($null -eq $TestName) -or ($TestName -contains 'Initialize-ZNSwitchNetworkBreakGlass'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Initialize-ZNSwitchNetworkBreakGlass.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Initialize-ZNSwitchNetworkBreakGlass' {
    It 'ActivateExpanded' {
        $switch = (Get-ZNSwitch).Items | Select-Object -First 1
        $switch | Should -Not -BeNullOrEmpty
        $switch.Id | Should -Not -BeNullOrEmpty
        try {
            { Initialize-ZNSwitchNetworkBreakGlass -SwitchId $switch.Id -NetworkBreakGlassEnabled } | Should -Not -Throw
        }
        finally {
            Initialize-ZNSwitchNetworkBreakGlass -SwitchId $switch.Id -NetworkBreakGlassEnabled:$false -ErrorAction SilentlyContinue
        }
    }
}
