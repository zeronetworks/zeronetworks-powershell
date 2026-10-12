$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNGroupsMfaInboundPolicy.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Get-ZNGroupsMfaInboundPolicy' {
    It 'List' {
        $group = (Get-ZNGroup -Search "domain controllers").Items | where {$_.id -like "g:t:*"} | Select-Object -First 1
        $group | Should -Not -BeNullOrEmpty
        $source = (Get-ZNGroupsMfaInboundPoliciesSourceCandidate -GroupId $group.id -GroupType tag -search "Any Asset").Items | Select-Object -First 1
        if (-not $source) { $source = (Get-ZNGroupsMfaInboundPoliciesSourceCandidate -GroupId $group.id -GroupType tag -search "Monitored assets").Items | Select-Object -First 1 }
        if (-not $source) { $source = (Get-ZNGroupsMfaInboundPoliciesSourceCandidate -GroupId $group.id -GroupType tag).Items | Select-Object -First 1 }
        $source | Should -Not -BeNullOrEmpty
        $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcEntityInfosItem]::new()
        $sourceEntity.Id = $source.Id
        $sourceUser = (Get-ZNGroupsMfaInboundPoliciesSourceUserCandidate -GroupId $group.id -GroupType tag -search "Any User").Items | Select-Object -First 1
        $sourceUser | Should -Not -BeNullOrEmpty
        $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcUserInfosItem]::new()
        $sourceUserEntity.Id = $sourceUser.Id
        [string]$dstPorts = Get-Random -Minimum 20000 -Maximum 60000
        $portsList = New-ZNPortsList -Empty
        $created = $null
        try {
            $created = New-ZNGroupsMfaInboundPolicy -GroupId $group.id -GroupType tag -AdditionalPortsList $portsList -DstEntityInfoId $group.id -DstPort $dstPorts -DstProcessNames @("*") -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $created.ItemId | Should -Not -BeNullOrEmpty
            (Get-ZNGroupsMfaInboundPolicy -GroupId $group.id -GroupType tag).Items | Should -Not -BeNullOrEmpty
        }
        finally {
            if ($created -and $created.ItemId) { Remove-ZNGroupsMfaInboundPolicy -GroupId $group.id -GroupType tag -ReactivePolicyId $created.ItemId -ErrorAction SilentlyContinue }
        }
    }

    It 'Get' {
        $group = (Get-ZNGroup -Search "domain controllers").Items | where {$_.id -like "g:t:*"} | Select-Object -First 1
        $group | Should -Not -BeNullOrEmpty
        $source = (Get-ZNGroupsMfaInboundPoliciesSourceCandidate -GroupId $group.id -GroupType tag -search "Any Asset").Items | Select-Object -First 1
        if (-not $source) { $source = (Get-ZNGroupsMfaInboundPoliciesSourceCandidate -GroupId $group.id -GroupType tag -search "Monitored assets").Items | Select-Object -First 1 }
        if (-not $source) { $source = (Get-ZNGroupsMfaInboundPoliciesSourceCandidate -GroupId $group.id -GroupType tag).Items | Select-Object -First 1 }
        $source | Should -Not -BeNullOrEmpty
        $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcEntityInfosItem]::new()
        $sourceEntity.Id = $source.Id
        $sourceUser = (Get-ZNGroupsMfaInboundPoliciesSourceUserCandidate -GroupId $group.id -GroupType tag -search "Any User").Items | Select-Object -First 1
        $sourceUser | Should -Not -BeNullOrEmpty
        $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcUserInfosItem]::new()
        $sourceUserEntity.Id = $sourceUser.Id
        [string]$dstPorts = Get-Random -Minimum 20000 -Maximum 60000
        $portsList = New-ZNPortsList -Empty
        $created = $null
        try {
            $created = New-ZNGroupsMfaInboundPolicy -GroupId $group.id -GroupType tag -AdditionalPortsList $portsList -DstEntityInfoId $group.id -DstPort $dstPorts -DstProcessNames @("*") -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $created.ItemId | Should -Not -BeNullOrEmpty
            (Get-ZNGroupsMfaInboundPolicy -GroupId $group.id -GroupType tag -ReactivePolicyId $created.ItemId).ItemId | Should -Be $created.ItemId
        }
        finally {
            if ($created -and $created.ItemId) { Remove-ZNGroupsMfaInboundPolicy -GroupId $group.id -GroupType tag -ReactivePolicyId $created.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
