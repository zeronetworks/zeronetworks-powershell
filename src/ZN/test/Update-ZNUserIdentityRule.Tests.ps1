if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNUserIdentityRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNUserIdentityRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNUserIdentityRule' {
    It 'UpdateExpanded' {
        $asset = (Search-ZNAsset -Fqdn dc01.posh.local | Select-Object -First 1).AssetId
        $asset | Should -Not -BeNullOrEmpty
        # preferred user first, then any user known to exist on the tenant
        $user = (Get-ZNUser -Search zuser1).Items | Select-Object -First 1
        if (-not $user) { $user = (Get-ZNUser -Search zero).Items | Where-Object {$_.Name -eq 'zero'} | Select-Object -First 1 }
        if (-not $user) { $user = (Get-ZNUser -Limit 50).Items | Where-Object {-not $_.IsDisabled} | Select-Object -First 1 }
        $user | Should -Not -BeNullOrEmpty
        $user.Id | Should -Not -BeNullOrEmpty
        $description = "updatedtest-$(Get-Random -Minimum 1 -Maximum 100000)"
        $expiresAt = [DateTimeOffset]::UtcNow.AddHours(1).ToUnixTimeMilliseconds()
        $rule = $null
        try {
            $rule = New-ZNUserIdentityRule -UserId $user.Id -Action 1 -AssetId $asset -IdentityProtectionCategoryList @(2,5) -State 1 -UserIdsList @($user.Id) -Description "test" -ExpiresAt $expiresAt
            $rule.ItemId | Should -Not -BeNullOrEmpty -Because "$($rule.Error1) $($rule.Message)"
            Update-ZNUserIdentityRule -UserId $user.Id -RuleId $rule.ItemId -Description $description
            $updatedrule = Get-ZNUserIdentityRule -UserId $user.Id -RuleId $rule.ItemId
            $updatedrule.ItemDescription | Should -Be $description
        } finally {
            if ($rule -and $rule.ItemId) { Remove-ZNUserIdentityRule -UserId $user.Id -RuleId $rule.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
