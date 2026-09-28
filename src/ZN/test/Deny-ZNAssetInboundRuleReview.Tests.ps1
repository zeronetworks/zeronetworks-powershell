if(($null -eq $TestName) -or ($TestName -contains 'Deny-ZNAssetInboundRuleReview'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Deny-ZNAssetInboundRuleReview.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Deny-ZNAssetInboundRuleReview' {
    It 'DenyExpanded' {
        $asset= (Search-ZNAsset -Fqdn linux0.posh.local).AssetId
        $rule = (Get-ZNAssetInboundRule -AssetId $asset).Items | where {$_.SuggestionType -eq 1} | Select-Object -First 1
        { Deny-ZNAssetInboundRuleReview -AssetId $asset -RuleId $rule.id -Details "powershelltesting" -Reason Other } | Should -Not -Throw
    }
}
