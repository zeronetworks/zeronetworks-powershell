if(($null -eq $TestName) -or ($TestName -contains 'Unprotect-ZNAssetOtNetworkSegment'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Unprotect-ZNAssetOtNetworkSegment.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Unprotect-ZNAssetOtNetworkSegment' {
    It 'Unprotect' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $name = "otpester$sfx"
        $ip = "198.18.$(Get-Random -Minimum 1 -Maximum 254).$(Get-Random -Minimum 1 -Maximum 254)"
        $created = $null
        $otId = $null
        try {
            $created = New-ZNAssetsOt -DisplayName $name -Fqdn "$name.posh.local" -Ipv4 $ip -Type 4
            $created.AssetId | Should -Not -BeNullOrEmpty
            $otId = $created.AssetId
            Protect-ZNAssetOtNetworkSegment -Items @($otId)
            { Unprotect-ZNAssetOtNetworkSegment -Items @($otId) } | Should -Not -Throw
        }
        finally {
            if ($otId) {
                Unprotect-ZNAssetOtNetworkSegment -AssetId $otId -ErrorAction SilentlyContinue
                Update-ZNAssetOtInactive -AssetId $otId -ErrorAction SilentlyContinue
            }
        }
    }

    It 'UnprotectExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $name = "otpester$sfx"
        $ip = "198.18.$(Get-Random -Minimum 1 -Maximum 254).$(Get-Random -Minimum 1 -Maximum 254)"
        $created = $null
        $otId = $null
        try {
            $created = New-ZNAssetsOt -DisplayName $name -Fqdn "$name.posh.local" -Ipv4 $ip -Type 4
            $created.AssetId | Should -Not -BeNullOrEmpty
            $otId = $created.AssetId
            Protect-ZNAssetOtNetworkSegment -AssetId $otId
            { Unprotect-ZNAssetOtNetworkSegment -AssetId $otId } | Should -Not -Throw
        }
        finally {
            if ($otId) {
                Unprotect-ZNAssetOtNetworkSegment -AssetId $otId -ErrorAction SilentlyContinue
                Update-ZNAssetOtInactive -AssetId $otId -ErrorAction SilentlyContinue
            }
        }
    }
}
