if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNAssetsIPAlias'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAssetsIPAlias.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNAssetsIPAlias' {
    It 'UpdateExpanded' {
        $random = Get-Random -Minimum 1 -Maximum 100
        $ipalias = (Get-ZNAssetsIPAlias).Items | Select-First 1
        Update-ZNAssetsIPAlias -IPAliasId $ipalias.Id -Alias "updateName$random" -IPAddress $ipalias.IP
        (Get-ZNAssetsIPAlias -IPAliasId $ipalias.id).ItemAlias | Should -Be "updateName$random"
    }
}
