$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNSettingsConnectRegion.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Remove-ZNSettingsConnectRegion' {
    It 'Delete' {
        $sfx = -join ((48..57)+(97..122) | Get-Random -Count 6 | ForEach-Object {[char]$_})
        $name = "Region-$sfx"
        $removed = $false
        $region = $null
        try {
            $newId = New-ZNSettingsConnectRegion -DnsServersIPAddressList @("192.168.1.1") -IPAddress "2.$(Get-Random -Minimum 1 -Maximum 254).$(Get-Random -Minimum 1 -Maximum 254).$(Get-Random -Minimum 1 -Maximum 254)" -Name $name
            $newId.Message | Should -BeNullOrEmpty
            $region = (Get-ZNSettingsConnectRegion).Items | Where-Object {$_.Name -eq $name} | Select-Object -First 1
            $region.Id | Should -Not -BeNullOrEmpty
            { Remove-ZNSettingsConnectRegion -RegionId $region.Id } | Should -Not -Throw
            $removed = $true
            (Get-ZNSettingsConnectRegion).Items | Where-Object {$_.Id -eq $region.Id} | Should -BeNullOrEmpty
        }
        finally {
            if (-not $removed -and $region -and $region.Id) { Remove-ZNSettingsConnectRegion -RegionId $region.Id -ErrorAction SilentlyContinue }
        }
    }
}
