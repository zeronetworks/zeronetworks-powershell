if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSettingsCloudConnectorFreezePeriod'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSettingsCloudConnectorFreezePeriod.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSettingsCloudConnectorFreezePeriod' {
    It 'UpdateExpanded' {
        if (@(Get-ZNSettingsCloudConnectorFreezePeriod).Count -gt 0) { Set-ItResult -Skipped -Because 'only one freeze window is allowed per tenant and one already exists'; return }
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $id = $null
        try {
            # random far-future window so it does not overlap other freeze periods
            $offset = Get-Random -Minimum 400 -Maximum 3000
            $id = New-ZNSettingsCloudConnectorFreezePeriod -Description "poshtestupdate-$sfx" -StartTime (ConvertTo-ZNEpochMS (Get-Date).AddDays($offset)) -EndTime (ConvertTo-ZNEpochMS (Get-Date).AddDays($offset + 2))
            if ($id.Message -match 'already exist') { Set-ItResult -Skipped -Because 'only one freeze window is allowed per tenant and one already exists (concurrent run)'; return }
            $id.FreezeWindowId | Should -Not -BeNullOrEmpty
            Update-ZNSettingsCloudConnectorFreezePeriod -FreezePeriodId $id.FreezeWindowId -Description "poshtestupdatedesc-$sfx" -StartTime (ConvertTo-ZNEpochMS (Get-Date).AddDays($offset + 1)) -EndTime (ConvertTo-ZNEpochMS (Get-Date).AddDays($offset + 3))
            $freezePeriod = @(Get-ZNSettingsCloudConnectorFreezePeriod) | Where-Object {$_.FreezeWindowId -eq $id.FreezeWindowId} | Select-Object -First 1
            $freezePeriod | Should -Not -BeNullOrEmpty
            $freezePeriod.Description | Should -Be "poshtestupdatedesc-$sfx"
        }
        finally {
            if ($id -and $id.FreezeWindowId) { Remove-ZNSettingsCloudConnectorFreezePeriod -FreezePeriodId $id.FreezeWindowId -ErrorAction SilentlyContinue }
        }
    }
}
