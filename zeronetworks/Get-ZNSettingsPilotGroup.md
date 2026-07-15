---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znsettingspilotgroup
schema: 2.0.0
---

# Get-ZNSettingsPilotGroup

## SYNOPSIS
Get all pilot group assets

## SYNTAX

```
Get-ZNSettingsPilotGroup -OSType <String> -Product <String> [-AccountName <String>] [-Limit <Int32>]
 [-Offset <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Get all pilot group assets

## EXAMPLES

### Example 1: Get the pilot group settings
```powershell
(Get-ZNSettingsPilotGroup -OSType windows -Product cloud-connector).Items
```

```output
AssetId          : a:a:o8w4Bpq7
AssetStatus      : 7
AssetType        : 1
CreatedAtNanos   : 78250000
CreatedAtSeconds : 1780930854
CreatedByEmail   : 
CreatedById      : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
Id               : a:a:o8w4Bpq7
Name             : WC01
OSType           : 2
ProtectionState  : 3
Version          : {13,4,12,1}
```

This cmdlet shows the settings for the pilot group.

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

### -Limit
Limit the return results

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -Offset
Used to page through results

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -OSType
OS type for pilot group

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

### -Product
Product type for which to modify or fetch the version maintenance window

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IPilotGroupAssetList

## NOTES

## RELATED LINKS

