$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSettingsConnectRegion.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Update-ZNSettingsConnectRegion' {
    It 'UpdateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $name = "UpdRegion-$sfx"
        $region = $null
        try {
            $ip = "{0}.{1}.{2}.{3}" -f (Get-Random -Minimum 11 -Maximum 99), (Get-Random -Minimum 1 -Maximum 254), (Get-Random -Minimum 1 -Maximum 254), (Get-Random -Minimum 1 -Maximum 254)
            New-ZNSettingsConnectRegion -DnsServersIPAddressList @("192.168.1.1") -IPAddress $ip -Name $name
            $region = (Get-ZNSettingsConnectRegion).Items | Where-Object {$_.Name -eq $name} | Select-Object -First 1
            $region | Should -Not -BeNullOrEmpty
            $region.Id | Should -Not -BeNullOrEmpty
            { Update-ZNSettingsConnectRegion -RegionId $region.Id -DnsServersIPAddressList $region.DnsServersIPAddressList -IPAddress $region.IPAddress -Name $region.Name -DnsSuffixesList @("test.local") } | Should -Not -Throw
        }
        finally {
            $cleanup = (Get-ZNSettingsConnectRegion).Items | Where-Object {$_.Name -eq $name} | Select-Object -First 1
            if ($cleanup -and $cleanup.Id) { Remove-ZNSettingsConnectRegion -RegionId $cleanup.Id -ErrorAction SilentlyContinue }
        }
    }
}
