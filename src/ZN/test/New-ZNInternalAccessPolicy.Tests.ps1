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
        $dest = (Get-ZNInternalAccessPolicyDestinationAssetsCandidate).Items | select -First 1
        $portsList = New-ZNPortsList -Protocol TCP -Ports 22
        $sourceuser = (Get-ZNInternalAccessPolicySourceUserCandidate -Search "any user").Items
        $intPolicy = New-ZNInternalAccessPolicy -DstAssetId $dest.id -DstPortsList @($portsList) -DstProcessNamesList @(*) -Name ManLinux -RuleDuration 6 -SrcUserIdsList @($sourceUser.id) -State 1
        $intPolicy.ItemId | Should -Not -BeNullOrEmpty
        Remove-ZNInternalAccessPolicy -PolicyId $intPolicy.ItemId
    }
}
