if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNGroupsExternalAccessPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNGroupsExternalAccessPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNGroupsExternalAccessPolicy' {
    It 'Delete' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $policy = $null
        $removed = $false
        try {
            $groupId = ((Get-ZNGroup -Search "Externally Facing Servers").Items | Select-Object -First 1).Id
            $groupId | Should -Not -BeNullOrEmpty
            $srcUser = (Get-ZNExternalAccessPolicySourceUserCandidate -Search "Any user").Items | Select-Object -First 1
            $srcUser | Should -Not -BeNullOrEmpty
            $portsList = New-ZNPortsList -Protocol TCP -Ports ([string](Get-Random -Minimum 1000 -Maximum 60000))
            $policy = New-ZNGroupsExternalAccessPolicy -GroupId $groupId -GroupType tag -DstAssetId $groupId -DstPortsList $portsList -DstProcessNamesList @("*") -Name "ExternalDeleteGroupsTest-$sfx" -RuleDuration 4 -SrcUserIdsList @($srcUser.Id) -State 1 -Url "https://external-$sfx.posh.local"
            $policy.ItemId | Should -Not -BeNullOrEmpty
            { Remove-ZNGroupsExternalAccessPolicy -GroupId $groupId -GroupType tag -PolicyId $policy.ItemId } | Should -Not -Throw
            $removed = $true
        }
        finally {
            if (-not $removed -and $policy -and $policy.ItemId) { Remove-ZNGroupsExternalAccessPolicy -GroupId $groupId -GroupType tag -PolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
