---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znsettingswebhookstrigger
schema: 2.0.0
---

# Update-ZNSettingsWebhooksTrigger

## SYNOPSIS
Update Webhooks triggers settings

## SYNTAX

```
Update-ZNSettingsWebhooksTrigger -WebhookId <String> [-AccountName <String>]
 [-Triggers <ISettingsWebhookTriggerBody[]>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Update Webhooks triggers settings

## EXAMPLES

### Example 1: Update webhook trigger
```powershell
$webhook = Get-ZNSettingsWebhook | where {$_.Id -eq "e:w:C0uUcJSV"}
$newtrigger = New-ZNSettingsWebhooksTrigger -Rules -RulesResource "OUTBOUNDIT"
$webhook.Triggers.Add($newtrigger) 
Update-ZNSettingsWebhooksTrigger -WebhookId $webhook.id -Triggers $webhook.Triggers
```

This cmdlet updates triggers for a webhook.

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

### -Triggers
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsWebhookTriggerBody[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WebhookId
webhookId to filter on

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsWebhookItem

## NOTES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


`TRIGGERS <ISettingsWebhookTriggerBody[]>`: .
  - `Topic <Int32>`: 
  - `[ReactivePolicyEventConfigEnforcementSourcesList <List<Int32>>]`: List of enforcement source identifiers
  - `[ReactivePolicyEventConfigEventList <List<Int32>>]`: List of event type identifiers
  - `[ReactivePolicyEventConfigResource <Int32?>]`: Resource type identifier
  - `[RuleEventConfigEnforcementSourcesList <List<Int32>>]`: List of enforcement source identifiers
  - `[RuleEventConfigEventList <List<Int32>>]`: List of event type identifiers
  - `[RuleEventConfigResource <Int32?>]`: Resource type identifier
  - `[RuleReviewEventConfigEnforcementSourcesList <List<Int32>>]`: List of enforcement source identifiers
  - `[RuleReviewEventConfigEventList <List<Int32>>]`: List of event type identifiers
  - `[RuleReviewEventConfigResource <Int32?>]`: Resource type identifier

## RELATED LINKS

