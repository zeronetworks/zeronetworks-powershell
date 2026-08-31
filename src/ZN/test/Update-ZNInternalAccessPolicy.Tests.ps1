if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNInternalAccessPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNInternalAccessPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNInternalAccessPolicy' {
    It 'UpdateExpanded' {
        $random = Get-Random -Minimum 1 -Maximum 100
        $iap = (Get-ZNInternalAccessPolicy).Items | select -First 1
        $updateIap = Update-ZNInternalAccessPolicy -PolicyId $iap.Id -Description "updated$random"
        $updateIap.Description | Should -Be "updated$random"
    }
}
