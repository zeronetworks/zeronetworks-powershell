if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNSettingsWebhook'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNSettingsWebhook.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNSettingsWebhook' {
    It 'Delete' {
        $trigger = New-ZNSettingsWebhooksTrigger -MFAPolicies -MFAPoliciesResource inbound -MFAPoliciesTriggerEvent Any
        $webhook = New-ZNSettingsWebhook -AuthType 1 -IsEnabled:$false -Name "RemoveWebhook" -Url "https://someurl.com" -ValidateCertificate:$false -Triggers @($trigger)
        { Remove-ZNSettingsWebhook -WebhookId $webhook.WebhookServerId } | Should -Not -Throw
    }
}
