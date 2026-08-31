if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNConnectPostureProfile'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNConnectPostureProfile.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNConnectPostureProfile' {
    It 'Delete' {
        $result = New-ZNConnectPostureProfile -Action BLOCK  -CheckIntervalSeconds 900 -Name "NewPostureCheckTest" -WindowsChecksAntivirusIsEnabled:$true
        { Remove-ZNConnectPostureProfile -ProfileId $result.Replace('"',"") } | Should -Not -Throw
    }
}
