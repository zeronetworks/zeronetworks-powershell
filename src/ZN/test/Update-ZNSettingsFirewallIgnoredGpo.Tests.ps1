if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSettingsFirewallIgnoredGpo'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSettingsFirewallIgnoredGpo.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSettingsFirewallIgnoredGpo' {
    It 'UpdateExpanded' {
        $fwrules = Get-ZNSettingsFirewallIgnoredGpo
        { Update-ZNSettingsFirewallIgnoredGpo -InboundList $fwrules.InboundList -OutboundList @("newruletoignore") } | Should -Not -Throw
        Update-ZNSettingsFirewallIgnoredGpo -InboundList $fwrules.InboundList -OutboundList @()
    }
}
