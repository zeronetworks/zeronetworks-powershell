if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNNetworkAlertExclusion'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNNetworkAlertExclusion.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNNetworkAlertExclusion' {
    It 'List' {
        (get-ZNNetworkAlertExclusion).Items.Count | Should -BeGreaterThan 0
    }

    It 'Get' {
        $exclusion = (get-ZNNetworkAlertExclusion).Items | Select -First 1
        (Get-ZNNetworkAlertExclusion -ExclusionId $exclusion.id).Id | Should -Be $exclusion.id
    }
}
