if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNSwitchOutboundOtRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNSwitchOutboundOtRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNSwitchOutboundOtRule' {
    It 'Delete' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $policy = $null
        $removed = $false
        try {
            $switch = (Get-ZNSwitch).Items | Select-Object -First 1
            $switch | Should -Not -BeNullOrEmpty
            $protocolsList = New-ZNProtocolsList -Protocol tcp -LocalPorts (Get-Random -Minimum 1000 -Maximum 60000)
            $destination = Invoke-ZNEncodeEntityIp -Ip "10.$(Get-Random -Minimum 1 -Maximum 254).$(Get-Random -Minimum 1 -Maximum 254).$(Get-Random -Minimum 1 -Maximum 254)"
            $destination | Should -Not -BeNullOrEmpty
            $source = (Get-ZNInboundOtRulesSourceCandidate -Search "otv2").items | Select-Object -First 1
            $source | Should -Not -BeNullOrEmpty
            $policy = New-ZNSwitchOutboundOtRule -SwitchId $switch.id -Action 1 -Direction 2 -localEntityId $source.Id -RemoteEntitiesIdList @($destination.id) -protocolsList $protocolsList -state 1 -LocalProcessesList @("*") -ExcludedLocalIdsList @() -ShouldBuildMirrorRules
            $policy.ItemId | Should -Not -BeNullOrEmpty
            { Remove-ZNSwitchOutboundOtRule -SwitchId $switch.id -RuleId $policy.ItemId } | Should -Not -Throw
            $removed = $true
        }
        finally {
            if (-not $removed -and $policy -and $policy.ItemId) { Remove-ZNSwitchOutboundOtRule -SwitchId $switch.id -RuleId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
