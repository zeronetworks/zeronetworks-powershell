### Example 1: Configure outbound restrictions
```powershell
$assetid = (Search-ZNAsset -Fqdn dc01.posh.local).AssetId
Update-ZNAssetsOutboundRestriction -AssetIds ($assetid) -OutboundRestriction 1 
```

```output

```

This cmdlet configures outbound restrictions for assets. 1 - NO_RESTRICTION, 2 - RESTRICTED_INTERNAL, 3 - RESTRICTED_EXTERNAL, 4 - RESTRICTED_INTERNAL_EXTERNAL
