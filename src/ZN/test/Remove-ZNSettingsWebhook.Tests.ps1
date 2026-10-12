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
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $policy = $null
        $removed = $false
        try {
            $trigger = New-ZNSettingsWebhooksTrigger -MFAPolicies -MFAPoliciesResource inbound -MFAPoliciesTriggerEvent Any
            $policy = New-ZNSettingsWebhook -AuthType 1 -IsEnabled:$false -Name "RemoveWebhook-$sfx" -Url "https://someurl-$sfx.com" -ValidateCertificate:$false -Triggers @($trigger)
            $policy.WebhookServerId | Should -Not -BeNullOrEmpty
            { Remove-ZNSettingsWebhook -WebhookId $policy.WebhookServerId } | Should -Not -Throw
            $removed = $true
        }
        finally {
            if (-not $removed -and $policy -and $policy.WebhookServerId) { Remove-ZNSettingsWebhook -WebhookId $policy.WebhookServerId -ErrorAction SilentlyContinue }
        }
    }
}
