$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Update-ZNSettingsConnectServer.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Update-ZNSettingsConnectServer' {
    It 'UpdateExpanded' {
        $connectServer = (Get-ZNSettingsConnectServer).Items | Select -First 1
        $origPort = $connectServer.Port
        Update-ZNSettingsConnectServer -ConnectServerId $connectServer.Id -PublicPort 12345 -Subnet $connectServer.SubnetName
        $UpdatedconnectServer = (Get-ZNSettingsConnectServer).Items | Select -First 1
        $updatedConnectServer.Port | Should -Be 12345
        Update-ZNSettingsConnectServer -ConnectServerId $connectServer.Id -PublicPort $origPort -Subnet $connectServer.SubnetName
    }
}
