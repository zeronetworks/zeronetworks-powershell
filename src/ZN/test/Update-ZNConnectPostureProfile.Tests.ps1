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
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $profileId = $null
        try {
            $result = New-ZNConnectPostureProfile -Action BLOCK -CheckIntervalSeconds 900 -Name "UpdatePostureCheckTest-$sfx" -WindowsChecksAntivirusIsEnabled:$true
            $result | Should -BeOfType [string]
            $profileId = $result.Replace('"',"")
            $profileId | Should -Not -BeNullOrEmpty
            Update-ZNConnectPostureProfile -ProfileId $profileId -WindowsChecksDiskEncryptedIsEncrypted:$true
            $postureProfile = (Get-ZNConnectPostureProfile -Limit 400).Items | where {$_.Id -eq $profileId}
            $postureProfile.WindowsChecksDiskEncryptedIsEncrypted | Should -Be $true
        }
        finally {
            if ($profileId) { Remove-ZNConnectPostureProfile -ProfileId $profileId -ErrorAction SilentlyContinue }
        }
    }
}
