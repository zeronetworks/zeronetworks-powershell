if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNRpcRule'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNRpcRule.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNRpcRule' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $rule = $null
        try {
            # preferred asset first, then a domain controller present on the tenant
            $asset = (Search-ZNAsset -Fqdn switch03 | Select-Object -First 1).AssetId
            if (-not $asset) { $asset = (Search-ZNAsset -Fqdn dc01.posh.local | Select-Object -First 1).AssetId }
            $asset | Should -Not -BeNullOrEmpty
            $group = (Get-ZNGroup -Search 'domain controllers').Items | Where-Object {$_.Id -like 'g:t:*'} | Select-Object -First 1
            $group | Should -Not -BeNullOrEmpty
            $user = ((Get-ZNRpcRulesUserCandidate -Search 'Any User').Items | Select-Object -First 1).Id
            $user | Should -Not -BeNullOrEmpty
            $rule = New-ZNRpcRule -Action 1 -Description "New RPC Rule $sfx" -ExcludedAssetIdsList @() -InterfaceUuidsList @('rpcAnyInterfaceId') -LocalAssetId $group.Id -OpNumbersList @() -ProtocolsList @() -RemoteAssetIdsList @([string]$asset) -State 1 -UserIdsList @([string]$user)
            $rule.ItemId | Should -Not -BeNullOrEmpty -Because "$($rule.Error1) $($rule.Message)"
            $description = "description-$sfx"
            $updatedRule = Update-ZNRpcRule -RuleId $rule.ItemId -Description $description
            $updatedRule.ItemDescription | Should -Be $description
        }
        finally {
            if ($rule -and $rule.ItemId) { Remove-ZNRpcRule -RuleId $rule.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
