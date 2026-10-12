if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNAssetMfaIdentityPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNAssetMfaIdentityPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNAssetMfaIdentityPolicy' {
    It 'Delete' {
        $asset = $null
        $policy = $null
        $removed = $false
        try {
            $asset = (Search-ZNAsset -Fqdn dc01.posh.local | Select-Object -First 1).AssetId
            $asset | Should -Not -BeNullOrEmpty
            $group = (Get-ZNMfaIdentityPoliciesDestinationCandidate -Search "databases").items | where {$_.Id -like "g:t:*"} | Select-Object -First 1
            $group | Should -Not -BeNullOrEmpty
            $source = (Get-ZNMfaIdentityPoliciesSourceCandidate -Search "Any Asset").items | Select-Object -First 1
            if (-not $source) { $source = (Get-ZNMfaIdentityPoliciesSourceCandidate).items | Select-Object -First 1 }
            $source | Should -Not -BeNullOrEmpty
            $users = (Get-ZNMfaIdentityPoliciesSourceUserCandidate -Search "Domain Admins").items | Select-Object -First 1
            $users | Should -Not -BeNullOrEmpty
            $policy = $null
            # an identical destination/source/user/category-set combination is rejected as a duplicate, and pre-existing policies may already use some,
            # so draw a random category set and retry when the tenant reports a duplicate
            for ($attempt = 0; $attempt -lt 15 -and -not $policy; $attempt++) {
                $categories = @(1..5 | Get-Random -Count (Get-Random -Minimum 1 -Maximum 6))
                try { $created = New-ZNAssetMfaIdentityPolicy -AssetId $asset -DstAssetId $group.id -FallbackToSingleLoggedOnUser:$true -IdentityProtectionCategoryList $categories -MfaMethodsList @(4) -OverrideBuiltins:$false -RuleDuration 6 -SrcAssetIdsList @($source.id) -SrcUserIdsList @($users.id) -State 1; if ($created.ItemId) { $policy = $created } }
                catch { if ($_.Exception.Message -notmatch "duplicate") { throw } }
            }
            $policy.ItemId | Should -Not -BeNullOrEmpty
            { Remove-ZNAssetMfaIdentityPolicy -AssetId $asset -ReactivePolicyId $policy.ItemId } | Should -Not -Throw
            $removed = $true
        } finally {
            if (-not $removed -and $policy -and $policy.ItemId -and $asset) { Remove-ZNMfaIdentityPolicy -ReactivePolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
