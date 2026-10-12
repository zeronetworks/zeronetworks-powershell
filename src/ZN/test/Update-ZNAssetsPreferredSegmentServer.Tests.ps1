if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNAssetsPreferredSegmentServer'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNAssetsPreferredSegmentServer.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNAssetsPreferredSegmentServer' {
    It 'UpdateExpanded' {
        $segmentServers = @(Get-ZNSegmentServer)
        # only regular (a:a:) assets that are managed by a deployments cluster can have a preferred segment server ("some assets are not managed by deployments" otherwise),
        # and the segment server has to come from that same cluster
        $clusterIds = @($segmentServers | ForEach-Object { $_.ClusterId } | Where-Object { $_ })
        $asset = (Get-ZNAsset -Limit 400).Items | Where-Object { $_.Id -like 'a:a:*' -and $_.DeploymentClusterId -in $clusterIds -and [string]::IsNullOrEmpty($_.PreferredDeploymentId) } | Select-Object -First 1
        if (-not $asset) { Set-ItResult -Skipped -Because 'no deployment-managed asset without a preferred segment server on this tenant'; return }
        $segmentServer = $segmentServers | Where-Object {$_.ClusterId -eq $asset.DeploymentClusterId} | Select-Object -First 1
        $segmentServer | Should -Not -BeNullOrEmpty -Because "no segment server in cluster $($asset.DeploymentClusterId)"
        $changed = $false
        try {
            $result = Update-ZNAssetsPreferredSegmentServer -AssetIds @($asset.Id) -PreferredDeploymentId $segmentServer.Id
            $changed = $true
            $result.Error1 | Should -BeNullOrEmpty -Because "$($result.Message)"
            (Get-ZNAssetsPreferredSegmentServer -AssetId $asset.Id).PreferredDeployment | Should -Be $segmentServer.Id
        }
        finally {
            if ($changed) { Update-ZNAssetsPreferredSegmentServer -AssetIds @($asset.Id) -PreferredDeploymentId $null -ErrorAction SilentlyContinue }
        }
    }
}
