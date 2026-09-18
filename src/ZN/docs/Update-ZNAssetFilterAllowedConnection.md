---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znassetfilterallowedconnection
schema: 2.0.0
---

# Update-ZNAssetFilterAllowedConnection

## SYNOPSIS
Returns an empty object.

## SYNTAX

### SetExpanded (Default)
```
Update-ZNAssetFilterAllowedConnection -AssetId <String> -FilterAllowedConnections [-AccountName <String>]
 [-Confirm] [-WhatIf] [<CommonParameters>]
```

### SetExpanded1
```
Update-ZNAssetFilterAllowedConnection -AssetIds <String[]> -FilterAllowedConnections [-AccountName <String>]
 [-Confirm] [-WhatIf] [<CommonParameters>]
```

### UpdateExpanded
```
Update-ZNAssetFilterAllowedConnection -AssetId <String> -FilterAllowedConnections [-AccountName <String>]
 [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Returns an empty object.

## EXAMPLES

### Example 1: Enable filter for allowed connections
```powershell
$asset = (Search-ZNAsset -Fqdn "dc01.posh.local").AssetId
Update-ZNAssetFilterAllowedConnection -AssetId $asset -FilterAllowedConnections:$true
```

This cmdlet enables filtering for allowed connections.

### Example 2: Disable filter for allowed connections
```powershell
$asset = (Search-ZNAsset -Fqdn "dc01.posh.local").AssetId
Update-ZNAssetFilterAllowedConnection -AssetId $asset -FilterAllowedConnections:$false
```

This cmdlet enables filtering for allowed connections.

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
Parameter Sets: SetExpanded, UpdateExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AssetIds
.

```yaml
Type: System.String[]
Parameter Sets: SetExpanded1
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterAllowedConnections
Indicates whether to enable or disable filter allowed connections

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IAny

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

