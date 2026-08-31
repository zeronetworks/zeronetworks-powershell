$loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
if (-Not (Test-Path -Path $loadEnvPath)) {
    $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
}
. ($loadEnvPath)
$TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNTagGroupsMember.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Remove-ZNTagGroupsMember' {
    It 'Delete' {
        $member= (Search-ZNAsset -Fqdn ml01.posh.local).AssetId
        $group = (Get-ZNGroup -Search "Externally Facing ServerS").Items
        Add-ZNTagGroupsMember -GroupId $group.id -MembersId @($member)
        { Remove-ZNTagGroupsMember -GroupId $group.id -MembersId @($member) } | Should -Not -Throw
    }
}
