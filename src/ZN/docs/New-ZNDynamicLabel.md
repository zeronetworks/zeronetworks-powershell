---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-zndynamiclabel
schema: 2.0.0
---

# New-ZNDynamicLabel

## SYNOPSIS
Create a new dynamic label.

## SYNTAX

```
New-ZNDynamicLabel [-AccountName <String>] [-ConditionAssetTypes <Int32[]>] [-ConditionDomains <String[]>]
 [-ConditionIPBuiltins <String[]>] [-ConditionNamePatterns <String[]>] [-ConditionOSNamePatterns <String[]>]
 [-ConditionOSTypes <Int32[]>] [-LabelKey <String>] [-LabelValue <String>] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

## DESCRIPTION
Create a new dynamic label.

## EXAMPLES

### Example 1: Create a dynamic label
```powershell
New-ZNDynamicLabel -LabelKey DBServer -LabelValue True -ConditionNamePatterns "(.*)DB(.*)"
```

```output
ConditionAssetTypes     : {}
ConditionDomains        : {}
ConditionIPBuiltins     : {}
ConditionNamePatterns   : {(.*)DB(.*)}
ConditionOSNamePatterns : {}
ConditionOSTypes        : {}
EnforcementSource       : 5
EntityCount             : 0
Id                      : 80d6837a-cc8d-4c9b-8092-1d0ea51bd3c2
LabelKey                : DBServer
LabelValue              : True
Source                  : 3
Status                  : 3
```

This cmdlet creates a dynamic label.

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

