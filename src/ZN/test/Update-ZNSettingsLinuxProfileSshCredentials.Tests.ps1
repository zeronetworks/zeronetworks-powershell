if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSettingsLinuxProfileSshCredentials'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSettingsLinuxProfileSshCredentials.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSettingsLinuxProfileSshCredentials' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $linuxProfile = $null
        try {
            $linuxProfile = New-ZNSettingsLinuxProfile -Name "UpdateLinuxProfileSsh-$sfx" -SshCredentialsUsername zn-admin -SshCredentialsPassword "myPassword" -SshCredentialsPrivateKey "-----BEGIN OPENSSH PRIVATE KEY-----b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAaAAAABNlY2RzYS1zaGEyLW5pc3RwMjU2AAAACG5pc3RwMjU2AAAAQQQbIasl5Gh2GNPIIowEPyJAzZIjgbBZ2uDggWyZI5qnIeWLFa3OjG9bG2CmmGWcVMwkG96Xr9das+bG8/SK5mJQAAAAuAFsZmYBbGZmAAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBshqyXkaHYY08gijAQ/IkDNkiOBsFna4OCBbJkjmqch5YsVrc6Mb1sbYKaYZZxUzCQb3pev11qz5sbz9IrmYlAAAAAhAMYeVSy3xRUDxfhRxbXeuc4SxDKt5teAnnwaNwuCTmP8AAAAGW5pY2hvbGFzQFNlY0plZGlBaXIubG9jYWwBAgMEBQY=-----END OPENSSH PRIVATE KEY-----" -AllowInstallPackages
            $linuxProfile.ProfileId | Should -Not -BeNullOrEmpty
            Update-ZNSettingsLinuxProfileSshCredentials -ProfileId $linuxProfile.ProfileId -SshCredentialsUsername zn-admin2 -SshCredentialsPassword "myNewPassword" -SshCredentialsPrivateKey "-----BEGIN OPENSSH PRIVATE KEY-----b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAaAAAABNlY2RzYS1zaGEyLW5pc3RwMjU2AAAACG5pc3RwMjU2AAAAQQQbIasl5Gh2GNPIIowEPyJAzZIjgbBZ2uDggWyZI5qnIeWLFa3OjG9bG2CmmGWcVMwkG96Xr9das+bG8/SK5mJQAAAAuAFsZmYBbGZmAAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBshqyXkaHYY08gijAQ/IkDNkiOBsFna4OCBbJkjmqch5YsVrc6Mb1sbYKaYZZxUzCQb3pev11qz5sbz9IrmYlAAAAAhAMYeVSy3xRUDxfhRxbXeuc4SxDKt5teAnnwaNwuCTmP8AAAAGW5pY2hvbGFzQFNlY0plZGlBaXIubG9jYWwBAgMEBQY=-----END OPENSSH PRIVATE KEY-----"
            $updatedProfile = @(Get-ZNSettingsLinuxProfile) | Where-Object {$_.Id -eq $linuxProfile.ProfileId} | Select-Object -First 1
            $updatedProfile | Should -Not -BeNullOrEmpty
            $updatedProfile.Username | Should -Be "zn-admin2"
        }
        finally {
            if ($linuxProfile -and $linuxProfile.ProfileId) { Remove-ZNSettingsLinuxProfile -ProfileId $linuxProfile.ProfileId -ErrorAction SilentlyContinue }
        }
    }
}
