if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNInternalAccessPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNInternalAccessPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNInternalAccessPolicy' {
    It 'List' {
        (Get-ZNInternalAccessPolicy).Items.Count | Should -BeGreaterThan 0
    }

    It 'Get' {
        $policy = (Get-ZNInternalAccessPolicy).Items[0]
        (Get-ZNInternalAccessPolicy -PolicyId $policy.Id).ItemId | Should -Not -BeNullOrEmpty
    }
}
