if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNUserOutboundRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNUserOutboundRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNUserOutboundRule' {
    It 'Delete' {
        $rule = $null
        $removed = $false
        $user = (Get-ZNUser -Search zero).Items | where {$_.Name -eq "zero"} | Select-Object -First 1
        $user | Should -Not -BeNullOrEmpty
        [string]$port = Get-Random -Minimum 1025 -Maximum 65000
        $portsList = New-ZNPortsList -Protocol TCP -Ports $port
        $source = (Get-ZNOutboundRulesSourceCandidate -search "All Segmented Assets").Items | Select-Object -First 1
        $source | Should -Not -BeNullOrEmpty
        $destination = (Get-ZNOutboundRulesDestinationCandidate -Search FS01 -RuleType 3).Items | Select-Object -First 1
        $destination | Should -Not -BeNullOrEmpty
        $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.SrcUsersListItem]::new()
        $sourceUserEntity.Id = $user.id
        try {
            # creating through /users/{id}/protection/rules/outbound is rejected by the API ("localEntityId must be equals to entity in path"),
            # so create the user-sourced rule with the generic outbound cmdlet and remove it through the user cmdlet under test
            $rule = New-ZNOutboundRule -Action 1 -LocalEntityId $source.Id -LocalProcessesList @("*") -PortsList $portsList -RemoteEntityIdsList @($destination.id) -State 1 -SrcUsersList @($sourceUserEntity) -Name "RemoveUserOutbound-$port"
            $rule.ItemId | Should -Not -BeNullOrEmpty -Because "$($rule.Error1) $($rule.Message)"
            { Remove-ZNUserOutboundRule -UserId $user.id -RuleId $rule.ItemId } | Should -Not -Throw
            $removed = $true
        }
        finally {
            if (-not $removed -and $rule -and $rule.ItemId) { Remove-ZNUserOutboundRule -UserId $user.id -RuleId $rule.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
