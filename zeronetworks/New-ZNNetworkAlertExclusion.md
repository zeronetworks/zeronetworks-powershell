---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znnetworkalertexclusion
schema: 2.0.0
---

# New-ZNNetworkAlertExclusion

## SYNOPSIS
Create an exclusion.
When sourceAlertId is set, that alert is closed with closure reason Excluded.
When applyToExistingAlerts is true, every open alert the exclusion fully covers is closed the same way.

## SYNTAX

```
New-ZNNetworkAlertExclusion -UserAlertClassification <String> [-AccountName <String>] [-AlertTypeId <String>]
 [-ApplyToExistingAlerts] [-ChangeTicket <String>] [-Comment <String>] [-InvolvedEntityIds <String[]>]
 [-InvolvedEntityType <String>] [-MainEntityIds <String[]>] [-SourceAlertId <String>] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

## DESCRIPTION
Create an exclusion.
When sourceAlertId is set, that alert is closed with closure reason Excluded.
When applyToExistingAlerts is true, every open alert the exclusion fully covers is closed the same way.

## EXAMPLES

### Example 1: Create an alert exclusion
```powershell
New-ZNNetworkAlertExclusion -UserAlertClassification not_malicious -InvolvedEntityIds @("C:\test2.exe") -Comment "test api" -InvolvedEntityType process
```

```output
AlertTypeCategory                : 
AlertTypeDescription             : 
AlertTypeName                    : 
AlertTypeReferencesList          : 
ClosedAlertsCount                : 0
CreatedAtNanos                   : 89920000
CreatedAtSeconds                 : 1794336734
CreatedById                      : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
CreatedByName                    : powershell-module-development
ExclusionAlertTypeId             : 
ExclusionChangeTicket            : 
ExclusionComment                 : test api
ExclusionId                      : n:x:n9dUgoob
ExclusionInvolvedEntities        : {c:\test2.exe}
ExclusionInvolvedEntityType      : 3
ExclusionMainEntities            : {}
ExclusionUserAlertClassification : 12
NetworkAlertTypeId               : 
UpdatedAtNanos                   : 89920000
UpdatedAtSeconds                 : 1794336734
UpdatedById                      : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
UpdatedByName                    : powershell-module-development
```

This cmdlet creates an alert exclusion.

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

### -AlertTypeId
Empty string means any alert.

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

### -ApplyToExistingAlerts
Also close every open alert the exclusion fully covers, with closure reason Excluded.
Partially covered alerts stay open.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ChangeTicket
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

### -Comment
Required when userAlertClassification is true_positive_other, informational_other or false_positive_other.

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

### -InvolvedEntityIds
Asset and group ids, or process full paths and patterns with a leading or trailing wildcard.
Empty means every involved entity.

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

### -InvolvedEntityType
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

### -MainEntityIds
Asset and group ids.
Empty means every asset.

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

### -SourceAlertId
The alert the exclusion is created from.
It is closed with closure reason Excluded.

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

### -UserAlertClassification
.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.INetworkAlertExclusionCreateResult

## NOTES

## RELATED LINKS

