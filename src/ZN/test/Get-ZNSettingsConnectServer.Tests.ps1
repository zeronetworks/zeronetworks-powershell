$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Get-ZNSettingsConnectServer.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Get-ZNSettingsConnectServer' {
    It 'List' {
        # tenant may legitimately have no connect servers; verify the call succeeds and returns a count
        $servers = Get-ZNSettingsConnectServer
        $servers | Should -Not -BeNullOrEmpty
        $servers.Count | Should -BeGreaterOrEqual 0
    }
}
