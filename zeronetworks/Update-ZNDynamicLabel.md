---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/update-zndynamiclabel
schema: 2.0.0
---

# Update-ZNDynamicLabel

## SYNOPSIS
Update the details of a specific dynamic label.

## SYNTAX

```
Update-ZNDynamicLabel -LabelId <String> [-AccountName <String>] [-ConditionAssetTypes <Int32[]>]
 [-ConditionDomains <String[]>] [-ConditionIPBuiltins <String[]>] [-ConditionNamePatterns <String[]>]
 [-ConditionOSNamePatterns <String[]>] [-ConditionOSTypes <Int32[]>] [-LabelKey <String>]
 [-LabelValue <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Update the details of a specific dynamic label.

## EXAMPLES

### Example 1: Update a dynamic label
```powershell
Update-ZNDynamicLabel -LabelId $label.Id -ConditionNamePatterns $label.ConditionNamePatterns -ConditionOSTypes 2 -LabelKey $label.LabelKey -LabelValue $label.LabelValue
```

```output
ConditionAssetTypes     : {}
ConditionDomains        : {}
ConditionIPBuiltins     : {}
ConditionNamePatterns   : {(.*)DB2(.*)}
ConditionOSNamePatterns : {}
ConditionOSTypes        : {2}
EnforcementSource       : 5
EntityCount             : 0
Id                      : 80d6837a-cc8d-4c9b-8092-1d0ea51bd3c2
LabelKey                : DBServer
LabelValue              : True
Source                  : 3
Status                  : 3
```

This cmdlet updates a dynamic label.

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

### -ConditionAssetTypes
.

```yaml
Type: System.Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConditionDomains
.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConditionIPBuiltins
.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConditionNamePatterns
.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConditionOSNamePatterns
.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConditionOSTypes
.

```yaml
Type: System.Int32[]
Parameter Sets: (All)
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
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LabelKey
.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LabelValue
.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IDynamicLabelInfo

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

