if(($null -eq $TestName) -or ($TestName -contains 'Deny-ZNAssetOtInboundRulesCleanup'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Deny-ZNAssetOtInboundRulesCleanup.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Deny-ZNAssetOtInboundRulesCleanup' {
    It 'Deny' {
        $asset = Search-ZNAsset -Fqdn poshOTv2.posh.local | Select-Object -First 1
        $asset | Should -Not -BeNullOrEmpty
        $rule = (Get-ZNAssetInboundRule -AssetId $asset.AssetId -Limit 400).Items | where {$_.SuggestionType -eq 2} | Select-Object -First 1
        # rules proposed for deletion can only be seeded with an internal (team) API call (see utils.ps1 setupEnv), so skip when none is waiting
        if (-not $rule -or -not $rule.Id) { Set-ItResult -Skipped -Because 'no OT inbound rule awaiting cleanup review exists on poshOTv2.posh.local; seed one via utils.ps1 setupEnv'; return }
        { Deny-ZNAssetOtInboundRulesCleanup -AssetId $asset.AssetId -RuleId $rule.Id -Details "powershelltesting" -Reason 7 } | Should -Not -Throw
    }
}
