if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNIdentityRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNIdentityRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNIdentityRule' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $group = (Get-ZNGroup -Search "domain controllers").Items | where {$_.id -like "g:t:*"} | Select-Object -First 1
        $group | Should -Not -BeNullOrEmpty
        $user = (Get-ZNUser).Items | Select-Object -First 1
        $user | Should -Not -BeNullOrEmpty
        $description = "updatedtest-$sfx"
        $expiresAt = [DateTimeOffset]::UtcNow.AddHours(1).ToUnixTimeMilliseconds()
        $rule = $null
        try {
            $rule = New-ZNIdentityRule -Action 1 -AssetId $group.Id -IdentityProtectionCategoryList @(2,3) -State 1 -UserIdsList @($user.Id) -Description "test-$sfx" -ExpiresAt $expiresAt
            $rule.ItemId | Should -Not -BeNullOrEmpty
            Update-ZNIdentityRule -RuleId $rule.ItemId -Description $description
            $updatedRule = Get-ZNIdentityRule -RuleId $rule.ItemId
            $updatedRule.ItemDescription | Should -Be $description
        }
        finally {
            if ($rule -and $rule.ItemId) { Remove-ZNIdentityRule -RuleId $rule.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
