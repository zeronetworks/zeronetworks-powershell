$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNAssetMfaInboundPolicy.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Get-ZNAssetMfaInboundPolicy' {
    It 'List' {
        $asset = (Search-ZNAsset -Fqdn linux0.posh.local | Select-Object -First 1).AssetId
        $asset | Should -Not -BeNullOrEmpty
        $source = (Get-ZNAssetMfaInboundPoliciesSourceCandidate -AssetId $asset -search "Any Asset").Items | Select-Object -First 1
        if (-not $source) { $source = (Get-ZNAssetMfaInboundPoliciesSourceCandidate -AssetId $asset -search "Monitored assets").Items | Select-Object -First 1 }
        if (-not $source) { $source = (Get-ZNAssetMfaInboundPoliciesSourceCandidate -AssetId $asset).Items | Select-Object -First 1 }
        $source | Should -Not -BeNullOrEmpty
        $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcEntityInfosItem]::new()
        $sourceEntity.Id = $source.Id
        $sourceUser = (Get-ZNAssetMfaInboundPoliciesSourceUserCandidate -AssetId $asset -search "Any User").Items | Select-Object -First 1
        $sourceUser | Should -Not -BeNullOrEmpty
        $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcUserInfosItem]::new()
        $sourceUserEntity.Id = $sourceUser.Id
        [string]$dstPorts = Get-Random -Minimum 20000 -Maximum 60000
        $portsList = New-ZNPortsList -Empty
        $created = $null
        try {
            $created = New-ZNAssetMfaInboundPolicy -AssetId $asset -AdditionalPortsList $portsList -DstEntityInfoId $asset -DstPort $dstPorts -DstProcessNames @("*") -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $created.ItemId | Should -Not -BeNullOrEmpty
            (Get-ZNAssetMfaInboundPolicy -AssetId $asset).Items | Should -Not -BeNullOrEmpty
        }
        finally {
            if ($created -and $created.ItemId) { Remove-ZNAssetMfaInboundPolicy -AssetId $asset -ReactivePolicyId $created.ItemId -ErrorAction SilentlyContinue }
        }
    }

    It 'Get' {
        $asset = (Search-ZNAsset -Fqdn linux0.posh.local | Select-Object -First 1).AssetId
        $asset | Should -Not -BeNullOrEmpty
        $source = (Get-ZNAssetMfaInboundPoliciesSourceCandidate -AssetId $asset -search "Any Asset").Items | Select-Object -First 1
        if (-not $source) { $source = (Get-ZNAssetMfaInboundPoliciesSourceCandidate -AssetId $asset -search "Monitored assets").Items | Select-Object -First 1 }
        if (-not $source) { $source = (Get-ZNAssetMfaInboundPoliciesSourceCandidate -AssetId $asset).Items | Select-Object -First 1 }
        $source | Should -Not -BeNullOrEmpty
        $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcEntityInfosItem]::new()
        $sourceEntity.Id = $source.Id
        $sourceUser = (Get-ZNAssetMfaInboundPoliciesSourceUserCandidate -AssetId $asset -search "Any User").Items | Select-Object -First 1
        $sourceUser | Should -Not -BeNullOrEmpty
        $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcUserInfosItem]::new()
        $sourceUserEntity.Id = $sourceUser.Id
        [string]$dstPorts = Get-Random -Minimum 20000 -Maximum 60000
        $portsList = New-ZNPortsList -Empty
        $created = $null
        try {
            $created = New-ZNAssetMfaInboundPolicy -AssetId $asset -AdditionalPortsList $portsList -DstEntityInfoId $asset -DstPort $dstPorts -DstProcessNames @("*") -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $created.ItemId | Should -Not -BeNullOrEmpty
            (Get-ZNAssetMfaInboundPolicy -AssetId $asset -ReactivePolicyId $created.ItemId).ItemId | Should -Be $created.ItemId
        }
        finally {
            if ($created -and $created.ItemId) { Remove-ZNAssetMfaInboundPolicy -AssetId $asset -ReactivePolicyId $created.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
