if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSwitchInboundOtRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSwitchInboundOtRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSwitchInboundOtRule' {
    It 'UpdateExpanded' {
        $switch = (Get-ZNSwitch).Items | Select-Object -First 1
        $switch | Should -Not -BeNullOrEmpty
        $destination = (Get-ZNInboundOtRulesDestinationCandidate -Search "otv2").Items | Select-Object -First 1
        $destination | Should -Not -BeNullOrEmpty
        $protocolsList = New-ZNProtocolsList -Protocol tcp -LocalPorts (Get-Random -Minimum 30000 -Maximum 60000)
        $source = Invoke-ZNEncodeEntityIp -Ip 1.1.1.101
        $description = "Updated $(Get-Random -Minimum 1 -Maximum 100000)"
        $rule = $null
        try {
            # update a rule created here: built-in / pre-existing switch rules are not reliable targets and must not be modified by tests
            $rule = New-ZNSwitchInboundOtRule -SwitchId $switch.Id -Action 1 -Direction 1 -LocalEntityId $destination.Id -RemoteEntitiesIdList @($source.Id) -ProtocolsList $protocolsList -State 1 -LocalProcessesList @("*") -ExcludedLocalIdsList @() -ShouldBuildMirrorRules
            $rule.ItemId | Should -Not -BeNullOrEmpty -Because "$($rule.Error1) $($rule.Message)"
            $result = Update-ZNSwitchInboundOtRule -SwitchId $switch.Id -RuleId $rule.ItemId -Description $description
            $result.Error1 | Should -BeNullOrEmpty -Because "$($result.Message)"
            $updated = Get-ZNSwitchInboundOtRule -SwitchId $switch.Id -RuleId $rule.ItemId
            $updated.ItemDescription | Should -Be $description
        } finally {
            if ($rule -and $rule.ItemId) { Remove-ZNInboundOtRule -RuleId $rule.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
