if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNConnectPostureProfile'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNConnectPostureProfile.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNConnectPostureProfile' {
    It 'UpdateExpanded' {
        $result = New-ZNConnectPostureProfile -Action BLOCK  -CheckIntervalSeconds 900 -Name "UpdatePostureCheckTest" -WindowsChecksAntivirusIsEnabled:$true
        Update-ZNConnectPostureProfile -ProfileId $result.Replace('"',"") -WindowsChecksDiskEncryptedIsEncrypted:$true
        $postureProfile = (Get-ZNConnectPostureProfile -Limit 400).Items | where {$_.id -eq $result.Replace('"',"")}
        $postureProfile.WindowsChecksDiskEncryptedIsEncrypted | Should -Be $true
        Remove-ZNConnectPostureProfile -ProfileId $result.Replace('"',"")
    }
}
