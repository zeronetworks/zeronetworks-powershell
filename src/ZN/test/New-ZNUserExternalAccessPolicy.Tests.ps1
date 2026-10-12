if(($null -eq $TestName) -or ($TestName -contains 'New-ZNUserExternalAccessPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNUserExternalAccessPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNUserExternalAccessPolicy' {
    It 'CreateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $userId = $null
        $Policy = $null
        try {
            $userId = ((Get-ZNUser -Search "zero").Items | where {$_.Name -eq "zero"} | Select-Object -First 1).Id
            $userId | Should -Not -BeNullOrEmpty
            $portsList = New-ZNPortsList -Protocol TCP -Ports (Get-Random -Minimum 1 -Maximum 1024)
            $dstAsset = (Search-ZNAsset -Fqdn ml01.posh.local | Select-Object -First 1).AssetId
            $dstAsset | Should -Not -BeNullOrEmpty
            $Policy = New-ZNUserExternalAccessPolicy -UserId $userId -DstAssetId $dstAsset -DstPortsList $portsList -DstProcessNamesList @("*") -Name "ExternalNewUserTest-$sfx" -RuleDuration 4 -SrcUserIdsList @($userId) -State 1 -Url "https://external-$sfx.posh.local"
            $Policy.ItemId | Should -Not -BeNullOrEmpty
        } finally {
            if ($Policy -and $Policy.ItemId -and $userId) { Remove-ZNUserExternalAccessPolicy -UserId $userId -PolicyId $Policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
