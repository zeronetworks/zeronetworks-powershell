if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNAssetOutboundOtRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNAssetOutboundOtRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNAssetOutboundOtRule' {
    It 'Delete' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $policy = $null
        $removed = $false
        try {
            $asset = (Search-ZNAsset -Fqdn poshotv2.posh.local | Select-Object -First 1).AssetId
            $asset | Should -Not -BeNullOrEmpty
            $protocolsList = New-ZNProtocolsList -Protocol tcp -LocalPorts (Get-Random -Minimum 1000 -Maximum 60000)
            $destination = (Get-ZNOutboundOtRulesDestinationCandidate -Search "any asset").items | Select-Object -First 1
            $destination | Should -Not -BeNullOrEmpty
            $policy = New-ZNAssetOutboundOtRule -AssetId $asset -Action 1 -Direction 2 -localEntityId $asset -RemoteEntitiesIdList @($destination.id) -protocolsList $protocolsList -state 1 -LocalProcessesList @("*") -ExcludedLocalIdsList @() -ShouldBuildMirrorRules
            $policy.ItemId | Should -Not -BeNullOrEmpty
            { Remove-ZNAssetOutboundOtRule -AssetId $asset -RuleId $policy.ItemId } | Should -Not -Throw
            $removed = $true
        }
        finally {
            if (-not $removed -and $policy -and $policy.ItemId) { Remove-ZNAssetOutboundOtRule -AssetId $asset -RuleId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
