if(($null -eq $TestName) -or ($TestName -contains 'New-ZNMfaInboundPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNMfaInboundPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNMfaInboundPolicy' {
    It 'CreateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $name = "poshinbound-$sfx"
        $policy = $null
        try {
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
            [string]$dstPorts = Get-Random -Minimum 1 -Maximum 65000
            $portsList = New-ZNPortsList -Empty
            $policy = New-ZNMfaInboundPolicy -Name $name -AdditionalPortsList $portsList -DstEntityInfoId $destination.Id -DstPort $dstPorts -DstProcessNames @("*") -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $policy.ItemId | Should -Not -BeNullOrEmpty
        } finally {
            if ($policy -and $policy.ItemId) {
                Remove-ZNMfaInboundPolicy -ReactivePolicyId $policy.ItemId -ErrorAction SilentlyContinue
            } else {
                # create may have succeeded server side without a usable id: remove any leftover by name
                $all = Get-ZNMfaInboundPolicy -ErrorAction SilentlyContinue
                $list = if ($all.Items) { $all.Items } else { $all }
                foreach ($p in ($list | where {$_.Name -eq $name})) { Remove-ZNMfaInboundPolicy -ReactivePolicyId $p.Id -ErrorAction SilentlyContinue }
            }
        }
    }
}
