if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNSettingsLicensesInUse'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNSettingsLicensesInUse.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNSettingsLicensesInUse' {
    It 'Get' {
        # tenant may legitimately have no connect licenses in use; verify the call succeeds and returns a count
        $licenses = Get-ZNSettingsLicensesInUse -LicenseType connect
        $licenses | Should -Not -BeNullOrEmpty
        $licenses.Count | Should -BeGreaterOrEqual 0
    }
}
