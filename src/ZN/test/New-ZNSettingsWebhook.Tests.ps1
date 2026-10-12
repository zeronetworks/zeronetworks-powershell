if(($null -eq $TestName) -or ($TestName -contains 'New-ZNSettingsWebhook'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNSettingsWebhook.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNSettingsWebhook' {
    It 'CreateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $webhook = $null
        try {
            $trigger = New-ZNSettingsWebhooksTrigger -MFAPolicies -MFAPoliciesResource inbound -MFAPoliciesTriggerEvent Any
            $webhook = New-ZNSettingsWebhook -AuthType 1 -IsEnabled:$false -Name "NewWebhook-$sfx" -Url "https://someurl-$sfx.com" -ValidateCertificate:$false -Triggers @($trigger)
            $webhook.WebhookServerId | Should -Not -BeNullOrEmpty
            $webhook.WebhookServerId | Should -BeLike "e:w:*"
        } finally {
            if ($webhook -and $webhook.WebhookServerId) { Remove-ZNSettingsWebhook -WebhookId $webhook.WebhookServerId -ErrorAction SilentlyContinue }
        }
    }
}
