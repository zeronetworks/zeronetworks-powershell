if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNInternalAccessPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNInternalAccessPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNInternalAccessPolicy' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $dest = (Get-ZNInternalAccessPolicyDestinationAssetsCandidate).Items | Select-Object -First 1
        $dest | Should -Not -BeNullOrEmpty
        $sourceUser = (Get-ZNInternalAccessPolicySourceUserCandidate -Search "any user").Items | Select-Object -First 1
        $sourceUser | Should -Not -BeNullOrEmpty
        $portsList = New-ZNPortsList -Protocol TCP -Ports (Get-Random -Minimum 20000 -Maximum 60000)
        $iap = $null
        try {
            $iap = New-ZNInternalAccessPolicy -DstAssetId $dest.Id -DstPortsList @($portsList) -DstProcessNamesList @("*") -Name "UpdateIap-$sfx" -RuleDuration 6 -SrcUserIdsList @($sourceUser.Id) -State 1
            $iap.ItemId | Should -Not -BeNullOrEmpty
            Update-ZNInternalAccessPolicy -PolicyId $iap.ItemId -Description "updated-$sfx"
            (Get-ZNInternalAccessPolicy -PolicyId $iap.ItemId).ItemDescription | Should -Be "updated-$sfx"
        }
        finally {
            if ($iap -and $iap.ItemId) { Remove-ZNInternalAccessPolicy -PolicyId $iap.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
