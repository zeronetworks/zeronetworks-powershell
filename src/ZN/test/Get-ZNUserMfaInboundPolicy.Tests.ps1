if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNUserMfaInboundPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNUserMfaInboundPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNUserMfaInboundPolicy' {
    It 'List' {
        $user = (Get-ZNUser -Search zero).Items | where {$_.Name -eq "zero"} | Select-Object -First 1
        $user | Should -Not -BeNullOrEmpty
        (Get-ZNUserMfaInboundPolicy -UserId $user.Id -AddBuiltins).Count | Should -BeGreaterThan 0
    }

    It 'Get' {
        $user = (Get-ZNUser -Search zero).Items | where {$_.Name -eq "zero"} | Select-Object -First 1
        $user | Should -Not -BeNullOrEmpty
        $list = Get-ZNUserMfaInboundPolicy -UserId $user.Id -AddBuiltins
        $policy = if ($list.Items) { $list.Items | Select-Object -First 1 } else { $list | Select-Object -First 1 }
        $policy | Should -Not -BeNullOrEmpty
        $policy.Id | Should -Not -BeNullOrEmpty
        (Get-ZNUserMfaInboundPolicy -UserId $user.Id -ReactivePolicyId $policy.Id).ItemId | Should -Not -BeNullOrEmpty
    }
}
