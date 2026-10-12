### Example 1: Enable outbound learning
```powershell
$asset= (Search-ZNAsset -Fqdn al01.posh.local).AssetId
Invoke-ZNAssetNetworkOutboundQueue -AssetIds @($asset) -Directions 1 -QueueDays 14
```

```output

```

This cmdlet enables outbound learning.
