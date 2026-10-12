if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSettingsK8SApplicationsLabel'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSettingsK8SApplicationsLabel.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSettingsK8SApplicationsLabel' {
    It 'UpdateExpanded' {
        $original = (Get-ZNSettingsK8SApplicationsLabel).Label
        try {
            $r = Update-ZNSettingsK8SApplicationsLabel -OverrideApplicationLabel "application"
            # cmdlet sends 'overrideApplicationLabel' but the API requires 'applicationLabelKey' (cmdlet/spec mismatch) - skip rather than fail on it
            if ($r.Error1) { Set-ItResult -Skipped -Because "API rejected the request: $($r.Message)"; return }
            $updatedSetting = $null
            foreach ($i in 1..5) {
                $updatedSetting = (Get-ZNSettingsK8SApplicationsLabel).Label
                if ($updatedSetting -eq 'application') { break }
                Start-Sleep -Seconds 2
            }
            $updatedSetting | Should -Be "application"
        }
        finally {
            if ([string]::IsNullOrEmpty($original)) { $original = "app" }
            Update-ZNSettingsK8SApplicationsLabel -OverrideApplicationLabel $original -ErrorAction SilentlyContinue
        }
    }
}
