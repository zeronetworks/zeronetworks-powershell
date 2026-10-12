if(($null -eq $TestName) -or ($TestName -contains 'Approve-ZNAssetOutboundRuleReview'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Approve-ZNAssetOutboundRuleReview.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Approve-ZNAssetOutboundRuleReview' {
    It 'ApproveExpanded' {
        $asset = (Search-ZNAsset -Fqdn linux0.posh.local | Select-Object -First 1).AssetId
        $asset | Should -Not -BeNullOrEmpty
        $rule = (Get-ZNAssetOutboundRule -AssetId $asset).Items | where {$_.SuggestionType -eq 1} | Select-Object -First 1
        $rule | Should -Not -BeNullOrEmpty
        $rule.Id | Should -Not -BeNullOrEmpty
        $removed = $false
        try {
            Approve-ZNAssetOutboundRuleReview -AssetId $asset -RuleId $rule.Id
            $updatedRule = (Get-ZNAssetOutboundRule -AssetId $asset).Items | where {$_.Id -eq $rule.Id}
            $updatedRule.SuggestionType | Should -Be 0
            Remove-ZNAssetOutboundRule -AssetId $asset -RuleId $updatedRule.Id
            $removed = $true
        }
        finally {
            if (-not $removed) { Remove-ZNAssetOutboundRule -AssetId $asset -RuleId $rule.Id -ErrorAction SilentlyContinue }
        }
    }

    It 'ApproveWithChangesExpanded' {
        $asset = (Search-ZNAsset -Fqdn linux0.posh.local | Select-Object -First 1).AssetId
        $asset | Should -Not -BeNullOrEmpty
        $rule = (Get-ZNAssetOutboundRule -AssetId $asset).Items | where {$_.SuggestionType -eq 1} | Select-Object -First 1
        $rule | Should -Not -BeNullOrEmpty
        $rule.Id | Should -Not -BeNullOrEmpty
        $removed = $false
        try {
            Approve-ZNAssetOutboundRuleReview -AssetId $asset -RuleId $rule.Id -Description "updatedapproval" -Reason MissingPortOrProcess
            $updatedRule = (Get-ZNAssetOutboundRule -AssetId $asset).Items | where {$_.Id -eq $rule.Id}
            $updatedRule.SuggestionType | Should -Be 0
            Remove-ZNAssetOutboundRule -AssetId $asset -RuleId $updatedRule.Id
            $removed = $true
        }
        finally {
            if (-not $removed) { Remove-ZNAssetOutboundRule -AssetId $asset -RuleId $rule.Id -ErrorAction SilentlyContinue }
        }
    }
}
