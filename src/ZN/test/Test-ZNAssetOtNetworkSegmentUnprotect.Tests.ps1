if(($null -eq $TestName) -or ($TestName -contains 'Test-ZNAssetOtNetworkSegmentUnprotect'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Test-ZNAssetOtNetworkSegmentUnprotect.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Test-ZNAssetOtNetworkSegmentUnprotect' {
    It 'Validate' {
        $asset = Search-ZNAsset -Fqdn "poshotv2.posh.local" | Select-Object -First 1
        $asset.AssetId | Should -Not -BeNullOrEmpty
        # with AssetId in the path the API rejects an 'items' body, so validate with an empty body
        $body = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.AssetsProtectBody]::new()
        $result = Test-ZNAssetOtNetworkSegmentUnprotect -AssetId $asset.AssetId -Body $body
        $result.Error1 | Should -BeNullOrEmpty -Because "$($result.Message)"
        $result.AffectedAssetsCount | Should -Not -BeNullOrEmpty
    }

    It 'ValidateExpanded' {
        $asset = Search-ZNAsset -Fqdn "poshotv2.posh.local" | Select-Object -First 1
        $asset.AssetId | Should -Not -BeNullOrEmpty
        (Test-ZNAssetOtNetworkSegmentUnprotect -Items @($asset.AssetId)).AffectedAssetsCount | Should -Not -BeNullOrEmpty
    }
}
