if(($null -eq $TestName) -or ($TestName -contains 'Invoke-ZNMarkK8SDesiredStateClusterAsDesired'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Invoke-ZNMarkK8SDesiredStateClusterAsDesired.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Invoke-ZNMarkK8SDesiredStateClusterAsDesired' {
    It 'Mark' -skip {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'MarkViaIdentity' -skip {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
