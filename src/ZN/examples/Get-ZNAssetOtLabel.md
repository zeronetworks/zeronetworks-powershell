### Example 1: List asset labels
```powershell
$asset = Search-ZNAsset -Fqdn poshotv2.posh.local
(Get-ZNAssetOTlabel -AssetId $asset.AssetId).items
```

```output
EntityCount Key Sources Value
----------- --- ------- -----
            Key {1}     New
```

This cmdlet lists asset labels.
 