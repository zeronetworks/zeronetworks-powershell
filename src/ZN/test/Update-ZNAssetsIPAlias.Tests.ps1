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
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $ip = "198.18.$(Get-Random -Minimum 1 -Maximum 250).$(Get-Random -Minimum 1 -Maximum 250)"
        $created = $null
        try {
            $created = New-ZNAssetsIPAlias -Alias "updateAlias-$sfx" -IPAddress $ip
            $created.ItemId | Should -Not -BeNullOrEmpty
            Update-ZNAssetsIPAlias -IPAliasId $created.ItemId -Alias "updateName-$sfx" -IPAddress $ip
            (Get-ZNAssetsIPAlias -IPAliasId $created.ItemId).ItemAlias | Should -Be "updateName-$sfx"
        }
        finally {
            if ($created -and $created.ItemId) { Remove-ZNAssetsIPAlias -IPAliasId $created.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
