---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znassetfilterallowedconnection
schema: 2.0.0
---

# Get-ZNAssetFilterAllowedConnection

## SYNOPSIS
Returns the filter allowed connections config for an asset.

## SYNTAX

```
Get-ZNAssetFilterAllowedConnection -AssetId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the filter allowed connections config for an asset.

## EXAMPLES

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IPaths4Mf47OAssetsActionsFilterAllowedConnectionsAssetidGetResponses200ContentApplicationJsonSchema

## NOTES

## RELATED LINKS

