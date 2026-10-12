if(($null -eq $TestName) -or ($TestName -contains 'New-ZNInternalAccessPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNInternalAccessPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNInternalAccessPolicy' {
    It 'CreateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $intPolicy = $null
        try {
            $dest = (Get-ZNInternalAccessPolicyDestinationAssetsCandidate).Items | select -First 1
            $dest | Should -Not -BeNullOrEmpty
            $portsList = New-ZNPortsList -Protocol TCP -Ports 22
            $sourceUser = (Get-ZNInternalAccessPolicySourceUserCandidate -Search "any user").Items | select -First 1
            $sourceUser | Should -Not -BeNullOrEmpty
            $intPolicy = New-ZNInternalAccessPolicy -DstAssetId $dest.id -DstPortsList @($portsList) -DstProcessNamesList @("*") -Name "ManLinux-$sfx" -RuleDuration 6 -SrcUserIdsList @($sourceUser.id) -State 1
            $intPolicy.ItemId | Should -Not -BeNullOrEmpty
        } finally {
            if ($intPolicy -and $intPolicy.ItemId) { Remove-ZNInternalAccessPolicy -PolicyId $intPolicy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
