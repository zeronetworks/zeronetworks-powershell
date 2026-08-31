if(($null -eq $TestName) -or ($TestName -contains 'Update-ZNConnectPolicy'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNConnectPolicy.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Update-ZNConnectPolicy' {
    It 'UpdateExpanded' {
        $region = (Get-ZNConnectPoliciesAllowedRegionsCandidate).Items | Select-Object -First 1
        $sourceAssets = (Get-ZNConnectPoliciesAssetsCandidate).Items | Select-Object -First 1
        $destAssets = (Get-ZNConnectPoliciesDestinationsCandidate).Items | Select-Object -First 1
        $sourceUsers = (Get-ZNConnectPoliciesSourceUsersCandidate).Items | Select-Object -First 1
        $policy = New-ZNConnectPolicy -AllowedRegions $region.Id -AlwaysOn -AutoDisconnectInOffice:$false -ConnectivityStateAfterReboot 1 -DstEntityIdsList @($destAssets.Id) -ForceSsoAuthentication -Name "UpdatePolicyTest" -LoginAuthorizedEntityAllowedAssetIdsList @($sourceAssets.Id) -LoginAuthorizedEntityAllowedAssetsSourcesList @(1) -LoginAuthorizedEntityAllowedUsersIdsList @($sourceUsers.id) -SessionTtlHours 168 -UseDefaultIdp -UseExternalBrowserForSso:$false -PriorityDirection BOTTOM
        Update-ZNConnectPolicy -UserAccessConfigId $policy.RoleId -Description "Updatedescription"
        $updatedPolicy = Get-ZNConnectPolicy | where {$_.Id -eq $policy.RoleId}
        $updatedPolicy.Description | Should -Be "Updatedescription"
        Remove-ZNConnectPolicy -UserAccessConfigId $policy.RoleId
    }
}
