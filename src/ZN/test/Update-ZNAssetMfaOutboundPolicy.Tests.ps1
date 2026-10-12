$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAssetMfaOutboundPolicy.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Update-ZNAssetMfaOutboundPolicy' {
    It 'UpdateExpanded' {
        $policy = $null
        $asset = (Get-ZNAssetsOt).Items | Select-Object -First 1
        $asset | Should -Not -BeNullOrEmpty
        $asset.Id | Should -Not -BeNullOrEmpty
        $source = (Get-ZNMfaOutboundPoliciesSourceCandidate -search "All Segmented Assets").Items | Select-Object -First 1
        $source | Should -Not -BeNullOrEmpty
        $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyOutboundBodySrcEntityInfosItem]::new()
        $sourceEntity.Id = $source.Id
        $sourceUser = (Get-ZNMfaInboundPoliciesSourceUserCandidate -search "Any User").Items | Select-Object -First 1
        $sourceUser | Should -Not -BeNullOrEmpty
        $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyOutboundBodySrcUserInfosItem]::new()
        $sourceUserEntity.Id = $sourceUser.Id
        [string]$dstPort = Get-Random -Minimum 1 -Maximum 65000
        $portsList = New-ZNPortsList -Empty
        try {
            $policy = New-ZNMfaOutboundPolicy -AdditionalPortsList $portsList -DstEntityInfoId $asset.Id -DstPort $dstPort -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $policy.ItemId | Should -Not -BeNullOrEmpty

            $newdescription = "new description " + (Get-Random -Minimum 1 -Maximum 100)
            Update-ZNAssetMfaOutboundPolicy -AssetId $asset.Id -ReactivePolicyId $policy.ItemId -Description $newdescription
            $updatedPolicy = Get-ZNMfaOutboundPolicy -ReactivePolicyId $policy.ItemId
            $updatedPolicy.ItemDescription | Should -Be $newdescription
        }
        finally {
            if ($policy -and $policy.ItemId) { Remove-ZNMfaOutboundPolicy -ReactivePolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
