if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSettingsFirewallProfile'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSettingsFirewallProfile.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSettingsFirewallProfile' {
    It 'UpdateExpanded' {
        { Update-ZNSettingsFirewallProfile -InboundAllowDomain -InboundAllowPublic -InboundBlockPrivate -OutboundBlockDomain -OutboundBlockPublic:$false -InboundAllowPrivate -InboundBlockDomain -InboundBlockPublic -OutboundBlockPrivate } | Should -Not -Throw
        Update-ZNSettingsFirewallProfile -InboundAllowDomain -InboundAllowPublic -InboundBlockPrivate -OutboundBlockDomain -OutboundBlockPublic -InboundAllowPrivate -InboundBlockDomain -InboundBlockPublic -OutboundBlockPrivate
    }
}
