if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNSettingsGlobalMapPreset'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSettingsGlobalMapPreset.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNSettingsGlobalMapPreset' {
    It 'UpdateExpanded' {
        $globalMapSettings = Get-ZNSettingsGlobalMapPreset
        $globalMapSettings.PresetServer = @("Application", "Environment", "Role")
        Update-ZNSettingsGlobalMapPreset -PresetClient $globalMapSettings.PresetClient -PresetCloud $globalMapSettings.PresetCloud -PresetK8S $globalMapSettings.PresetK8S -PresetOt $globalMapSettings.PresetOt -PresetServer $globalMapSettings.PresetServer
        $updatedSettings = Get-ZNSettingsGlobalMapPreset
        $updatedSettings.PresetServer | Should -Be @(@("Application", "Environment", "Role"))
        $globalMapSettings.PresetServer = @("Application", "Environment")
        Update-ZNSettingsGlobalMapPreset -PresetClient $globalMapSettings.PresetClient -PresetCloud $globalMapSettings.PresetCloud -PresetK8S $globalMapSettings.PresetK8S -PresetOt $globalMapSettings.PresetOt -PresetServer $globalMapSettings.PresetServer
    }
}
