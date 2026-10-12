if(($null -eq $TestName) -or ($TestName -contains 'Get-ZNSettingsClusterPilotGroup'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNSettingsClusterPilotGroup.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-ZNSettingsClusterPilotGroup' {
    It 'Get' {
        # NOTE: static fix, not verified live (changes a tenant-wide setting). Get-ZNSettingsDeploymentsCluster returns a plain array and the tenant has no cluster named 'Pilot'.
        $cluster = @(Get-ZNSettingsDeploymentsCluster) | Select-Object -First 1
        if (-not $cluster -or -not $cluster.Id) { Set-ItResult -Skipped -Because 'no deployments cluster available on this tenant'; return }
        # the Get answers NotFound when no pilot group is set
        $original = $null
        try { $original = (Get-ZNSettingsClusterPilotGroup -Product segment-server -ErrorAction Stop).ClusterId } catch { $original = $null }
        try {
            Update-ZNSettingsClusterPilotGroup -Product segment-server -ClusterId $cluster.Id
            (Get-ZNSettingsClusterPilotGroup -Product segment-server).ClusterId | Should -Be $cluster.Id
        }
        finally {
            if ($original) { Update-ZNSettingsClusterPilotGroup -Product segment-server -ClusterId $original -ErrorAction SilentlyContinue }
            else { Clear-ZNSettingsClusterPilotGroup -Product segment-server -ErrorAction SilentlyContinue }
        }
    }
}
