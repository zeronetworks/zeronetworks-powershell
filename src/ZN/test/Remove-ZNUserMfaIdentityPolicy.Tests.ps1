if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNUserMfaIdentityPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNUserMfaIdentityPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNUserMfaIdentityPolicy' {
    It 'Delete' {
        $policy = $null
        $removed = $false
        $user = (Get-ZNUser).Items | Select-Object -First 1
        $user | Should -Not -BeNullOrEmpty
        $group = (Get-ZNMfaIdentityPoliciesDestinationCandidate -Search "databases").items | where {$_.Id -like "g:t:*"} | Select-Object -First 1
        $group | Should -Not -BeNullOrEmpty
        $source = (Get-ZNMfaIdentityPoliciesSourceCandidate -Search "Any Asset").items | Select-Object -First 1
        $source | Should -Not -BeNullOrEmpty
        $users = (Get-ZNMfaIdentityPoliciesSourceUserCandidate -Search "Domain Admins").items | Select-Object -First 1
        $users | Should -Not -BeNullOrEmpty
        $categories = @(1..5 | Get-Random -Count (Get-Random -Minimum 1 -Maximum 4))
        try {
            $policy = New-ZNUserMfaIdentityPolicy -UserId $user.id -DstAssetId $group.id -FallbackToSingleLoggedOnUser:$true -IdentityProtectionCategoryList $categories -MfaMethodsList @(4) -OverrideBuiltins:$false -RuleDuration 6 -SrcAssetIdsList @($source.id) -SrcUserIdsList @($users.id) -State 1
            $policy.ItemId | Should -Not -BeNullOrEmpty
            { Remove-ZNUserMfaIdentityPolicy -UserId $user.id -ReactivePolicyId $policy.ItemId } | Should -Not -Throw
            $removed = $true
        }
        finally {
            if (-not $removed -and $policy -and $policy.ItemId) { Remove-ZNUserMfaIdentityPolicy -UserId $user.id -ReactivePolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
