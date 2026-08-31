if(($null -eq $TestName) -or ($TestName -contains 'New-ZNConnectPostureProfile'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNConnectPostureProfile.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNConnectPostureProfile' {
    It 'CreateExpanded' {
        $result = New-ZNConnectPostureProfile -Action BLOCK  -CheckIntervalSeconds 900 -Name "NewPostureCheckTest" -WindowsChecksAntivirusIsEnabled:$true
        $result | should -not -BeNullOrEmpty
        Remove-ZNConnectPostureProfile -ProfileId $result.Replace('"',"")
    }
}
