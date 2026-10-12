if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNInternalAccessPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNInternalAccessPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNInternalAccessPolicy' {
    It 'Delete' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $policy = $null
        $removed = $false
        try {
            $dest = (Get-ZNInternalAccessPolicyDestinationAssetsCandidate).Items | Select-Object -First 1
            $dest | Should -Not -BeNullOrEmpty
            $portsList = New-ZNPortsList -Protocol TCP -Ports ([string](Get-Random -Minimum 1000 -Maximum 60000))
            $sourceUser = (Get-ZNInternalAccessPolicySourceUserCandidate -Search "any user").Items | Select-Object -First 1
            $sourceUser | Should -Not -BeNullOrEmpty
            $policy = New-ZNInternalAccessPolicy -DstAssetId $dest.id -DstPortsList @($portsList) -DstProcessNamesList @("*") -Name "ManLinuxRemove-$sfx" -RuleDuration 6 -SrcUserIdsList @($sourceUser.id) -State 1
            $policy.ItemId | Should -Not -BeNullOrEmpty
            { Remove-ZNInternalAccessPolicy -PolicyId $policy.ItemId } | Should -Not -Throw
            $removed = $true
        }
        finally {
            if (-not $removed -and $policy -and $policy.ItemId) { Remove-ZNInternalAccessPolicy -PolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
