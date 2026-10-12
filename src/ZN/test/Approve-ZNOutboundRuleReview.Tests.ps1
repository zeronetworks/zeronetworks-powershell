if(($null -eq $TestName) -or ($TestName -contains 'Approve-ZNOutboundRuleReview'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Approve-ZNOutboundRuleReview.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Approve-ZNOutboundRuleReview' {
    It 'ApproveExpanded' {
        $rule = (Get-ZNOutboundRule -Limit 100).Items | where {$_.SuggestionType -eq 1} | Select-Object -First 1
        $rule | Should -Not -BeNullOrEmpty
        $rule.Id | Should -Not -BeNullOrEmpty
        $removed = $false
        try {
            Approve-ZNOutboundRuleReview -RuleId $rule.Id
            $updatedRule = (Get-ZNOutboundRule -Limit 100).Items | where {$_.Id -eq $rule.Id}
            $updatedRule.SuggestionType | Should -Be 0
            Remove-ZNOutboundRule -RuleId $updatedRule.Id
            $removed = $true
        }
        finally {
            if (-not $removed) { Remove-ZNOutboundRule -RuleId $rule.Id -ErrorAction SilentlyContinue }
        }
    }

    It 'ApproveWithChangesExpanded' {
        $rule = (Get-ZNOutboundRule -Limit 100).Items | where {$_.SuggestionType -eq 1} | Select-Object -First 1
        $rule | Should -Not -BeNullOrEmpty
        $rule.Id | Should -Not -BeNullOrEmpty
        $removed = $false
        try {
            Approve-ZNOutboundRuleReview -RuleId $rule.Id -Description "updatedapproval" -Reason MissingPortOrProcess
            $updatedRule = (Get-ZNOutboundRule -Limit 100).Items | where {$_.Id -eq $rule.Id}
            $updatedRule.SuggestionType | Should -Be 0
            Remove-ZNOutboundRule -RuleId $updatedRule.Id
            $removed = $true
        }
        finally {
            if (-not $removed) { Remove-ZNOutboundRule -RuleId $rule.Id -ErrorAction SilentlyContinue }
        }
    }
}
