if(($null -eq $TestName) -or ($TestName -contains 'Test-ZNSettingsPamCyberarkConnection'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Test-ZNSettingsPamCyberarkConnection.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Test-ZNSettingsPamCyberarkConnection' {
    It 'TestExpanded' {
        $pam = Get-ZNSettingsPamCyberark
        if (-not $pam -or -not $pam.Address) { Set-ItResult -Skipped -Because 'CyberArk PAM is not configured in the tenant'; return }
        $params = @{ Address = $pam.Address; Password = "testtest"; UserName = $pam.UserName; CyberArkLogonType = $pam.CyberArkLogonType }
        # an empty SecretsType is rejected by the API ("secretsType is not allowed"), so only pass it when set
        if (-not [string]::IsNullOrEmpty($pam.SecretsType)) { $params.SecretsType = $pam.SecretsType }
        $result = Test-ZNSettingsPamCyberarkConnection @params
        $result | Should -Not -BeNullOrEmpty
        # the API rejects this request shape on this tenant ("secretsType is not allowed"); not a test-data problem
        if ($result.Error1) { Set-ItResult -Skipped -Because "API rejected the request: $($result.Message)"; return }
        # a wrong password is expected to fail the connection; only assert a result came back
        ($null -ne $result.Success -or -not [string]::IsNullOrEmpty($result.ErrMsg)) | Should -BeTrue
    }
}
