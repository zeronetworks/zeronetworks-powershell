if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNAeExclusionsOutbound'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNAeExclusionsOutbound.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNAeExclusionsOutbound' {
    It 'Delete' {
        $portsList = New-ZNPortsList -Protocol TCP -Ports "44"
        $destination = Invoke-ZNEncodeEntityIP -IP 1.1.1.2
        $source = (Get-ZNAeExclusionsOutboundSourceCandidate -Search "All segmented Clients").Items
        $aeExclusion = New-ZNAeExclusionsOutbound -LocalEntityId $source.id -LocalProcessesList @("*") -PortsList $portsList -RemoteEntityIdsList @($destination.id) -Action 1
        { Remove-ZNAeExclusionsOutbound -RuleId $aeExclusion.ItemId } | Should -Not -Throw
    }
}
