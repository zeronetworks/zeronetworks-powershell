if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNAssetOtAssetManager'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAssetOtAssetManager.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNAssetOtAssetManager' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $name = "otpester$sfx"
        $ip = "198.18.$(Get-Random -Minimum 1 -Maximum 254).$(Get-Random -Minimum 1 -Maximum 254)"
        $created = $null
        $otId = $null
        $added = $false
        $user = (Get-ZNUser).Items | Select-Object -First 1
        $user | Should -Not -BeNullOrEmpty
        try {
            $created = New-ZNAssetsOt -DisplayName $name -Fqdn "$name.posh.local" -Ipv4 $ip -Type 4
            $created.AssetId | Should -Not -BeNullOrEmpty
            $otId = $created.AssetId
            Add-ZNAssetOtAssetManager -AssetId $otId -ManagerIds @($user.Id) -Permission 3
            $added = $true
            Update-ZNAssetOtAssetManager -AssetId $otId -ManagerId $user.Id -Permission 2
            $assetManager = Get-ZNAssetOtAssetManager -AssetId $otId | where {$_.Id -eq $user.Id -or $_.ManagerId -eq $user.Id} | Select-Object -First 1
            if (-not $assetManager) { $assetManager = Get-ZNAssetOtAssetManager -AssetId $otId | Select-Object -First 1 }
            $assetManager.Permission | Should -Be 2
        }
        finally {
            if ($otId) {
                if ($added) { Remove-ZNAssetOtAssetManager -AssetId $otId -GroupOrUserId $user.Id -ErrorAction SilentlyContinue }
                Update-ZNAssetOtInactive -AssetId $otId -ErrorAction SilentlyContinue
            }
        }
    }
}
