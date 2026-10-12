if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNInboundOtRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNInboundOtRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNInboundOtRule' {
    It 'UpdateExpanded' {
        $destination = (Get-ZNInboundOtRulesDestinationCandidate -Search "otv2").items | Select-Object -First 1
        $destination | Should -Not -BeNullOrEmpty
        $source = Invoke-ZNEncodeEntityip -IP "10.$(Get-Random -Minimum 1 -Maximum 250).$(Get-Random -Minimum 1 -Maximum 250).$(Get-Random -Minimum 1 -Maximum 250)"
        $protocolsList = New-ZNProtocolsList -Protocol tcp -LocalPorts (Get-Random -Minimum 1025 -Maximum 65000)
        $description = "Updated $(Get-Random -Minimum 1 -Maximum 100000)"
        $rule = $null
        try {
            $rule = New-ZNInboundOtRule -Action 1 -Direction 1 -LocalEntityId $destination.Id -RemoteEntitiesIdList @($source.id) -ProtocolsList $protocolsList -State 1 -LocalProcessesList @("*") -ExcludedLocalIdsList @() -ShouldBuildMirrorRules
            $rule.ItemId | Should -Not -BeNullOrEmpty
            Update-ZNInboundOtRule -RuleId $rule.ItemId -Description $description
            (Get-ZNInboundOtRule -RuleId $rule.ItemId).ItemDescription | Should -Be $description
        }
        finally {
            if ($rule -and $rule.ItemId) { Remove-ZNInboundOtRule -RuleId $rule.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
