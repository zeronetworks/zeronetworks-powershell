if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNSettingsCloudConnectorFreezePeriod'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNSettingsCloudConnectorFreezePeriod.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNSettingsCloudConnectorFreezePeriod' {
    It 'Delete' {
        if (@(Get-ZNSettingsCloudConnectorFreezePeriod).Count -gt 0) { Set-ItResult -Skipped -Because 'only one freeze window is allowed per tenant and one already exists'; return }
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $policy = $null
        $removed = $false
        try {
            $start = (Get-Date).AddDays((Get-Random -Minimum 60 -Maximum 700))
            $policy = New-ZNSettingsCloudConnectorFreezePeriod -Description "poshtestremove-$sfx" -StartTime (ConvertTo-ZNEpochMS $start) -EndTime (ConvertTo-ZNEpochMS $start.AddDays(1))
            if ($policy.Message -match 'already exist') { Set-ItResult -Skipped -Because 'only one freeze window is allowed per tenant and one already exists (concurrent run)'; return }
            $policy.FreezeWindowId | Should -Not -BeNullOrEmpty
            { Remove-ZNSettingsCloudConnectorFreezePeriod -FreezePeriodId $policy.FreezeWindowId } | Should -Not -Throw
            $removed = $true
        }
        finally {
            if (-not $removed -and $policy -and $policy.FreezeWindowId) { Remove-ZNSettingsCloudConnectorFreezePeriod -FreezePeriodId $policy.FreezeWindowId -ErrorAction SilentlyContinue }
        }
    }
}
