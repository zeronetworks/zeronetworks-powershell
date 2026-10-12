if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNUserMfaOutboundPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNUserMfaOutboundPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNUserMfaOutboundPolicy' {
    It 'List' {
        $user = (Get-ZNUser -Search zero).Items | where {$_.Name -eq "zero"} | Select-Object -First 1
        $user | Should -Not -BeNullOrEmpty
        (Get-ZNUserMfaOutboundPolicy -UserId $user.Id).Count | Should -BeGreaterThan 0
    }

    It 'Get' {
        $user = (Get-ZNUser -Search zero).Items | where {$_.Name -eq "zero"} | Select-Object -First 1
        $user | Should -Not -BeNullOrEmpty
        $list = Get-ZNUserMfaOutboundPolicy -UserId $user.Id
        $policy = if ($list.Items) { $list.Items | Select-Object -First 1 } else { $list | Select-Object -First 1 }
        $policy | Should -Not -BeNullOrEmpty
        $policy.Id | Should -Not -BeNullOrEmpty
        (Get-ZNUserMfaOutboundPolicy -UserId $user.Id -ReactivePolicyId $policy.Id).ItemId | Should -Not -BeNullOrEmpty
    }
}
