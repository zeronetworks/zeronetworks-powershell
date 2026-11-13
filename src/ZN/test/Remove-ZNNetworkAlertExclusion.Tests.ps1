if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNNetworkAlertExclusion'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNNetworkAlertExclusion.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNNetworkAlertExclusion' {
    It 'Delete' {
        $file = "C:\test" + (Get-Random -Min 1 -Max 100) + ".exe"
        $exclusion = new-znNetworkAlertExclusion -UserAlertClassification not_malicious -InvolvedEntityIds @($file) -Comment "test api" -InvolvedEntityType process
        { Remove-ZNNetworkAlertExclusion -ExclusionId $exclusion.exclusionid } | Should -Not -Throw
    }
}
