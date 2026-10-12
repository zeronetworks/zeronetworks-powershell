if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSettingsAdLinuxAutomationGroup'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSettingsAdLinuxAutomationGroup.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSettingsAdLinuxAutomationGroup' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $pw = 'Zn-' + (-join ((48..57)+(65..90)+(97..122) | Get-Random -Count 14 | ForEach-Object {[char]$_})) + '!1'
        $domain = "updlag$sfx.test.com"
        $forestId = $null
        try {
            $clusterId = (Get-ZNSettingsAd | Where-Object { $_.ActiveDirectoryInfoSyncingClusterId } | Select-Object -First 1).ActiveDirectoryInfoSyncingClusterId
            if (-not $clusterId) { Set-ItResult -Skipped -Because 'no existing AD forest with a syncing cluster id on this tenant'; return }
            $created = New-ZNSettingsAd -PrimaryDomainConfigDomainControllerFqdns @("dc.$domain") -PrimaryDomainConfigDomainName $domain -PrimaryDomainConfigUseLdaps -PrimaryDomainConfigUserFqdn ZNRemoteManagement -PrimaryDomainConfigPassword $pw -PrimaryDomainConfigSyncingClusterId $clusterId -UsePrimaryUserForAllDomains -AllowNtlmFallback:$false
            $created.Message | Should -BeNullOrEmpty
            $forest = Get-ZNSettingsAd | Where-Object {$_.ActiveDirectoryInfoDomainName -eq $domain} | Select-Object -First 1
            $forestId = $forest.ForestId
            $forestId | Should -Not -BeNullOrEmpty
            $lin = Update-ZNSettingsAdLinux -DomainId $domain -ForestId $forestId -AdLinuxConfigAllowInstallPackages -AdLinuxConfigPassword $pw -AdLinuxConfigPrivateKey "-----BEGIN RSA PRIVATE KEY-----MIIBOgIBAAJBAKj34GkxFhD90vcNLYLInFEX6Ppy1tPf9Cnzj4p4WGeKLs1Pt8QuKUpRKfFLfRYC9AIKjbJTWit+CqvjWYzvQwECAwEAAQJAIJLixBy2qpFoS4DSmoEmo3qGy0t6z09AIJtH+5OeRV1be+N4cDYJKffGzDa88vQENZiRm0GRq6a+HPGQMd2kTQIhAKMSvzIBnni7ot/OSie2TmJLY4SwTQAevXysE2RbFDYdAiEBCUEaRQnMnbp79mxDXDf6AU0cN/RPBjb9qSHDcWZHGzUCIG2Es59z8ugGrDY+pxLQnwfotadxd+Uyv/Ow5T0q5gIJAiEAyS4RaI9YG8EWx/2w0T67ZUVAw8eOMB6BIUg0Xcu+3okCIBOs/5OiPgoTdSy7bcF9IGpSE8ZgGKzgYQVZeN97YE00-----END RSA PRIVATE KEY-----" -AdLinuxConfigUsername "zn-admin" -UseForAllDomains
            $lin.Message | Should -BeNullOrEmpty
            $r = Update-ZNSettingsAdLinuxAutomationGroup -ForestId $forestId -MonitoredGroupId b:110003
            $r.Message | Should -BeNullOrEmpty
        } finally {
            if (-not $forestId) { $forestId = (Get-ZNSettingsAd -ErrorAction SilentlyContinue | Where-Object {$_.ActiveDirectoryInfoDomainName -eq $domain} | Select-Object -First 1).ForestId }
            if ($forestId) { Remove-ZNSettingsAd -ForestId $forestId -ErrorAction SilentlyContinue | Out-Null }
        }
    }
}
