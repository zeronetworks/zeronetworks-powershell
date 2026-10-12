if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNGroupsOutboundOtRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNGroupsOutboundOtRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNGroupsOutboundOtRule' {
    It 'UpdateExpanded' {
        $group = (Get-ZNGroup -Search "3D Printer").Items | where {$_.Name -eq "3D Printer"} | Select-Object -First 1
        $group | Should -Not -BeNullOrEmpty
        $destination = (Get-ZNGroupsOutboundOtRulesDestinationCandidate -GroupType ot -GroupId $group.Id -Search "Any asset").Items | where {$_.Id -like "b:*"} | Select-Object -First 1
        $destination | Should -Not -BeNullOrEmpty
        $protocolList = New-ZNProtocolsList -Protocol udp -LocalPorts (Get-Random -Minimum 1025 -Maximum 65000)
        $description = "NewDescription" + (Get-Random -Minimum 1 -Maximum 100000)
        $rule = $null
        try {
            $rule = New-ZNGroupsOutboundOtRule -GroupId $group.Id -GroupType ot -Action 1 -LocalEntityId $group.Id -ProtocolsList $protocolList -ShouldBuildMirrorRules:$true -State 1 -LocalProcessesList @("*") -ExcludedLocalIdsList @() -RemoteEntitiesIdList @($destination.Id)
            $rule.ItemId | Should -Not -BeNullOrEmpty
            Update-ZNGroupsOutboundOtRule -GroupId $group.Id -GroupType ot -RuleId $rule.ItemId -Description $description
            $updated = Get-ZNGroupsOutboundOtRule -GroupId $group.Id -GroupType ot -RuleId $rule.ItemId
            $updated.ItemDescription | Should -Be $description
        }
        finally {
            if ($rule -and $rule.ItemId) { Remove-ZNGroupsOutboundOtRule -GroupId $group.Id -GroupType ot -RuleId $rule.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
