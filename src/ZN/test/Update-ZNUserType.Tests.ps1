if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNUserType'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNUserType.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNUserType' {
    It 'Update' {
        # preferred test user first, then a user named 'test'; skip if the tenant has neither
        $user = (Get-ZNUser -Search user1).Items | Select-Object -First 1
        if (-not $user) { $user = (Get-ZNUser -Search test).Items | Where-Object {$_.Name -eq 'test'} | Select-Object -First 1 }
        if (-not $user -or -not $user.Id) { Set-ItResult -Skipped -Because "no suitable test user (user1 / test) on this tenant"; return }
        $origType = $user.UserType
        $origType | Should -Not -BeNullOrEmpty
        $newType = if ($origType -ne 1) { 1 } else { 2 }
        try {
            { Update-ZNUserType -Comment "fix" -UserType $newType -UserIds @($user.Id) } | Should -Not -Throw
            (Get-ZNUser -Search $user.Name).Items | Where-Object {$_.Id -eq $user.Id} | ForEach-Object { $_.UserType | Should -Be $newType }
        } finally {
            Update-ZNUserType -Comment "fix" -UserType $origType -UserIds @($user.Id) -ErrorAction SilentlyContinue
        }
    }
    It 'UpdateExpanded' {
        # preferred test user first, then a user named 'test'; skip if the tenant has neither
        $user = (Get-ZNUser -Search user1).Items | Select-Object -First 1
        if (-not $user) { $user = (Get-ZNUser -Search test).Items | Where-Object {$_.Name -eq 'test'} | Select-Object -First 1 }
        if (-not $user -or -not $user.Id) { Set-ItResult -Skipped -Because "no suitable test user (user1 / test) on this tenant"; return }
        $origType = $user.UserType
        $origType | Should -Not -BeNullOrEmpty
        $newType = if ($origType -ne 1) { 1 } else { 2 }
        try {
            { Update-ZNUserType -Comment "Fix" -UserType $newType -UserId $user.Id } | Should -Not -Throw
            (Get-ZNUser -Search $user.Name).Items | Where-Object {$_.Id -eq $user.Id} | ForEach-Object { $_.UserType | Should -Be $newType }
        } finally {
            Update-ZNUserType -Comment "fix" -UserType $origType -UserId $user.Id -ErrorAction SilentlyContinue
        }
    }
}
