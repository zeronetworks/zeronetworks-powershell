if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSettingsAeRuleReviewCleanup'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSettingsAeRuleReviewCleanup.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSettingsAeRuleReviewCleanup' {
    It 'UpdateExpanded' {
        $original = (Get-ZNSettingsAeRuleReviewCleanup).UnusedRulesCleanupState
        $original | Should -Not -BeNullOrEmpty
        try {
            if ($original -eq "OFF") {
                $newSetting = "ON_REVIEW"
            } else {
                $newSetting = "OFF"
            }
            Update-ZNSettingsAeRuleReviewCleanup -UnusedRulesCleanupState $newSetting
            $updatedSetting = (Get-ZNSettingsAeRuleReviewCleanup).UnusedRulesCleanupState
            $updatedSetting | Should -Be $newSetting
        }
        finally {
            if ($original) { Update-ZNSettingsAeRuleReviewCleanup -UnusedRulesCleanupState $original -ErrorAction SilentlyContinue }
        }
    }
}
