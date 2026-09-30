---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-zndynamiclabel
schema: 2.0.0
---

# Get-ZNDynamicLabel

## SYNOPSIS
Returns the details of a specific dynamic label.

## SYNTAX

### List (Default)
```
Get-ZNDynamicLabel [-AccountName <String>] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>]
 [-Order <String>] [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNDynamicLabel -LabelId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the details of a specific dynamic label.

## EXAMPLES

### Example 1: List dynamic labels
```powershell
(Get-ZNDynamicLabel).items
```

```output
ConditionDomains        : {}                                                             
ConditionIPBuiltins     : {}
ConditionNamePatterns   : {.*sql.*}
ConditionOSNamePatterns : {}
ConditionOSTypes        : {}
EnforcementSource       : 5
EntityCount             : 0
Id                      : 10c1820d-4fec-4e65-a545-85e792e22897
LabelKey                : shachaf
LabelValue              : rocks
Source                  : 3
Status                  : 1
```

This cmdlet lists dynamic labels.

### Example 2: Get a dyanmic label
```powershell
Get-ZNDynamicLabel -LabelId 10c1820d-4fec-4e65-a545-85e792e22897
```

```output
ConditionAssetTypes     : {}
ConditionDomains        : {}
ConditionIPBuiltins     : {}
ConditionNamePatterns   : {.*sql.*}
ConditionOSNamePatterns : {}
ConditionOSTypes        : {}
EnforcementSource       : 5
EntityCount             : 0
Id                      : 10c1820d-4fec-4e65-a545-85e792e22897
LabelKey                : shachaf
LabelValue              : rocks
Source                  : 3
Status                  : 1
```

This cmdlet gets a dynamic label.

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

### -Filters
JSON string URI encoded set of filters

```yaml
Type: System.String
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LabelId
The label id

```yaml
Type: System.String
Parameter Sets: Get
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Limit
Limit the return results

```yaml
Type: System.Int32
Parameter Sets: List
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
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Order
What order to sort the results

```yaml
Type: System.String
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OrderColumns
what column to order on

```yaml
Type: System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WithCount
return count of objects

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: $true
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IDynamicLabelInfo

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IDynamicLabelsList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

