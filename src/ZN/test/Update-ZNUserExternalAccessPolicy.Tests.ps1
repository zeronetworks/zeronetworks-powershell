if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNUserExternalAccessPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNUserExternalAccessPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNUserExternalAccessPolicy' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $user = ((Get-ZNUser -Search "zero").Items | where {$_.Name -eq "zero"}) | Select-Object -First 1
        $user | Should -Not -BeNullOrEmpty
        $userId = $user.Id
        $dstAsset = (Search-ZNAsset -Fqdn ml01.posh.local | Select-Object -First 1).AssetId
        $dstAsset | Should -Not -BeNullOrEmpty
        $portsList = New-ZNPortsList -Protocol TCP -Ports (Get-Random -Minimum 20000 -Maximum 60000)
        $Policy = $null
        try {
            $Policy = New-ZNUserExternalAccessPolicy -UserId $userId -DstAssetId $dstAsset -DstPortsList $portsList -DstProcessNamesList @("*") -Name "ExternalUpdateUserTest-$sfx" -RuleDuration 4 -SrcUserIdsList @($userId) -State 1 -Url "https://external-$sfx.posh.local"
            $Policy.ItemId | Should -Not -BeNullOrEmpty
            $updatedPolicy = Update-ZNUserExternalAccessPolicy -UserId $userId -PolicyId $Policy.ItemId -Name "ExternalTestUpdateUser-$sfx" -Url "https://external-$sfx.posh.local/updated"
            $updatedPolicy.ItemUrl | Should -Be "https://external-$sfx.posh.local/updated"
        } finally {
            if ($Policy -and $Policy.ItemId) { Remove-ZNUserExternalAccessPolicy -UserId $userId -PolicyId $Policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
