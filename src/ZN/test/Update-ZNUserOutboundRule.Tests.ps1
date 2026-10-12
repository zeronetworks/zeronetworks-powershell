if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNUserOutboundRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNUserOutboundRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNUserOutboundRule' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $user = ((Get-ZNUser -Search zero).Items | where {$_.Name -eq "zero"}) | Select-Object -First 1
        $user | Should -Not -BeNullOrEmpty
        $source = (Get-ZNOutboundRulesSourceCandidate -Search "All Segmented Assets").Items | Select-Object -First 1
        $source | Should -Not -BeNullOrEmpty
        $destination = (Get-ZNOutboundRulesDestinationCandidate -Search FS01 -RuleType 3).Items | Select-Object -First 1
        $destination | Should -Not -BeNullOrEmpty
        $portsList = New-ZNPortsList -Protocol TCP -Ports "$(Get-Random -Minimum 20000 -Maximum 60000)"
        $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.SrcUsersListItem]::new()
        $sourceUserEntity.Id = $user.Id
        $description = "Updated-$sfx"
        $rule = $null
        try {
            # creating through /users/{id}/protection/rules/outbound is rejected by the API ("localEntityId must be equals to entity in path"),
            # so create the user-sourced rule with the generic outbound cmdlet and update it through the user cmdlet under test
            $rule = New-ZNOutboundRule -Action 1 -LocalEntityId $source.Id -LocalProcessesList @("*") -PortsList $portsList -RemoteEntityIdsList @($destination.Id) -State 1 -SrcUsersList @($sourceUserEntity) -Name "UpdateUserOutbound-$sfx"
            $rule.ItemId | Should -Not -BeNullOrEmpty -Because "$($rule.Error1) $($rule.Message)"
            $result = Update-ZNUserOutboundRule -UserId $user.Id -RuleId $rule.ItemId -Description $description
            $result.Error1 | Should -BeNullOrEmpty -Because "$($result.Message)"
            $updatedRule = Get-ZNUserOutboundRule -UserId $user.Id -RuleId $rule.ItemId
            $updatedRule.ItemDescription | Should -Be $description
        } finally {
            if ($rule -and $rule.ItemId) { Remove-ZNUserOutboundRule -UserId $user.Id -RuleId $rule.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
