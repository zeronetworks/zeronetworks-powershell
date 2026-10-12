if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNAssetExternalAccessPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAssetExternalAccessPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNAssetExternalAccessPolicy' {
    It 'UpdateExpanded' {
        $Policy = $null
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $assetId = (Search-ZNAsset -Fqdn ml01.posh.local | Select-Object -First 1).AssetId
        $assetId | Should -Not -BeNullOrEmpty
        $srcUser = (Get-ZNExternalAccessPolicySourceUserCandidate -Search "Any user").Items | Select-Object -First 1
        $srcUser | Should -Not -BeNullOrEmpty
        $portsList = New-ZNPortsList -Protocol TCP -Ports (Get-Random -Minimum 1025 -Maximum 65000)
        try {
            $Policy = New-ZNAssetExternalAccessPolicy -AssetId $assetId -DstAssetId $assetId -DstPortsList $portsList -DstProcessNamesList @("*") -Name "ExternalUpdateAssetTest-$sfx" -RuleDuration 4 -SrcUserIdsList @($srcUser.Id) -State 1 -Url "https://external-$sfx.posh.local"
            $Policy.ItemId | Should -Not -BeNullOrEmpty

            $updatedPolicy = Update-ZNAssetExternalAccessPolicy -AssetId $assetId -PolicyId $Policy.ItemId -Name "ExternalTestUpdateAsset-$sfx" -Url "https://external-$sfx.posh.local/updated"
            $updatedPolicy.ItemUrl | Should -Be "https://external-$sfx.posh.local/updated"
        }
        finally {
            if ($Policy -and $Policy.ItemId) { Remove-ZNAssetExternalAccessPolicy -AssetId $assetId -PolicyId $Policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
