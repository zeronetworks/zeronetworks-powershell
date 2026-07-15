---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znassetot
schema: 2.0.0
---

# Get-ZNAssetOt

## SYNOPSIS
Returns the properties of an OT asset.

## SYNTAX

```
Get-ZNAssetOt -AssetId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the properties of an OT asset.

## EXAMPLES

### Example 1: Get an OT asset
```powershell
$otasset = Get-ZNAssetsOt | where {$_.Fqdn -eq "ot1777"}
Get-ZNAssetOt -AssetId $otasset.Id
```

```output
EntityAssetStatus     : 5
EntityAssetType       : 4
EntityDomain          : 
EntityFqdn            : ot1777
EntityId              : a:t:OeG7qsVV
EntityIpv4Addresses   : {230.176.229.143}
EntityIpv6Addresses   : {}
EntityName            : ot1777
EntityOperatingSystem : 
EntityProtectionState : 3
EntitySource          : 7
```

This cmdlet gets an OT asset.

## PARAMETERS

### -AccountName
this value is per customer / partner

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Read-ZNJWTtoken $env:ZNApiKey).aud.split(".")[0]
Accept pipeline input: False
Accept wildcard characters: False
```

### -AssetId
assetId to filter on

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IAssetResponse

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

