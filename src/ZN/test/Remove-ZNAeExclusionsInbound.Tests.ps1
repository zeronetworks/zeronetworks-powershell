if(($null -eq $TestName) -or ($TestName -contains 'Remove-ZNAeExclusionsInbound'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Remove-ZNAeExclusionsInbound.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Remove-ZNAeExclusionsInbound' {
    It 'Delete' {
        $portsList = New-ZNPortsList -Protocol TCP -Ports "44"
        $source = Invoke-ZNEncodeEntityIP -IP 1.1.1.2
        $destination = (Get-ZNAeExclusionsInboundDestinationCandidate -Search "All segmented Clients").Items
        $aeExclusion = New-ZNAeExclusionsInbound -LocalEntityId $destination.id -LocalProcessesList @("*") -PortsList $portsList -RemoteEntityIdsList @($source.id) -Action 1
        { Remove-ZNAeExclusionsInbound -RuleId $aeExclusion.ItemId } | Should -Not -Throw
        
    }
}
