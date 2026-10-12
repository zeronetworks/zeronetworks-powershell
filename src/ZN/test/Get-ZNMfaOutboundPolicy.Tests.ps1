if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNMfaOutboundPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNMfaOutboundPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNMfaOutboundPolicy' {
    It 'List' {
        $destination = (Get-ZNMfaOutboundPoliciesDestinationCandidate -Search "Segmented OT/IoT devices").Items | Select-Object -First 1
        $destination | Should -Not -BeNullOrEmpty
        $source = (Get-ZNMfaOutboundPoliciesSourceCandidate -search "All segmented Assets").Items | Select-Object -First 1
        $source | Should -Not -BeNullOrEmpty
        $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyOutboundBodySrcEntityInfosItem]::new()
        $sourceEntity.Id = $source.Id
        $sourceUser = (Get-ZNMfaInboundPoliciesSourceUserCandidate -search "Any User").Items | Select-Object -First 1
        $sourceUser | Should -Not -BeNullOrEmpty
        $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyOutboundBodySrcUserInfosItem]::new()
        $sourceUserEntity.Id = $sourceUser.Id
        [string]$dstPorts = Get-Random -Minimum 20000 -Maximum 65000
        $portsList = New-ZNPortsList -Empty
        $policy = $null
        try {
            $policy = New-ZNMfaOutboundPolicy -AdditionalPortsList $portsList -DstEntityInfoId $destination.Id -DstPort $dstPorts -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $policy.ItemId | Should -Not -BeNullOrEmpty
            (Get-ZNMfaOutboundPolicy).Items | Should -Not -BeNullOrEmpty
        }
        finally {
            if ($policy -and $policy.ItemId) { Remove-ZNMfaOutboundPolicy -ReactivePolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }

    It 'Get' {
        $destination = (Get-ZNMfaOutboundPoliciesDestinationCandidate -Search "Segmented OT/IoT devices").Items | Select-Object -First 1
        $destination | Should -Not -BeNullOrEmpty
        $source = (Get-ZNMfaOutboundPoliciesSourceCandidate -search "All segmented Assets").Items | Select-Object -First 1
        $source | Should -Not -BeNullOrEmpty
        $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyOutboundBodySrcEntityInfosItem]::new()
        $sourceEntity.Id = $source.Id
        $sourceUser = (Get-ZNMfaInboundPoliciesSourceUserCandidate -search "Any User").Items | Select-Object -First 1
        $sourceUser | Should -Not -BeNullOrEmpty
        $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyOutboundBodySrcUserInfosItem]::new()
        $sourceUserEntity.Id = $sourceUser.Id
        [string]$dstPorts = Get-Random -Minimum 20000 -Maximum 65000
        $portsList = New-ZNPortsList -Empty
        $policy = $null
        try {
            $policy = New-ZNMfaOutboundPolicy -AdditionalPortsList $portsList -DstEntityInfoId $destination.Id -DstPort $dstPorts -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $policy.ItemId | Should -Not -BeNullOrEmpty
            (Get-ZNMfaOutboundPolicy -ReactivePolicyId $policy.ItemId).ItemId | Should -Be $policy.ItemId
        }
        finally {
            if ($policy -and $policy.ItemId) { Remove-ZNMfaOutboundPolicy -ReactivePolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
