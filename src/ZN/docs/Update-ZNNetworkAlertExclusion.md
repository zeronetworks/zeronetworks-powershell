---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znnetworkalertexclusion
schema: 2.0.0
---

# Update-ZNNetworkAlertExclusion

## SYNOPSIS
Replaces the exclusion fields.
When applyToExistingAlerts is true, every open alert the edited exclusion fully covers is closed with closure reason Excluded.
No alert is reopened.

## SYNTAX

```
Update-ZNNetworkAlertExclusion -ExclusionId <String> -UserAlertClassification <Object> [-AccountName <String>]
 [-AlertTypeId <String>] [-ApplyToExistingAlerts] [-ChangeTicket <String>] [-Comment <String>]
 [-InvolvedEntityIds <String[]>] [-InvolvedEntityType <Object>] [-MainEntityIds <String[]>] [-AsJob] [-NoWait]
 [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Replaces the exclusion fields.
When applyToExistingAlerts is true, every open alert the edited exclusion fully covers is closed with closure reason Excluded.
No alert is reopened.

## EXAMPLES

### Example 1: Update exclusion
```powershell
$exclusion =  Get-ZNNetworkAlertExclusion -ExclusionId n:x:It35U35w
Update-ZNNetworkAlertExclusion -ExclusionId $exclusion.Id -UserAlertClassification $exclusion.UserAlertClassification -Comment "New Comment"
```

```output
AlertTypeCategory                : 
AlertTypeDescription             : 
AlertTypeName                    :                    
AlertTypeReferencesList          : 
ClosedAlertsCount                : 0
CreatedAtNanos                   : 305624000
CreatedAtSeconds                 : 1794331812
CreatedById                      : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName                    : Zero Networks
ExclusionAlertTypeId             : 
ExclusionChangeTicket            : 
ExclusionComment                 : New Comment
ExclusionId                      : n:x:It35U35w
ExclusionInvolvedEntities        : {c:\test.exe}
ExclusionInvolvedEntityType      : 3
ExclusionMainEntities            : {}
ExclusionUserAlertClassification : 12
NetworkAlertTypeId               : 
UpdatedAtNanos                   : 816264000
UpdatedAtSeconds                 : 1794342192
UpdatedById                      : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
UpdatedByName                    : powershell-module-development
```

This cmdlet updates a network alert exclusion.

## PARAMETERS

### -AccountName
Account Name

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
Also close every open alert the edited exclusion fully covers, with closure reason Excluded.
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

### -AsJob
Run the command as a job

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
Change ticket.

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

### -ExclusionId
The id of the network alert exclusion

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
The involved entity type.
Accepts 'asset' or 'process', or the integer value returned by Get-ZNNetworkAlertExclusion (converted automatically; only Asset(1) and Process(3) have a string equivalent).

```yaml
Type: System.Object
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

### -NoWait
Run the command asynchronously

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

### -UserAlertClassification
The user alert classification.
Accepts the string value, or the integer value returned by Get-ZNNetworkAlertExclusion (converted automatically).

```yaml
Type: System.Object
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.NetworkAlertExclusionCreateResult

## NOTES

## RELATED LINKS

