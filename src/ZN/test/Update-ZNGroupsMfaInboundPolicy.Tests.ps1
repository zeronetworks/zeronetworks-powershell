if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNGroupsMfaInboundPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNGroupsMfaInboundPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNGroupsMfaInboundPolicy' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $name = "poshgroupsinbound-$sfx"
        $group = (Get-ZNGroup -Search "domain controllers").Items | where {$_.id -like "g:t:*"} | Select-Object -First 1
        $group | Should -Not -BeNullOrEmpty
        $source = (Get-ZNMfaInboundPoliciesSourceCandidate -search "Any Asset").Items | Select-Object -First 1
        if (-not $source) { $source = (Get-ZNMfaInboundPoliciesSourceCandidate -search "Monitored assets").Items | Select-Object -First 1 }
        if (-not $source) { $source = (Get-ZNMfaInboundPoliciesSourceCandidate).Items | Select-Object -First 1 }
        $source | Should -Not -BeNullOrEmpty
        $sourceUser = (Get-ZNMfaInboundPoliciesSourceUserCandidate -search "Any User").Items | Select-Object -First 1
        $sourceUser | Should -Not -BeNullOrEmpty
        $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcEntityInfosItem]::new()
        $sourceEntity.Id = $source.Id
        $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcUserInfosItem]::new()
        $sourceUserEntity.Id = $sourceUser.Id
        [string]$dstPorts = Get-Random -Minimum 1025 -Maximum 65000
        $portsList = New-ZNPortsList -Empty
        $policy = $null
        try {
            $policy = New-ZNMfaInboundPolicy -Name $name -AdditionalPortsList $portsList -DstEntityInfoId $group.Id -DstPort $dstPorts -DstProcessNames @("*") -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $policy.ItemId | Should -Not -BeNullOrEmpty
            $newdescription = "new description $sfx"
            Update-ZNGroupsMfaInboundPolicy -GroupId $group.id -GroupType tag -ReactivePolicyId $policy.ItemId -Description $newdescription
            $updatedPolicy = Get-ZNGroupsMfaInboundPolicy -GroupId $group.id -GroupType tag -ReactivePolicyId $policy.ItemId
            $updatedPolicy.ItemDescription | Should -Be $newdescription
        }
        finally {
            if ($policy -and $policy.ItemId) { Remove-ZNMfaInboundPolicy -ReactivePolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
