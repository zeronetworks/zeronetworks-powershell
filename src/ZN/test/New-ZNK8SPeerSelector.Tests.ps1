if(($null -eq $TestName) -or ($TestName -contains 'New-ZNK8SPeerSelector'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNK8SPeerSelector.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNK8SPeerSelector' {
    It '__AllParameterSets' {
        (New-ZNK8SPeerSelector -NamespaceSelector (New-ZNK8SSelector -MatchLabels @{ name = "znk8s" })).NamespaceSelectorMatchLabelsMap | should -Match znk8s
    }
}
