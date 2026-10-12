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
        $all = Get-ZNSettingsWebhook
        if ($all.Items) { $all = $all.Items }
        $webhook = $all | Select-Object -First 1
        if (-not $webhook -or -not $webhook.Id) { Set-ItResult -Skipped -Because 'tenant has no webhook configured'; return }
        $result = Test-ZNSettingsWebhook -WebhookId $webhook.Id
        $result | Should -Not -BeNullOrEmpty
    }
}
