if(($null -eq $TestName) -or ($TestName -contains 'Approve-ZNInboundRuleReview'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Approve-ZNInboundRuleReview.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Approve-ZNInboundRuleReview' {
    It 'ApproveExpanded' {
        $rule = (Get-ZNInboundRule -Limit 100).Items | where {$_.SuggestionType -eq 1} | Select-Object -First 1
        $rule | Should -Not -BeNullOrEmpty
        $rule.Id | Should -Not -BeNullOrEmpty
        $removed = $false
        try {
            Approve-ZNInboundRuleReview -RuleId $rule.Id
            $updatedRule = (Get-ZNInboundRule -Limit 100).Items | where {$_.Id -eq $rule.Id}
            $updatedRule.SuggestionType | Should -Be 0
            Remove-ZNInboundRule -RuleId $updatedRule.Id
            $removed = $true
        }
        finally {
            if (-not $removed) { Remove-ZNInboundRule -RuleId $rule.Id -ErrorAction SilentlyContinue }
        }
    }

    It 'ApproveWithChangesExpanded' {
        $rule = (Get-ZNInboundRule -Limit 100).Items | where {$_.SuggestionType -eq 1} | Select-Object -First 1
        $rule | Should -Not -BeNullOrEmpty
        $rule.Id | Should -Not -BeNullOrEmpty
        $removed = $false
        try {
            Approve-ZNInboundRuleReview -RuleId $rule.Id -Description "updatedapproval" -Reason MissingPortOrProcess
            $updatedRule = (Get-ZNInboundRule -Limit 100).Items | where {$_.Id -eq $rule.Id}
            $updatedRule.SuggestionType | Should -Be 0
            Remove-ZNInboundRule -RuleId $updatedRule.Id
            $removed = $true
        }
        finally {
            if (-not $removed) { Remove-ZNInboundRule -RuleId $rule.Id -ErrorAction SilentlyContinue }
        }
    }
}
