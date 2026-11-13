---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znnetworkalertexclusion
schema: 2.0.0
---

# Get-ZNNetworkAlertExclusion

## SYNOPSIS
Returns a single network alert exclusion.

## SYNTAX

### List (Default)
```
Get-ZNNetworkAlertExclusion [-AccountName <String>] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>]
 [-Order <String>] [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNNetworkAlertExclusion -ExclusionId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a single network alert exclusion.

## EXAMPLES

### Example 1: List alert exclusions
```powershell
(Get-ZNNetworkAlertExclusion).Items 
```

```output
AlertTypeCategory       : 
AlertTypeDescription    : 
AlertTypeId             : 
AlertTypeName           : 
AlertTypeReferencesList : 
ChangeTicket            : 
Comment                 : 
CreatedAtNanos          : 305624000
CreatedAtSeconds        : 1794331812
CreatedById             : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName           : Zero Networks
Id                      : n:x:It35U35w
InvolvedEntities        : {c:\test.exe}
InvolvedEntityType      : 3
MainEntities            : {}
NetworkAlertTypeId      : 
UpdatedAtNanos          : 305624000
UpdatedAtSeconds        : 1794331812
UpdatedById             : 1f352ed0-86f1-454f-90a5-592c197c8000
UpdatedByName           : Zero Networks
UserAlertClassification : 12
```

This cmdlet lists network alert exclusions.

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

### -ExclusionId
The id of the network alert exclusion

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
Type: System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.INetworkAlertExclusion

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.INetworkAlertExclusionsList

## NOTES

## RELATED LINKS

