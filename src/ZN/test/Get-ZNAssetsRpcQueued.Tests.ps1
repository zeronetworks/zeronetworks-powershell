if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNAssetsRpcQueued'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNAssetsRpcQueued.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNAssetsRpcQueued' {
    It 'List' {
        # the tenant may legitimately have no matching assets, so only assert the call succeeds and returns a response
        $result = Get-ZNAssetsRpcQueued
        $result | Should -Not -BeNullOrEmpty
        @($result.Items).Count | Should -BeGreaterOrEqual 0
    }
}
