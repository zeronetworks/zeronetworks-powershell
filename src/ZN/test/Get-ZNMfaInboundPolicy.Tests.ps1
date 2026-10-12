if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNMfaInboundPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNMfaInboundPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNMfaInboundPolicy' {
    It 'List' {
        $destination = (Get-ZNMfaInboundPoliciesDestinationCandidate -Search "All segmented assets").Items | Select-Object -First 1
        $destination | Should -Not -BeNullOrEmpty
        $source = (Get-ZNMfaInboundPoliciesSourceCandidate -search "Any Asset").Items | Select-Object -First 1
        if (-not $source) { $source = (Get-ZNMfaInboundPoliciesSourceCandidate -search "Monitored assets").Items | Select-Object -First 1 }
        if (-not $source) { $source = (Get-ZNMfaInboundPoliciesSourceCandidate).Items | Select-Object -First 1 }
        $source | Should -Not -BeNullOrEmpty
        $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcEntityInfosItem]::new()
        $sourceEntity.Id = $source.Id
        $sourceUser = (Get-ZNMfaInboundPoliciesSourceUserCandidate -search "Any User").Items | Select-Object -First 1
        $sourceUser | Should -Not -BeNullOrEmpty
        $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcUserInfosItem]::new()
        $sourceUserEntity.Id = $sourceUser.Id
        [string]$dstPorts = Get-Random -Minimum 20000 -Maximum 65000
        $portsList = New-ZNPortsList -Empty
        $policy = $null
        try {
            $policy = New-ZNMfaInboundPolicy -AdditionalPortsList $portsList -DstEntityInfoId $destination.Id -DstPort $dstPorts -DstProcessNames @("*") -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $policy.ItemId | Should -Not -BeNullOrEmpty
            (Get-ZNMfaInboundPolicy).Items | Should -Not -BeNullOrEmpty
        }
        finally {
            if ($policy -and $policy.ItemId) { Remove-ZNMfaInboundPolicy -ReactivePolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }

    It 'Get' {
        $destination = (Get-ZNMfaInboundPoliciesDestinationCandidate -Search "All segmented assets").Items | Select-Object -First 1
        $destination | Should -Not -BeNullOrEmpty
        $source = (Get-ZNMfaInboundPoliciesSourceCandidate -search "Any Asset").Items | Select-Object -First 1
        if (-not $source) { $source = (Get-ZNMfaInboundPoliciesSourceCandidate -search "Monitored assets").Items | Select-Object -First 1 }
        if (-not $source) { $source = (Get-ZNMfaInboundPoliciesSourceCandidate).Items | Select-Object -First 1 }
        $source | Should -Not -BeNullOrEmpty
        $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcEntityInfosItem]::new()
        $sourceEntity.Id = $source.Id
        $sourceUser = (Get-ZNMfaInboundPoliciesSourceUserCandidate -search "Any User").Items | Select-Object -First 1
        $sourceUser | Should -Not -BeNullOrEmpty
        $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcUserInfosItem]::new()
        $sourceUserEntity.Id = $sourceUser.Id
        [string]$dstPorts = Get-Random -Minimum 20000 -Maximum 65000
        $portsList = New-ZNPortsList -Empty
        $policy = $null
        try {
            $policy = New-ZNMfaInboundPolicy -AdditionalPortsList $portsList -DstEntityInfoId $destination.Id -DstPort $dstPorts -DstProcessNames @("*") -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $policy.ItemId | Should -Not -BeNullOrEmpty
            (Get-ZNMfaInboundPolicy -ReactivePolicyId $policy.ItemId).ItemId | Should -Be $policy.ItemId
        }
        finally {
            if ($policy -and $policy.ItemId) { Remove-ZNMfaInboundPolicy -ReactivePolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
