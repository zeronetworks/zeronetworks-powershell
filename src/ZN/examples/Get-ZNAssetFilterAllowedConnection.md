### Example 1: Get allowed connection filter for an asset
```powershell
$assetid = (Search-ZNAsset -Fqdn dc01.posh.local).AssetId
Get-ZNAssetFilterAllowedConnection -AssetId $assetID
```

```output
FilterAllowedConnections
------------------------
                   False
```

This cmdlet gets the allowed connection filter status for an asset.
