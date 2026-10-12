if(($null -eq $TestName) -or ($TestName -contains 'New-ZNSettingsCloudConnectorFreezePeriod'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNSettingsCloudConnectorFreezePeriod.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNSettingsCloudConnectorFreezePeriod' {
    It 'CreateExpanded' {
        if (@(Get-ZNSettingsCloudConnectorFreezePeriod).Count -gt 0) { Set-ItResult -Skipped -Because 'only one freeze window is allowed per tenant and one already exists'; return }
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $offset = Get-Random -Minimum 400 -Maximum 3000
        $id = $null
        try {
            $id = New-ZNSettingsCloudConnectorFreezePeriod -Description "poshtestget-$sfx" -StartTime (ConvertTo-ZNEpochMS (Get-date).AddDays($offset)) -EndTime (ConvertTo-ZNEpochMS (Get-date).AddDays($offset + 5))
            if ($id.Message -match 'already exist') { Set-ItResult -Skipped -Because 'only one freeze window is allowed per tenant and one already exists (concurrent run)'; return }
            $id.FreezeWindowId | Should -Not -BeNullOrEmpty
        } finally {
            if ($id -and $id.FreezeWindowId) { Remove-ZNSettingsCloudConnectorFreezePeriod -FreezePeriodId $id.FreezeWindowId -ErrorAction SilentlyContinue }
        }
    }
}
