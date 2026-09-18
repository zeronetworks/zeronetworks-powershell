### Example 1: Enable filter for allowed connections
```powershell
$asset = (Search-ZNAsset -Fqdn "dc01.posh.local").AssetId
Update-ZNAssetFilterAllowedConnection -AssetId $asset -FilterAllowedConnections:$true
```

```output

```

This cmdlet enables filtering for allowed connections.

### Example 2: Disable filter for allowed connections
```powershell
$asset = (Search-ZNAsset -Fqdn "dc01.posh.local").AssetId
Update-ZNAssetFilterAllowedConnection -AssetId $asset -FilterAllowedConnections:$false
```

```output

```

This cmdlet enables filtering for allowed connections.
