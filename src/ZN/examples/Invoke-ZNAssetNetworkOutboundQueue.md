### Example 1: Extend outbound learning
```powershell
$asset= (Search-ZNAsset -Fqdn al01.posh.local).AssetId
Invoke-ZNAssetNetworkOutboundExtendQueue -AssetIds @($asset) -Directions 1 -ExtendByDays 14
```

```output

```

This cmdlet extends outbound learning.
