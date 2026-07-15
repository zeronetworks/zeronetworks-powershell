---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znsettingsclusterpilotgroup
schema: 2.0.0
---

# Get-ZNSettingsClusterPilotGroup

## SYNOPSIS
Get the cluster currently assigned as pilot group

## SYNTAX

```
Get-ZNSettingsClusterPilotGroup -Product <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Get the cluster currently assigned as pilot group

## EXAMPLES

### Example 1: Get the cluster pilot group
```powershell
Get-ZNSettingsClusterPilotGroup -Product segment-server
```

```output
ClusterId
---------
C:d:1mkMUVtJ
```

This cmdlet show the cluster set as the pilot group.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IPaths1P6Yur6SettingsClusterPilotGroupProductGetResponses200ContentApplicationJsonSchema

## NOTES

## RELATED LINKS

