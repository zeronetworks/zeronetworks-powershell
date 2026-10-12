if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSwitchOutboundOtRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSwitchOutboundOtRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSwitchOutboundOtRule' {
    It 'UpdateExpanded' {
        $switch = (Get-ZNSwitch).Items | Select-Object -First 1
        $switch | Should -Not -BeNullOrEmpty
        $rule = (Get-ZNSwitchOutboundOtRule -SwitchId $switch.Id -AddBuiltins).Items | Select-Object -First 1
        $rule | Should -Not -BeNullOrEmpty
        $original = (Get-ZNSwitchOutboundOtRule -SwitchId $switch.Id -RuleId $rule.Id).ItemDescription
        $description = "Updated $(Get-Random -Minimum 1 -Maximum 100000)"
        try {
            Update-ZNSwitchOutboundOtRule -SwitchId $switch.Id -RuleId $rule.Id -Description $description
            $updated = Get-ZNSwitchOutboundOtRule -SwitchId $switch.Id -RuleId $rule.Id
            $updated.ItemDescription | Should -Be $description
        } finally {
            if ($null -ne $original) { Update-ZNSwitchOutboundOtRule -SwitchId $switch.Id -RuleId $rule.Id -Description $original -ErrorAction SilentlyContinue }
        }
    }
}
