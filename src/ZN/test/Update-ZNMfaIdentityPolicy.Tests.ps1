if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNMfaIdentityPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNMfaIdentityPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNMfaIdentityPolicy' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $policy = $null
        try {
            $group = (Get-ZNMfaIdentityPoliciesDestinationCandidate -Search "databases").Items | Where-Object {$_.Id -like "g:t:*"} | Select-Object -First 1
            $group | Should -Not -BeNullOrEmpty
            $source = (Get-ZNMfaIdentityPoliciesSourceCandidate -Search "Any Asset").Items | Select-Object -First 1
            if (-not $source) { $source = (Get-ZNMfaIdentityPoliciesSourceCandidate).Items | Select-Object -First 1 }
            $source | Should -Not -BeNullOrEmpty
            # use a different user group and a random duration than New-ZNMfaIdentityPolicy test to avoid "duplicate identity reactive policy"
            $users = (Get-ZNMfaIdentityPoliciesSourceUserCandidate -Search "Domain Users").Items | Select-Object -First 1
            if (-not $users) { $users = (Get-ZNMfaIdentityPoliciesSourceUserCandidate -Search "Domain Admins").Items | Select-Object -First 1 }
            $users | Should -Not -BeNullOrEmpty
            $duration = Get-Random -Minimum 2 -Maximum 12
            $policy = $null
            $lastError = ''
            # an identical destination/source/user/category-set combination is rejected as a duplicate, and pre-existing policies may already use some,
            # so draw a random category set and retry when the tenant reports a duplicate
            for ($attempt = 0; $attempt -lt 15 -and -not $policy; $attempt++) {
                $categories = @(1..5 | Get-Random -Count (Get-Random -Minimum 1 -Maximum 6))
                try {
                    $created = New-ZNMfaIdentityPolicy -DstAssetId $group.Id -FallbackToSingleLoggedOnUser:$true -IdentityProtectionCategoryList $categories -MfaMethodsList @(4) -OverrideBuiltins:$false -RuleDuration $duration -SrcAssetIdsList @($source.Id) -SrcUserIdsList @($users.Id) -State 1 -Name "UpdateMfaIdentity-$sfx"
                    if ($created.ItemId) { $policy = $created } else { $lastError = "$($created.Message)"; if ($lastError -notmatch "duplicate") { break } }
                }
                catch { $lastError = $_.Exception.Message; if ($lastError -notmatch "duplicate") { throw } }
            }
            $policy.ItemId | Should -Not -BeNullOrEmpty -Because "create failed after $attempt attempt(s): $lastError"
            Update-ZNMfaIdentityPolicy -ReactivePolicyId $policy.ItemId -Description "updatedpolicy-$sfx"
            $updatedpolicy = Get-ZNMfaIdentityPolicy -ReactivePolicyId $policy.ItemId
            $updatedpolicy.ItemDescription | Should -Be "updatedpolicy-$sfx"
        }
        finally {
            if ($policy -and $policy.ItemId) { Remove-ZNMfaIdentityPolicy -ReactivePolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
