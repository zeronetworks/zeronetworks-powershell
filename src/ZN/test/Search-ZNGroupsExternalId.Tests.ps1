if(($null -eq $TestName) -or ($TestName -contains 'Search-ZNGroupsExternalId'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Search-ZNGroupsExternalId.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Search-ZNGroupsExternalId' {
    It 'Search' {
        # groupType must be one of ad|app|custom|ot|system|tag|inactive
        $found = $null
        foreach ($type in @('ad','app','custom','tag','system')) {
            $found = (Get-ZNGroupsByType -GroupType $type -Limit 100).Items | where {$_.ExternalId} | Select-Object -First 1
            if ($found) { $groupType = $type; break }
        }
        if (-not $found) { Set-ItResult -Skipped -Because 'tenant has no group with an external id'; return }
        $group = Search-ZNGroupsExternalId -ExternalId $found.ExternalId -GroupType $groupType
        $group.ItemId | Should -Not -BeNullOrEmpty
    }
}
