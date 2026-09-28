if(($null -eq $TestName) -or ($TestName -contains 'Approve-ZNAssetInboundRuleReview'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Approve-ZNAssetInboundRuleReview.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Approve-ZNAssetInboundRuleReview' {
    It 'ApproveExpanded' { 
        $asset= (Search-ZNAsset -Fqdn linux0.posh.local).AssetId
        $rule = (Get-ZNAssetInboundRule -AssetId $asset).Items | where {$_.SuggestionType -eq 1} | Select-Object -First 1
        Approve-ZNAssetInboundRuleReview -AssetId $asset -RuleId $rule.id
        $updatedRule = (Get-ZNAssetInboundRule -AssetId $asset).Items | where {$_.Id -eq $rule.id}
        $updatedRule.SuggestionType | Should -Be 0
        Remove-ZNAssetInboundRule -AssetId $asset -RuleId $updatedRule.id
    }

    It 'ApproveWithChangesExpanded' {
        $asset= (Search-ZNAsset -Fqdn linux0.posh.local).AssetId
        $rule = (Get-ZNAssetInboundRule -AssetId $asset).Items | where {$_.SuggestionType -eq 1} | Select-Object -First 1
        Approve-ZNAssetInboundRuleReview -AssetId $asset -RuleId $rule.id -Description "updatedapproval" -Reason MissingPortOrProcess
        $updatedRule = (Get-ZNAssetInboundRule -AssetId $asset).Items | where {$_.Id -eq $rule.id}
        $updatedRule.SuggestionType | Should -Be 0
        Remove-ZNAssetInboundRule -AssetId $asset -RuleId $updatedRule.id
    }
}
