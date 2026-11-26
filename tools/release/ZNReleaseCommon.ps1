# Shared helpers for the tools/release/*.ps1 scripts. Dot-source, don't run directly.

$script:RepoRoot   = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
$script:ModuleRoot = Join-Path $script:RepoRoot 'src/ZN'
$script:ReleaseRoot = Join-Path $script:RepoRoot 'release'

# Files/folders that make up the shipped module, relative to src/ZN.
# This mirrors the layout of 0.26.90-preview (the last known-good package, built by
# tools/Zip-Module.ps1). Do NOT derive this from ZeroNetworks.nuspec: the nuspec only lists
# bin/ZeroNetworks.private.dll + deps.json and omits the dependency DLLs (Hyak.Common,
# Newtonsoft.Json, ...), which is exactly what broke 0.26.100-preview.
$script:ReleaseItems = @(
    'ZeroNetworks.format.ps1xml'
    'ZeroNetworks.psd1'
    'ZeroNetworks.psm1'
    'bin'                                   # whole folder: private dll + ALL dependency dlls
    'custom'
    'exports/ProxyCmdletDefinitions.ps1'
    'internal/ProxyCmdletDefinitions.ps1'
    'internal/ZeroNetworks.internal.psm1'
    'utils'
)

# Never ship these even if they're sitting in an included folder.
$script:ReleaseExcludePatterns = @('*.cs', 'README.md', '.DS_Store')

function Get-ZNManifestVersion {
    param([string]$ManifestPath = (Join-Path $script:ModuleRoot 'ZeroNetworks.psd1'))
    $data = Import-PowerShellDataFile -Path $ManifestPath
    $v = $data.ModuleVersion
    $pre = $data.PrivateData.PSData.Prerelease
    if ($pre) { "$v-$pre" } else { "$v" }
}

# Throws unless every runtime assembly listed in bin/ZeroNetworks.private.deps.json is present
# next to it. This is the guard against shipping a bin/ with only ZeroNetworks.private.dll.
function Assert-ZNBinComplete {
    param([Parameter(Mandatory)][string]$ModulePath)

    $bin = Join-Path $ModulePath 'bin'
    $deps = Join-Path $bin 'ZeroNetworks.private.deps.json'
    foreach ($f in @((Join-Path $bin 'ZeroNetworks.private.dll'), $deps)) {
        if (-not (Test-Path $f)) { throw "Missing $f" }
    }

    $json = Get-Content $deps -Raw | ConvertFrom-Json
    $required = [System.Collections.Generic.SortedSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($target in $json.targets.PSObject.Properties) {
        foreach ($lib in $target.Value.PSObject.Properties) {
            if ($lib.Value.runtime) {
                foreach ($r in $lib.Value.runtime.PSObject.Properties) { [void]$required.Add((Split-Path $r.Name -Leaf)) }
            }
        }
    }
    # Belt and braces: the assemblies whose absence broke 0.26.100-preview (case #7809).
    foreach ($n in 'Hyak.Common.dll', 'Newtonsoft.Json.dll', 'Microsoft.CSharp.dll',
                   'System.Threading.dll', 'System.Management.Automation.dll') { [void]$required.Add($n) }

    $missing = @($required | Where-Object { -not (Test-Path (Join-Path $bin $_)) })
    if ($missing.Count) {
        throw "bin/ is incomplete under $ModulePath - missing: $($missing -join ', '). " +
              "Rebuild (tools/BuildModuleWithAutorest.sh) and re-stage; do NOT release this."
    }
    Write-Host "bin/ check OK ($($required.Count) runtime assemblies present: $($required -join ', '))" -ForegroundColor Green
}
