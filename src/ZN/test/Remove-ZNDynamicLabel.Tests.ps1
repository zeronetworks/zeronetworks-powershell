if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNDynamicLabel'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNDynamicLabel.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNDynamicLabel' {
    It 'Delete' -skip {
        $dynamicLabel = New-ZNDynamicLabel -LabelKey DBServer2 -LabelValue True -ConditionNamePatterns "(.*)DB(.*)"
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
