if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNSettingsConnectRegionFailoverCandidate'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNSettingsConnectRegionFailoverCandidate.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNSettingsConnectRegionFailoverCandidate' {
    It 'Get' {
        $region = (Get-ZNSettingsConnectRegion).Items | Select-Object -First 1 
        (Get-ZNSettingsConnectRegionFailoverCandidate -RegionId $region.id).Id | Should -Not -BeNullOrEmpty
    }
}
