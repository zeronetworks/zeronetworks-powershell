if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNAssetOtInboundOtrule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNAssetOtInboundOtrule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNAssetOtInboundOtrule' {
    It 'Delete' {
        $assetOt = $null
        $rule = $null
        $removed = $false
        try {
            $assetOt = (Get-ZNAssetsOt -Limit 400).Items | where {$_.Fqdn -eq "poshotv2.posh.local"} | Select-Object -First 1
            $assetOt | Should -Not -BeNullOrEmpty
            $protocolsList = New-ZNProtocolsList -Protocol tcp -LocalPorts (Get-Random -Minimum 1024 -Maximum 65000)
            $source = Invoke-ZNEncodeEntityip -IP 1.1.1.2
            $destination = (Get-ZNInboundOtRulesDestinationCandidate -Search "otv2").items | Select-Object -First 1
            $destination | Should -Not -BeNullOrEmpty
            $rule = New-ZNAssetOtInboundOtRule -AssetID $assetOt.id -Action 1 -Direction 1 -localEntityId $destination.Id -RemoteEntitiesIdList @($source.id) -protocolsList $protocolsList -state 1 -LocalProcessesList @("*") -ExcludedLocalIdsList @() -ShouldBuildMirrorRules
            $rule.ItemId | Should -Not -BeNullOrEmpty
            { Remove-ZNInboundOtRule -RuleId $rule.ItemId } | Should -Not -Throw
            $removed = $true
        } finally {
            if (-not $removed -and $rule -and $rule.ItemId) { Remove-ZNInboundOtRule -RuleId $rule.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
