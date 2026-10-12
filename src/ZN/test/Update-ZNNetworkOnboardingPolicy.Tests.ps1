if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNNetworkOnboardingPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNNetworkOnboardingPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNNetworkOnboardingPolicy' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $policy = $null
        try {
            # candidates exclude groups that already have a policy; pick a random one to avoid collisions
            $group = (Get-ZNNetworkOnboardingPoliciesGroupCandidate).Items | Get-Random
            $group | Should -Not -BeNullOrEmpty
            $group.Id | Should -Not -BeNullOrEmpty
            $policy = New-ZNNetworkOnboardingPolicy -ExistingMembersLearningDays 30 -GroupId $group.Id -NewMembersLearningDays 30 -Description "Powershell test $sfx" -Enabled:$false
            $policy.ItemId | Should -Not -BeNullOrEmpty
            $updatedPolicy = Update-ZNNetworkOnboardingPolicy -ProtectionPolicyId $policy.ItemId -ExistingMembersLearningDays 60 -NewMembersLearningDays 60 -EnforceBlocks:$false
            $updatedPolicy.ItemExistingMembersLearningDays | Should -Be 60
        }
        finally {
            if ($policy -and $policy.ItemId) { Remove-ZNNetworkOnboardingPolicy -ProtectionPolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
