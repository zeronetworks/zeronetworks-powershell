### Example 1: List asset labels
```powershell
$asset = Search-ZNAsset -Fqdn dc01.posh.local
(Get-ZNAssetlabel -AssetId $asset.AssetId).item
```

```output
EntityCount Key Sources Value
----------- --- ------- -----
            Key {1}     New
```

This cmdlet lists asset labels.
