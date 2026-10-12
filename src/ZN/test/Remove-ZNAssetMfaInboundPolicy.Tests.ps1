if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNAssetMfaInboundPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNAssetMfaInboundPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNAssetMfaInboundPolicy' {
    It 'Delete' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $name = "poshassetinbound-$sfx"
        $asset = $null
        $policy = $null
        $removed = $false
        try {
            $asset = (Search-ZNAsset -Fqdn "linux0.posh.local" | Select-Object -First 1).AssetId
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
            [string]$dstPorts = Get-Random -Minimum 1 -Maximum 65000
            $portsList = New-ZNPortsList -Empty
            $policy = New-ZNAssetMfaInboundPolicy -Name $name -AssetId $asset -AdditionalPortsList $portsList -DstEntityInfoId $asset -DstPort $dstPorts -DstProcessNames @("*") -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $policy.ItemId | Should -Not -BeNullOrEmpty
            { Remove-ZNAssetMfaInboundPolicy -AssetId $asset -ReactivePolicyId $policy.ItemId } | Should -Not -Throw
            $removed = $true
        } finally {
            if (-not $removed -and $asset) {
                if ($policy -and $policy.ItemId) {
                    Remove-ZNAssetMfaInboundPolicy -AssetId $asset -ReactivePolicyId $policy.ItemId -ErrorAction SilentlyContinue
                } else {
                    # create may have succeeded server side without a usable id: remove any leftover by name
                    $all = Get-ZNAssetMfaInboundPolicy -AssetId $asset -ErrorAction SilentlyContinue
                    $list = if ($all.Items) { $all.Items } else { $all }
                    foreach ($p in ($list | where {$_.Name -eq $name})) { Remove-ZNAssetMfaInboundPolicy -AssetId $asset -ReactivePolicyId $p.Id -ErrorAction SilentlyContinue }
                }
            }
        }
    }
}
