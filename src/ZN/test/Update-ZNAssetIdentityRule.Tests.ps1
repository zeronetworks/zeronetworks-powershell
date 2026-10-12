if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNAssetIdentityRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAssetIdentityRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNAssetIdentityRule' {
    It 'UpdateExpanded' {
        $rule = $null
        $asset = (Search-ZNAsset -Fqdn dc01.posh.local | Select-Object -First 1).AssetId
        $asset | Should -Not -BeNullOrEmpty
        $user = (Get-ZNUser).Items | Select-Object -First 1
        $user | Should -Not -BeNullOrEmpty
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $description = "updatedtest-$sfx"
        $expiresAt = [DateTimeOffset]::UtcNow.AddHours(1).ToUnixTimeMilliseconds()
        try {
            $rule = New-ZNAssetIdentityRule -AssetId $asset -Action 1 -AssetId1 $asset -IdentityProtectionCategoryList @(4,5) -State 1 -UserIdsList @($user.Id) -description "test-$sfx" -ExpiresAt $expiresAt
            $rule.ItemId | Should -Not -BeNullOrEmpty
            Update-ZNAssetIdentityRule -AssetId $asset -RuleId $rule.ItemId -Description $description
            $updatedRule = Get-ZNAssetIdentityRule -AssetId $asset -RuleId $rule.ItemId
            $updatedRule.ItemDescription | Should -Be $description
        }
        finally {
            if ($rule -and $rule.ItemId) { Remove-ZNAssetIdentityRule -AssetId $asset -RuleId $rule.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
