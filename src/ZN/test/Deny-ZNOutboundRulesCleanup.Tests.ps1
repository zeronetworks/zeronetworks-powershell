if(($null -eq $TestName) -or ($TestName -contains 'Deny-ZNOutboundRulesCleanup'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Deny-ZNOutboundRulesCleanup.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Deny-ZNOutboundRulesCleanup' {
    It 'Deny' {
        $rule = (Get-ZNOutboundRule -AddAncestors -AddBuiltins).Items | where {$_.SuggestionType -eq 2} | Select-Object -First 1
        $rule | Should -Not -BeNullOrEmpty
        $rule.Id | Should -Not -BeNullOrEmpty
        { Deny-ZNOutboundRulesCleanup -RuleId $rule.Id -Details "powershelltesting" -Reason 7 } | Should -Not -Throw
    }
}
