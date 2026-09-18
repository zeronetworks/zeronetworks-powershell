if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNLabelsValueCandidate'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNLabelsValueCandidate.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNLabelsValueCandidate' {
    It 'List' {
        $labelKey = (Get-ZNLabelsKeyCandidate).Items | Select-Object -First 1
        (Get-ZNLabelsValueCandidate -Key $labelKey.Name).Items.Count | Should -BeGreaterThan 0
    }
}
