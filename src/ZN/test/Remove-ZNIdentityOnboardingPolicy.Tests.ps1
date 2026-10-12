if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNIdentityOnboardingPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNIdentityOnboardingPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNIdentityOnboardingPolicy' {
    It 'Delete' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $policy = $null
        $removed = $false
        try {
            # candidates exclude groups that already have a policy; use the preferred group when available, else any candidate
            $group = (Get-ZNIdentityOnboardingPoliciesGroupCandidate -Search "Account Operators").Items | Select-Object -First 1
            if (-not $group) { $group = (Get-ZNIdentityOnboardingPoliciesGroupCandidate -Limit 50).Items | Get-Random }
            if (-not $group -or -not $group.Id) { Set-ItResult -Skipped -Because 'no Identity onboarding policy group candidate (every group already has a policy)'; return }
            $policy = New-ZNIdentityOnboardingPolicy -ExistingMembersLearningDays 30 -GroupId $group.Id -NewMembersLearningDays 30 -Description "Powershell test $sfx" -Enabled:$false
            $policy.ItemId | Should -Not -BeNullOrEmpty -Because "$($policy.Error1) $($policy.Message)"
            { Remove-ZNIdentityOnboardingPolicy -ProtectionPolicyId $policy.ItemId } | Should -Not -Throw
            $removed = $true
        }
        finally {
            if (-not $removed -and $policy -and $policy.ItemId) { Remove-ZNIdentityOnboardingPolicy -ProtectionPolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
