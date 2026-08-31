if(($null -eq $TestName) -or ($TestName -contains 'New-ZNOutboundOtRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNOutboundOtRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNOutboundOtRule' {
    It 'CreateExpanded' {
        $protocolsList = New-ZNProtocolsList -Protocol tcp -LocalPorts (Get-Random -Min 1 -Max 1024)
        $destination = Invoke-ZNEncodeEntityip -IP 1.1.1.2
        $source = (Get-ZNInboundOtRulesDestinationCandidate -Search "otv2").items
        $rule = New-ZNOutboundOtRule -Action 1 -Direction 2 -localEntityId $source.Id -RemoteEntitiesIdList @($destination.id) -protocolsList $protocolsList -state 1 -LocalProcessesList @("*") -ExcludedLocalIdsList @() -ShouldBuildMirrorRules
        $rule.ItemId | Should -Not -BeNullOrEmpty
        Remove-ZNOutboundOtRule -RuleId $rule.ItemId
    }
}
