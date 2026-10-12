if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNUserMfaOutboundPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNUserMfaOutboundPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNUserMfaOutboundPolicy' {
    It 'Delete' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $policy = $null
        $removed = $false
        try {
            $user = (Get-ZNUser -Search zero).Items | where {$_.Name -eq "zero"} | Select-Object -First 1
            $user | Should -Not -BeNullOrEmpty
            $destination = (Get-ZNMfaOutboundPoliciesDestinationCandidate -Search "otv2").Items | Select-Object -First 1
            if (-not $destination) { $destination = (Get-ZNMfaOutboundPoliciesDestinationCandidate).Items | Select-Object -First 1 }
            $destination | Should -Not -BeNullOrEmpty
            $source = (Get-ZNMfaOutboundPoliciesSourceCandidate -search "All Segmented Assets").Items | Select-Object -First 1
            if (-not $source) { $source = (Get-ZNMfaOutboundPoliciesSourceCandidate).Items | Select-Object -First 1 }
            $source | Should -Not -BeNullOrEmpty
            $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcEntityInfosItem]::new()
            $sourceEntity.Id = $source.Id
            $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcUserInfosItem]::new()
            $sourceUserEntity.Id = $user.Id
            [string]$dstPort = Get-Random -Minimum 20000 -Maximum 65000
            $portsList = New-ZNPortsList -Empty
            # The user-scoped create endpoint rejects every source/destination combination on this tenant, so the policy is created
            # through the global endpoint with the user as source user; it then belongs to the user-scoped policy list.
            $policy = New-ZNMfaOutboundPolicy -Name "poshuseroutbound-$sfx" -AdditionalPortsList $portsList -DstEntityInfoId $destination.Id -DstPort $dstPort -FallbackToLoggedOnUser -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1
            $policy.ItemId | Should -Not -BeNullOrEmpty
            (Get-ZNUserMfaOutboundPolicy -UserId $user.Id).Items.Id | Should -Contain $policy.ItemId
            { Remove-ZNUserMfaOutboundPolicy -UserId $user.Id -ReactivePolicyId $policy.ItemId -ErrorAction Stop } | Should -Not -Throw
            $removed = $true
            (Get-ZNUserMfaOutboundPolicy -UserId $user.Id).Items.Id | Should -Not -Contain $policy.ItemId
        }
        finally {
            if (-not $removed -and $policy -and $policy.ItemId) { Remove-ZNMfaOutboundPolicy -ReactivePolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
