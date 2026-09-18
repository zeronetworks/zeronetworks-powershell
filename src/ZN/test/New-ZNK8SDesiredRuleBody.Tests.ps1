if(($null -eq $TestName) -or ($TestName -contains 'New-ZNK8SDesiredRuleBody'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'New-ZNK8SDesiredRuleBody.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'New-ZNK8SDesiredRuleBody' {
    It '__AllParameterSets' {
        $rule = New-ZNK8SDesiredRuleBody -Action Allow -Direction Inbound -NamespaceName "powershell" -NetworkPolicyName "testpolicy3"
        $rule.NamespaceName | Should -Be "powershell"
    }
}
