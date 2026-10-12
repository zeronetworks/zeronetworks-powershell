if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNAssetOt'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAssetOt.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNAssetOt' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $name = "otpester$sfx"
        $ip = "198.18.$(Get-Random -Minimum 1 -Maximum 254).$(Get-Random -Minimum 1 -Maximum 254)"
        $created = $null
        $otId = $null
        try {
            $created = New-ZNAssetsOt -DisplayName $name -Fqdn "$name.posh.local" -Ipv4 $ip -Type 4
            $created.AssetId | Should -Not -BeNullOrEmpty -Because "$($created.Error1) $($created.Message)"
            $otId = $created.AssetId
            $newName = "$name-upd"
            # the API requires ipv4 on every update, not only the changed fields
            $result = Update-ZNAssetOt -AssetId $otId -DisplayName $newName -Ipv4 $ip -Fqdn "$name.posh.local" -Type 4
            $result.Error1 | Should -BeNullOrEmpty -Because "$($result.Message)"
            $updatedOtAsset = (Get-ZNAssetsOt -Limit 400 -ShowInactive).Items | where {$_.Id -eq $otId} | Select-Object -First 1
            $updatedOtAsset | Should -Not -BeNullOrEmpty
            $updatedOtAsset.Name | Should -Be $newName
        }
        finally {
            if ($otId) { Update-ZNAssetOtInactive -AssetId $otId -ErrorAction SilentlyContinue }
        }
    }
}
