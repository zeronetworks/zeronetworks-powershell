### Example 1: Set labels for an asset
```powershell
$asset = (Search-ZNAsset -Fqdn "dc01.posh.local").AssetId
Update-ZNAssetLabel -AssetId $asset -Labels @(@{"key"="keytest"; "value"="test"}) 
```

```output

```

This cmdlet sets labels for an asset.
