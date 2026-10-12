if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNExternalAccessPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNExternalAccessPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNExternalAccessPolicy' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $srcUser = (Get-ZNExternalAccessPolicySourceUserCandidate -Search "Any user").Items | Select-Object -First 1
        $srcUser | Should -Not -BeNullOrEmpty
        $portsList = New-ZNPortsList -Protocol TCP -Ports (Get-Random -Minimum 20000 -Maximum 60000)
        $dstAsset = (Search-ZNAsset -Fqdn ml01.posh.local).AssetId | Select-Object -First 1
        $dstAsset | Should -Not -BeNullOrEmpty
        $Policy = $null
        try {
            $Policy = New-ZNExternalAccessPolicy -DstAssetId $dstAsset -DstPortsList $portsList -DstProcessNamesList @("*") -Name "ExternalUpdateTest-$sfx" -RuleDuration 4 -SrcUserIdsList @($srcUser.Id) -State 1 -Url "https://external-$sfx.posh.local"
            $Policy.ItemId | Should -Not -BeNullOrEmpty
            $updatedPolicy = Update-ZNExternalAccessPolicy -PolicyId $Policy.ItemId -Name "ExternalTestUpdated-$sfx" -Url "https://external-$sfx.posh.local/updated"
            $updatedPolicy.ItemUrl | Should -Be "https://external-$sfx.posh.local/updated"
        }
        finally {
            if ($Policy -and $Policy.ItemId) { Remove-ZNExternalAccessPolicy -PolicyId $Policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
