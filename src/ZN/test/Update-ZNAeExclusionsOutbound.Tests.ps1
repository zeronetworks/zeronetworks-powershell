if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNAeExclusionsOutbound'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAeExclusionsOutbound.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNAeExclusionsOutbound' {
    It 'UpdateExpanded' {
        $aeExclusion = $null
        $ip = "198.18.$(Get-Random -Minimum 1 -Maximum 254).$(Get-Random -Minimum 1 -Maximum 254)"
        [string]$port = Get-Random -Minimum 1025 -Maximum 65000
        $portsList = New-ZNPortsList -Protocol TCP -Ports $port
        $remote = Invoke-ZNEncodeEntityIP -IP $ip
        $remote | Should -Not -BeNullOrEmpty
        $entity = (Get-ZNAeExclusionsOutboundSourceCandidate -Search "All segmented Clients").Items | Select-Object -First 1
        $entity | Should -Not -BeNullOrEmpty
        try {
            $aeExclusion = New-ZNAeExclusionsOutbound -LocalEntityId $entity.id -LocalProcessesList @("*") -PortsList $portsList -RemoteEntityIdsList @($remote.id) -Action 1
            $aeExclusion.ItemId | Should -Not -BeNullOrEmpty
            $description = "Updated $(Get-Random -Minimum 1 -Maximum 1000)"
            Update-ZNAeExclusionsOutbound -RuleId $aeExclusion.ItemId -Description $description
            $updated = Get-ZNAeExclusionsOutbound -RuleId $aeExclusion.ItemId
            $actual = ($updated.ItemDescription, $updated.Description | where {$_} | Select-Object -First 1)
            $actual | Should -Be $description
        }
        finally {
            if ($aeExclusion -and $aeExclusion.ItemId) { Remove-ZNAeExclusionsOutbound -RuleId $aeExclusion.ItemId -ErrorAction SilentlyContinue }
        }
    }
}
