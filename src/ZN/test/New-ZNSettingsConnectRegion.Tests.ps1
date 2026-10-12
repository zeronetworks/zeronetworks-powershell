$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNSettingsConnectRegion.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'New-ZNSettingsConnectRegion' {
    It 'CreateExpanded' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | % {[char]$_})
        $name = "NewRegion-$sfx"
        $ip = "10.$(Get-Random -Minimum 1 -Maximum 254).$(Get-Random -Minimum 1 -Maximum 254).$(Get-Random -Minimum 1 -Maximum 254)"
        $region = $null
        try {
            New-ZNSettingsConnectRegion -DnsServersIPAddressList @("192.168.1.1") -IPAddress $ip -Name $name
            $region = (Get-ZNSettingsConnectRegion).Items | where {$_.Name -eq $name} | Select-Object -First 1
            $region | Should -Not -BeNullOrEmpty
            $region.Name | Should -Be $name
        } finally {
            if (-not $region) { $region = (Get-ZNSettingsConnectRegion -ErrorAction SilentlyContinue).Items | where {$_.Name -eq $name} | Select-Object -First 1 }
            if ($region -and $region.Id) { Remove-ZNSettingsConnectRegion -RegionId $region.Id -ErrorAction SilentlyContinue }
        }
    }
}
