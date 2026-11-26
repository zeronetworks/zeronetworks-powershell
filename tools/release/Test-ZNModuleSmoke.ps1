param([Parameter(Mandatory)][string]$ModulePath)
# Isolated smoke test (run as: pwsh -NoProfile -NonInteractive -File smoke.ps1 -ModulePath <dir>).
# Imports the module from an explicit path and runs real cmdlets through the HTTP pipeline.
# Hyak.Common is loaded when the module formats an HTTP body (GeneralUtilities.FormatString ->
# CloudException.IsXml/IsJson), so the second test sends a POST with a body under -Debug.
# Proxy is a dead local port: nothing leaves this machine, the API key is never set.
$ErrorActionPreference = 'Stop'
$env:ZNApiKey = $null
$ModulePath = (Resolve-Path $ModulePath).Path
Import-Module (Join-Path $ModulePath 'ZeroNetworks.psd1') -Force
$m = Get-Module ZeroNetworks
"Loaded ZeroNetworks $($m.Version)-$($m.PrivateData.PSData.Prerelease) from $($m.ModuleBase)"
"Exported commands: $((Get-Command -Module ZeroNetworks).Count)"
$common = @{ AccountName = 'zn-smoketest'; Proxy = 'http://127.0.0.1:9'; ErrorAction = 'Stop' }
$tests = [ordered]@{
    'Get-ZNAsset -Limit 1'                  = { Get-ZNAsset @common -Limit 1 }
    'New-ZNCustomGroup -Debug (POST body)'  = { $DebugPreference = 'Continue'; New-ZNCustomGroup @common -Name 'smoketest' -Description 'smoketest' -Debug }
}
$failed = $false
foreach ($t in $tests.GetEnumerator()) {
    try { & $t.Value *> $null; "$($t.Key): unexpected success" }
    catch {
        if ($_.Exception.ToString() -match 'Could not load file or assembly') { $failed = $true; "$($t.Key): FAIL -> $($_.Exception.Message)" }
        else { "$($t.Key): OK (reached the network, refused as expected: $($_.Exception.Message))" }
    }
}
$loaded = [AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GetName().Name -in 'Hyak.Common', 'ZeroNetworks.private' } |
    ForEach-Object { "$($_.GetName().Name) <- $($_.Location)" }
"Loaded assemblies: $(@($loaded) -join '; ')"
if (-not ($loaded -match 'Hyak.Common')) { $failed = $true; 'FAIL: Hyak.Common never loaded, so the test did not exercise the dependency' }
if ($failed) { 'SMOKE TEST FAILED'; exit 1 } else { 'SMOKE TEST PASSED' }
