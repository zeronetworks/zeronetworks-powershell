if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNAssetType'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAssetType.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNAssetType' {
    It 'SetExpanded' {
        $asset = (Search-ZNAsset -Fqdn linux0.posh.local).AssetId | Select-Object -First 1
        $asset | Should -Not -BeNullOrEmpty
        $originalType = (Get-ZNAsset -AssetId $asset).EntityAssetType
        $originalType | Should -Not -BeNullOrEmpty
        $newvalue = if ($originalType -eq 1) { 2 } else { 1 }
        $changed = $false
        try {
            Update-ZNAssetType -AssetId $asset -Type $newvalue
            $changed = $true
            $updatedAssetProperties = Get-ZNAsset -AssetId $asset
            $updatedAssetProperties.EntityAssetType | Should -Be $newvalue
        }
        finally {
            if ($changed) { Update-ZNAssetType -AssetId $asset -Type $originalType -ErrorAction SilentlyContinue }
        }
    }
}
