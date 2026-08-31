if(($null -eq $TestName) -or ($TestName -contains 'New-ZNAssetsIPAlias'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNAssetsIPAlias.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNAssetsIPAlias' {
    It 'CreateExpanded' {
        $ipalias = New-ZNAssetsIPAlias -Alias NewIpAlias -IPAddress 2.2.2.3
        $ipalias.ItemId | Should -Not -BeNullOrEmpty
        Remove-ZNAssetsIPAlias -IPAliasId $ipalias.ItemId
    }
}
