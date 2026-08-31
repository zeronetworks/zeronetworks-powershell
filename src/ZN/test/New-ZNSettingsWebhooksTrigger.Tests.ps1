if(($null -eq $TestName) -or ($TestName -contains 'New-ZNSettingsWebhooksTrigger'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNSettingsWebhooksTrigger.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNSettingsWebhooksTrigger' {
    It 'RulesReview' {
        (New-ZNSettingsWebhooksTrigger -RulesReview -RulesReviewResource Inbound -RulesReviewTriggerEvent Any).Topic | Should -Be 2
    }

    It 'Rules' {
        (New-ZNSettingsWebhooksTrigger -Rules -RulesResource "INBOUNDIT" -RulesTriggerEvent "Created").Topic | Should -Be 1
    }

    It 'MFAPolicies' {
        (New-ZNSettingsWebhooksTrigger -MFAPolicies -MFAPoliciesResource inbound -MFAPoliciesTriggerEvent Any).Topic | Should -Be 3
    }
}
