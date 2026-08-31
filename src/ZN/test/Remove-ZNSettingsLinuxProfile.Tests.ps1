if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNSettingsLinuxProfile'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNSettingsLinuxProfile.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNSettingsLinuxProfile' {
    It 'Delete' {
        $linuxProfile = New-ZNSettingsLinuxProfile -Name NewLinuxProfile -SshCredentialsUsername zn-admin -SshCredentialsPassword "myPassword" -SshCredentialsPrivateKey "-----BEGIN OPENSSH PRIVATE KEY-----b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAaAAAABNlY2RzYS1zaGEyLW5pc3RwMjU2AAAACG5pc3RwMjU2AAAAQQQbIasl5Gh2GNPIIowEPyJAzZIjgbBZ2uDggWyZI5qnIeWLFa3OjG9bG2CmmGWcVMwkG96Xr9das+bG8/SK5mJQAAAAuAFsZmYBbGZmAAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBshqyXkaHYY08gijAQ/IkDNkiOBsFna4OCBbJkjmqch5YsVrc6Mb1sbYKaYZZxUzCQb3pev11qz5sbz9IrmYlAAAAAhAMYeVSy3xRUDxfhRxbXeuc4SxDKt5teAnnwaNwuCTmP8AAAAGW5pY2hvbGFzQFNlY0plZGlBaXIubG9jYWwBAgMEBQY=-----END OPENSSH PRIVATE KEY-----" -AllowInstallPackages
        { Remove-ZNSettingsLinuxProfile -ProfileId $linuxProfile.ProfileId } | Should -Not -Throw
    }
}
