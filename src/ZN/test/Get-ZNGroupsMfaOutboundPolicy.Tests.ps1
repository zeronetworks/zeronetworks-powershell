$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNGroupsMfaOutboundPolicy.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Get-ZNGroupsMfaOutboundPolicy' {
    It 'List' {
        $group = (Get-ZNGroup -Search "card readers").Items | Select-Object -First 1
        $group | Should -Not -BeNullOrEmpty
        $source = (Get-ZNGroupsMfaOutboundPoliciesSourceCandidate -GroupId $group.id -GroupType tag -search "All Segmented Assets").Items | Select-Object -First 1
        $source | Should -Not -BeNullOrEmpty
        $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyOutboundBodySrcEntityInfosItem]::new()
        $sourceEntity.Id = $source.Id
        $sourceUser = (Get-ZNGroupsMfaOutboundPoliciesSourceUserCandidate -GroupId $group.id -GroupType tag -search "Any User").Items | Select-Object -First 1
        $sourceUser | Should -Not -BeNullOrEmpty
        $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyOutboundBodySrcUserInfosItem]::new()
        $sourceUserEntity.Id = $sourceUser.Id
        [string]$dstPort = Get-Random -Minimum 20000 -Maximum 60000
        $portsList = New-ZNPortsList -Empty
        $created = $null
        try {
            $created = New-ZNGroupsMfaOutboundPolicy -GroupId $group.id -GroupType tag -AdditionalPortsList $portsList -DstEntityInfoId $group.id -DstPort $dstPort -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $created.ItemId | Should -Not -BeNullOrEmpty
            (Get-ZNGroupsMfaOutboundPolicy -GroupId $group.id -GroupType tag).Items | Should -Not -BeNullOrEmpty
        }
        finally {
            if ($created -and $created.ItemId) { Remove-ZNGroupsMfaOutboundPolicy -GroupId $group.id -GroupType tag -ReactivePolicyId $created.ItemId -ErrorAction SilentlyContinue }
        }
    }

    It 'Get' {
        $group = (Get-ZNGroup -Search "card readers").Items | Select-Object -First 1
        $group | Should -Not -BeNullOrEmpty
        $source = (Get-ZNGroupsMfaOutboundPoliciesSourceCandidate -GroupId $group.id -GroupType tag -search "All Segmented Assets").Items | Select-Object -First 1
        $source | Should -Not -BeNullOrEmpty
        $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyOutboundBodySrcEntityInfosItem]::new()
        $sourceEntity.Id = $source.Id
        $sourceUser = (Get-ZNGroupsMfaOutboundPoliciesSourceUserCandidate -GroupId $group.id -GroupType tag -search "Any User").Items | Select-Object -First 1
        $sourceUser | Should -Not -BeNullOrEmpty
        $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyOutboundBodySrcUserInfosItem]::new()
        $sourceUserEntity.Id = $sourceUser.Id
        [string]$dstPort = Get-Random -Minimum 20000 -Maximum 60000
        $portsList = New-ZNPortsList -Empty
        $created = $null
        try {
            $created = New-ZNGroupsMfaOutboundPolicy -GroupId $group.id -GroupType tag -AdditionalPortsList $portsList -DstEntityInfoId $group.id -DstPort $dstPort -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $created.ItemId | Should -Not -BeNullOrEmpty
            (Get-ZNGroupsMfaOutboundPolicy -GroupId $group.id -GroupType tag -ReactivePolicyId $created.ItemId).ItemId | Should -Be $created.ItemId
        }
        finally {
            if ($created -and $created.ItemId) { Remove-ZNGroupsMfaOutboundPolicy -GroupId $group.id -GroupType tag -ReactivePolicyId $created.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
