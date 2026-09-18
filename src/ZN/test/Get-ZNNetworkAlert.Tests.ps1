if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNNetworkAlert'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNNetworkAlert.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNNetworkAlert' {
    It 'List' -skip {
        # no data backend in staging
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Get' -skip {
        # no data backend in staging
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
