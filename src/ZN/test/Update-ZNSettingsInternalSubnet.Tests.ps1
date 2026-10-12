$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSettingsInternalSubnet.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Update-ZNSettingsInternalSubnet' {
    It 'UpdateExpanded' {
        # the server lists 0.0.0.0/32 in its own response but rejects it as input ("privateIpv4NetworksList[0] contains an invalid value"), so never send it back
        $original = @((Get-ZNSettingsInternalSubnet).ConfigPrivateIpv4NetworksList)
        $original.Count | Should -BeGreaterThan 0
        # the API requires the IPv6 list in the same request
        $v6 = @((Get-ZNSettingsInternalSubnet).ConfigPrivateIpv6NetworksList)
        $restore = @($original | Where-Object { $_ -ne '0.0.0.0/32' })
        try {
            if ($restore -contains '198.18.0.0/15') {
                $newSetting = @($restore | Where-Object { $_ -ne '198.18.0.0/15' })
            } else {
                $newSetting = @($restore + '198.18.0.0/15')
            }
            $r = Update-ZNSettingsInternalSubnet -PrivateIpv4NetworksList $newSetting -PrivateIpv6NetworksList $v6
            $r.Message | Should -BeNullOrEmpty
            $updatedSetting = @((Get-ZNSettingsInternalSubnet).ConfigPrivateIpv4NetworksList)
            if ($newSetting -contains '198.18.0.0/15') { $updatedSetting | Should -Contain '198.18.0.0/15' } else { $updatedSetting | Should -Not -Contain '198.18.0.0/15' }
        }
        finally {
            Update-ZNSettingsInternalSubnet -PrivateIpv4NetworksList $restore -PrivateIpv6NetworksList $v6 -ErrorAction SilentlyContinue | Out-Null
        }
    }
}
