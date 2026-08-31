---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znwebhookstrigger
schema: 2.0.0
---

# New-ZNSettingsWebhooksTrigger

## SYNOPSIS
Create a in-memory object for webhooks trigger

## SYNTAX

### Rules (Default)
```
New-ZNSettingsWebhooksTrigger -Rules -RulesResource <String> [-EnforcementSource <String[]>]
 [-RulesTriggerEvent <String[]>] [<CommonParameters>]
```

### MFAPolicies
```
New-ZNSettingsWebhooksTrigger -MFAPolicies -MFAPoliciesResource <String> [-EnforcementSource <String[]>]
 [-MFAPoliciesTriggerEvent <String[]>] [<CommonParameters>]
```

### RulesReview
```
New-ZNSettingsWebhooksTrigger -RulesReview -RulesReviewResource <String> [-EnforcementSource <String[]>]
 [-RulesReviewTriggerEvent <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Create a in-memory object for webhooks trigger

## EXAMPLES

### Example 1: Create trigger object for webhook
```powershell
$trigger1 = New-ZNSettingsWebhooksTrigger -Rules -RulesResource "INBOUNDIT"
$trigger2 = New-ZNSettingsWebhooksTrigger -Rules -RulesResource "OUTBOUNDIT"
```

This cmdlet creates a trigger object in Memory for webhooks.

## PARAMETERS

### -EnforcementSource
Enforcement Source

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

### -MFAPolicies
Webhook Trigger Topic

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: MFAPolicies
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MFAPoliciesResource
Webhook Trigger Topic

```yaml
Type: System.String
Parameter Sets: MFAPolicies
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MFAPoliciesTriggerEvent
Event

```yaml
Type: System.String[]
Parameter Sets: MFAPolicies
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Rules
Webhook Trigger Topic

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: Rules
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RulesResource
Resource

```yaml
Type: System.String
Parameter Sets: Rules
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RulesReview
Webhook Trigger Topic

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: RulesReview
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RulesReviewResource
Enforcement Source

```yaml
Type: System.String
Parameter Sets: RulesReview
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RulesReviewTriggerEvent
Event

```yaml
Type: System.String[]
Parameter Sets: RulesReview
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RulesTriggerEvent
Event

```yaml
Type: System.String[]
Parameter Sets: Rules
Aliases:

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.SettingsWebhookTriggerBody

## NOTES

## RELATED LINKS

