if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSettingsAd'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSettingsAd.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSettingsAd' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $pw = 'Zn-' + (-join ((48..57)+(65..90)+(97..122) | Get-Random -Count 14 | ForEach-Object {[char]$_})) + '!1'
        $domain = "upd$sfx.test.com"
        $forestId = $null
        try {
            $clusterId = (Get-ZNSettingsAd | Where-Object { $_.ActiveDirectoryInfoSyncingClusterId } | Select-Object -First 1).ActiveDirectoryInfoSyncingClusterId
            if (-not $clusterId) { Set-ItResult -Skipped -Because 'no existing AD forest with a syncing cluster id on this tenant'; return }
            $created = New-ZNSettingsAd -PrimaryDomainConfigDomainControllerFqdns @("dc.$domain") -PrimaryDomainConfigDomainName $domain -PrimaryDomainConfigUseLdaps -PrimaryDomainConfigUserFqdn ZNRemoteManagement -PrimaryDomainConfigPassword $pw -PrimaryDomainConfigSyncingClusterId $clusterId -UsePrimaryUserForAllDomains -AllowNtlmFallback:$false
            $created.Message | Should -BeNullOrEmpty
            $forest = Get-ZNSettingsAd | Where-Object {$_.ActiveDirectoryInfoDomainName -eq $domain} | Select-Object -First 1
            $forestId = $forest.ForestId
            $forestId | Should -Not -BeNullOrEmpty
            $u = Update-ZNSettingsAd -ForestId $forestId -PrimaryDomainConfigDomainControllerFqdns @("dc.$domain") -PrimaryDomainConfigDomainName $domain -PrimaryDomainConfigPassword $pw -PrimaryDomainConfigUseLdaps -PrimaryDomainConfigUserFqdn ZNRemoteManagement -PrimaryDomainConfigSyncingClusterId $clusterId -UsePrimaryUserForAllDomains:$false -AllowNtlmFallback:$false
            $u.Message | Should -BeNullOrEmpty
        } finally {
            if (-not $forestId) { $forestId = (Get-ZNSettingsAd -ErrorAction SilentlyContinue | Where-Object {$_.ActiveDirectoryInfoDomainName -eq $domain} | Select-Object -First 1).ForestId }
            if ($forestId) { Remove-ZNSettingsAd -ForestId $forestId -ErrorAction SilentlyContinue | Out-Null }
        }
    }
}
