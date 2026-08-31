if(($null -eq $TestName) -or ($TestName -contains 'Test-ZNSettingsWebhook'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Test-ZNSettingsWebhook.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Test-ZNSettingsWebhook' {
    It 'TestExpanded' {
        $webhook = Get-ZNSettingsWebhook | Select -First 1
        (Test-ZNSettingsWebhook -WebhookId $webhook.Id).ConnectionStateStatusCode | Should -No -BeNulOrEmpty
    }
}
