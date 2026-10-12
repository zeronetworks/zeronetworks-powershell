if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNGroupsMfaInboundPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNGroupsMfaInboundPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNGroupsMfaInboundPolicy' {
    It 'Delete' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $policy = $null
        $removed = $false
        try {
            $group = (Get-ZNGroup -Search "domain controllers").Items | Where-Object {$_.id -like "g:t:*"} | Select-Object -First 1
            $group | Should -Not -BeNullOrEmpty
            $source = (Get-ZNGroupsMfaInboundPoliciesSourceCandidate -GroupId $group.Id -GroupType tag -search "Any Asset").Items | Select-Object -First 1
            if (-not $source) { $source = (Get-ZNGroupsMfaInboundPoliciesSourceCandidate -GroupId $group.Id -GroupType tag -search "Monitored assets").Items | Select-Object -First 1 }
            if (-not $source) { $source = (Get-ZNGroupsMfaInboundPoliciesSourceCandidate -GroupId $group.Id -GroupType tag).Items | Select-Object -First 1 }
            $source | Should -Not -BeNullOrEmpty
            $sourceUser = (Get-ZNGroupsMfaInboundPoliciesSourceUserCandidate -GroupId $group.Id -GroupType tag -search "Any User").Items | Select-Object -First 1
            $sourceUser | Should -Not -BeNullOrEmpty
            $sourceEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcEntityInfosItem]::new()
            $sourceEntity.Id = $source.Id
            $sourceUserEntity = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ReactivePolicyInboundBodySrcUserInfosItem]::new()
            $sourceUserEntity.Id = $sourceUser.Id
            [string]$dstPorts = Get-Random -Minimum 1000 -Maximum 65000
            $portsList = New-ZNPortsList -Empty
            $policy = New-ZNGroupsMfaInboundPolicy -GroupId $group.Id -GroupType tag -AdditionalPortsList $portsList -DstEntityInfoId $group.Id -DstPort $dstPorts -DstProcessNames @("*") -FallbackToLoggedOnUser -MfaMethods @(4) -ProtocolType 6 -RuleDuration 6 -SrcEntityInfos @($sourceEntity) -SrcProcessNames @("*") -SrcUserInfos @($sourceUserEntity) -State 1 -OverrideBuiltins:$false -RestrictLoginToOriginatingUser:$false
            $policy.ItemId | Should -Not -BeNullOrEmpty
            { Remove-ZNGroupsMfaInboundPolicy -GroupId $group.Id -GroupType tag -ReactivePolicyId $policy.ItemId } | Should -Not -Throw
            $removed = $true
        }
        finally {
            if (-not $removed -and $policy -and $policy.ItemId) { Remove-ZNGroupsMfaInboundPolicy -GroupId $group.Id -GroupType tag -ReactivePolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
