if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNGroupsRpcRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNGroupsRpcRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNGroupsRpcRule' {
    It 'UpdateExpanded' {
        $asset = (Search-ZNAsset -Fqdn as01.posh.local).AssetId | Select-Object -First 1
        $asset | Should -Not -BeNullOrEmpty
        $group = (Get-ZNGroup -Search 'domain controllers').Items | where {$_.Id -like 'g:t:*'} | Select-Object -First 1
        $group | Should -Not -BeNullOrEmpty
        $user = (Get-ZNGroupsRpcRulesUserCandidate -GroupId $group.Id -GroupType tag -Search 'Any User').Items | Select-Object -First 1
        $user | Should -Not -BeNullOrEmpty
        $rule = $null
        try {
            $rule = New-ZNGroupsRpcRule -GroupId $group.Id -GroupType tag -Action 1 -Description "New RPC Rule $(Get-Random)" -ExcludedAssetIdsList @() -InterfaceUuidsList @('rpcAnyInterfaceId') -LocalAssetId $group.Id -OpNumbersList @() -ProtocolsList @() -RemoteAssetIdsList @($asset) -State 1 -UserIdsList @($user.Id)
            $rule.ItemId | Should -Not -BeNullOrEmpty
            $description = "description" + (Get-Random -Minimum 1 -Maximum 100000)
            $updatedRule = Update-ZNGroupsRpcRule -GroupId $group.Id -GroupType tag -RuleId $rule.ItemId -Description $description
            $updatedRule.ItemDescription | Should -Be $description
        }
        finally {
            if ($rule -and $rule.ItemId) { Remove-ZNGroupsRpcRule -GroupId $group.Id -GroupType tag -RuleId $rule.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
