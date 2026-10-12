if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNAssetExternalAccessPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNAssetExternalAccessPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNAssetExternalAccessPolicy' {
    It 'Delete' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $Policy = $null
        $dstAsset = $null
        $removed = $false
        try {
            $srcUser = (Get-ZNExternalAccessPolicySourceUserCandidate -Search "Any user").Items | Select-Object -First 1
            $srcUser | Should -Not -BeNullOrEmpty
            $portsList = New-ZNPortsList -Protocol TCP -Ports (Get-Random -Minimum 1 -Maximum 1024)
            $dstAsset = (Search-ZNAsset -Fqdn ml01.posh.local | Select-Object -First 1).AssetId
            $dstAsset | Should -Not -BeNullOrEmpty
            $Policy = New-ZNExternalAccessPolicy -DstAssetId $dstAsset -DstPortsList $portsList -DstProcessNamesList @("*") -Name "ExternalDeleteAssetTest-$sfx" -RuleDuration 4 -SrcUserIdsList @($srcUser.Id) -State 1 -Url "https://external-$sfx.posh.local"
            $Policy.ItemId | Should -Not -BeNullOrEmpty
            { Remove-ZNAssetExternalAccessPolicy -AssetId $dstAsset -PolicyId $Policy.ItemId } | Should -Not -Throw
            $removed = $true
        } finally {
            if (-not $removed -and $Policy -and $Policy.ItemId) { Remove-ZNExternalAccessPolicy -PolicyId $Policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
