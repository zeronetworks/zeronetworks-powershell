if(($null -eq $TestName) -or ($TestName -contains 'New-ZNGroupsMfaInboundPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNGroupsMfaInboundPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNGroupsMfaInboundPolicy' {
    It 'CreateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $name = "poshgroupsinbound-$sfx"
        $policy = $null
        $group = $null
        try {
            $group = (Get-ZNGroup -Search "domain controllers").Items | where {$_.id -like "g:t:*"} | Select-Object -First 1
            $group | Should -Not -BeNullOrEmpty
            $source = (Get-ZNGroupsMfaInboundPoliciesSourceCandidate -GroupId $group.Id -GroupType tag -search "Any Asset").Items | Select-Object -First 1
            if (-not $source) { $source = (Get-ZNGroupsMfaInboundPoliciesSourceCandidate -GroupId $group.Id -GroupType tag -search "Monitored assets").Items | Select-Object -First 1 }
            if (-not $source) { $source = (Get-ZNGroupsMfaInboundPoliciesSourceCandidate -GroupId $group.Id -GroupType tag).Items | Select-Object -First 1 }
            $source | Should -Not -BeNullOrEmpty
            $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcEntityInfosItem]::new()
            $sourceEntity.Id = $source.Id
            $sourceUser = (Get-ZNGroupsMfaInboundPoliciesSourceUserCandidate -GroupId $group.Id -GroupType tag -search "Any User").Items | Select-Object -First 1
            $sourceUser | Should -Not -BeNullOrEmpty
            $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcUserInfosItem]::new()
            $sourceUserEntity.Id = $sourceUser.Id
            [string]$dstPorts = Get-Random -Minimum 1 -Maximum 65000
            $portsList = New-ZNPortsList -Empty
            $policy = New-ZNGroupsMfaInboundPolicy -Name $name -GroupId $group.Id -GroupType tag -AdditionalPortsList $portsList -DstEntityInfoId $group.Id -DstPort $dstPorts -DstProcessNames @("*") -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $policy.ItemId | Should -Not -BeNullOrEmpty
        } finally {
            if ($group -and $group.Id) {
                if ($policy -and $policy.ItemId) {
                    Remove-ZNGroupsMfaInboundPolicy -GroupId $group.Id -GroupType tag -ReactivePolicyId $policy.ItemId -ErrorAction SilentlyContinue
                } else {
                    # create may have succeeded server side without a usable id: remove any leftover by name
                    $all = Get-ZNGroupsMfaInboundPolicy -GroupId $group.Id -GroupType tag -ErrorAction SilentlyContinue
                    $list = if ($all.Items) { $all.Items } else { $all }
                    foreach ($p in ($list | where {$_.Name -eq $name})) { Remove-ZNGroupsMfaInboundPolicy -GroupId $group.Id -GroupType tag -ReactivePolicyId $p.Id -ErrorAction SilentlyContinue }
                }
            }
        }
    }
}
