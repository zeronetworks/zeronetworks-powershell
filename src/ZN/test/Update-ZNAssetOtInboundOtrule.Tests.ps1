if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNAssetOtInboundOtrule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAssetOtInboundOtrule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNAssetOtInboundOtrule' {
    It 'UpdateExpanded' {
        $assetOT = (Get-ZNAssetsOt -Limit 400).Items | where {$_.Fqdn -eq "poshotv2.posh.local"} | Select-Object -First 1
        $assetOT | Should -Not -BeNullOrEmpty
        $destination = (Get-ZNInboundOtRulesDestinationCandidate -Search "poshotv2").items | Select-Object -First 1
        $remote = Invoke-ZNEncodeEntityip -IP "10.$(Get-Random -Minimum 1 -Maximum 250).$(Get-Random -Minimum 1 -Maximum 250).$(Get-Random -Minimum 1 -Maximum 250)"
        $destination | Should -Not -BeNullOrEmpty
        $protocolsList = New-ZNProtocolsList -Protocol tcp -LocalPorts (Get-Random -Minimum 1025 -Maximum 65000)
        $created = $null
        try {
            $created = New-ZNAssetOtInboundOtrule -AssetId $assetOT.Id -Action 1 -Direction 1 -LocalEntityId $destination.Id -RemoteEntitiesIdList @($remote.id) -ProtocolsList $protocolsList -State 1 -LocalProcessesList @("*") -ExcludedLocalIdsList @() -ShouldBuildMirrorRules
            $created.ItemId | Should -Not -BeNullOrEmpty
            $description = "Updated $(Get-Random -Minimum 1 -Maximum 100000)"
            Update-ZNAssetOtInboundOtrule -AssetId $assetOT.Id -RuleId $created.ItemId -Description $description
            $updated = Get-ZNAssetOtInboundOtrule -AssetId $assetOT.Id -RuleId $created.ItemId
            $updated.ItemDescription | Should -Be $description
        }
        finally {
            if ($created -and $created.ItemId) { Remove-ZNAssetOtInboundOtrule -AssetId $assetOT.Id -RuleId $created.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
