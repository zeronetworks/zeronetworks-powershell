if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNExternalAccessPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNExternalAccessPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNExternalAccessPolicy' {
    It 'Delete' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $policy = $null
        $removed = $false
        try {
            $srcUser = (Get-ZNExternalAccessPolicySourceUserCandidate -Search "Any user").Items | Select-Object -First 1
            $srcUser | Should -Not -BeNullOrEmpty
            $portsList = New-ZNPortsList -Protocol TCP -Ports ([string](Get-Random -Minimum 1000 -Maximum 60000))
            $dstAsset = (Search-ZNAsset -Fqdn ml01.posh.local | Select-Object -First 1).AssetId
            $dstAsset | Should -Not -BeNullOrEmpty
            $policy = New-ZNExternalAccessPolicy -DstAssetId $dstAsset -DstPortsList $portsList -DstProcessNamesList @("*") -Name "ExternalDeleteTest-$sfx" -RuleDuration 4 -SrcUserIdsList @($srcUser.Id) -State 1 -Url "https://external-$sfx.posh.local"
            $policy.ItemId | Should -Not -BeNullOrEmpty
            { Remove-ZNExternalAccessPolicy -PolicyId $policy.ItemId } | Should -Not -Throw
            $removed = $true
        }
        finally {
            if (-not $removed -and $policy -and $policy.ItemId) { Remove-ZNExternalAccessPolicy -PolicyId $policy.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
