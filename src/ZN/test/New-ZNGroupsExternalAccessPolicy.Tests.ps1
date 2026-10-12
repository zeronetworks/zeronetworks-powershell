if(($null -eq $TestName) -or ($TestName -contains 'New-ZNGroupsExternalAccessPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNGroupsExternalAccessPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNGroupsExternalAccessPolicy' {
    It 'CreateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $group = (Get-ZNGroup -Search "Externally Facing Servers").Items | Select -First 1
        $group | Should -Not -BeNullOrEmpty
        $groupId = [string]$group.Id
        $groupId | Should -Not -BeNullOrEmpty
        $srcUser = (Get-ZNExternalAccessPolicySourceUserCandidate -Search "Any user").Items | Select -First 1
        $srcUser | Should -Not -BeNullOrEmpty
        $portsList = New-ZNPortsList -Protocol TCP -Ports (Get-Random -Minimum 1025 -Maximum 60000)
        $Policy = $null
        try {
            $Policy = New-ZNGroupsExternalAccessPolicy -GroupId $groupId -GroupType tag -DstAssetId $groupId -DstPortsList $portsList -DstProcessNamesList @("*") -Name "ExternalNewGroupTest-$sfx" -RuleDuration 4 -SrcUserIdsList @($srcUser.Id) -State 1 -Url "https://external-$sfx.posh.local"
            $Policy.ItemId | Should -Not -BeNullOrEmpty
        }
        finally {
            if ($Policy -and $Policy.ItemId) { Remove-ZNGroupsExternalAccessPolicy -GroupId $groupId -GroupType tag -PolicyId $Policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
