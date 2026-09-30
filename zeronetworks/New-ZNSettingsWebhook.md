---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znsettingswebhook
schema: 2.0.0
---

# New-ZNSettingsWebhook

## SYNOPSIS
Create Webhooks settings

## SYNTAX

```
New-ZNSettingsWebhook [-AccountName <String>] [-AuthType <Int32>] [-Description <String>] [-IsEnabled]
 [-Name <String>] [-Triggers <ISettingsWebhookTriggerBody[]>] [-Url <String>] [-ValidateCertificate]
 [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Create Webhooks settings

## EXAMPLES

### Example 1: Create webhook
```powershell
New-ZNSettingswebhook -AuthType 1 -IsEnabled:$false -Name "NewWebhook" -Url "https://someurl.com" -ValidateCertificate:$false -Triggers @($trigger1;$trigger2)
```

```output
CredentialsAuthType              : 1
SyncStatusCode                   : 0
SyncStatusErrorMessage           : 
SyncStatusErrorType              : 1
WebhookServerDescription         : 
WebhookServerId                  : e:w:9cwKddWs
WebhookServerIsEnabled           : True
WebhookServerName                : NewWebhook
WebhookServerUrl                 : https://someurl.com
WebhookServerValidateCertificate : True
WebhookTriggersList              : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.SettingsWebhookTrigger, 
                                   ZeroNetworks.PowerShell.Cmdlets.Api.Models.SettingsWebhookTrigger}
```

This cmdlet creates a webhook.

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

### -AuthType
.

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
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

### -IsEnabled
.

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

### -Name
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

### -Url
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

### -ValidateCertificate
.

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
  - `[ReactivePolicyEventConfigEventList <List<Int32>>]`: Event identifiers: 1 ANY, 2 CREATED, 3 EDITED, 4 DELETED, 5 EXPIRED, 6 APPROVED, 7 SUGGESTION_CREATED, 8 REJECTED, 9 SUGGESTION_EDITED
  - `[ReactivePolicyEventConfigResource <Int32?>]`: ReactivePolicyResource identifier: 1 REACTIVE_POLICY_INBOUND, 2 REACTIVE_POLICY_OUTBOUND, 3 REACTIVE_POLICY_IDENTITY, 4 REACTIVE_POLICY_EXTERNAL
  - `[RuleEventConfigEnforcementSourcesList <List<Int32>>]`: List of enforcement source identifiers
  - `[RuleEventConfigEventList <List<Int32>>]`: Event identifiers: 1 ANY, 2 CREATED, 3 EDITED, 4 DELETED, 5 EXPIRED, 6 APPROVED, 7 SUGGESTION_CREATED, 8 REJECTED, 9 SUGGESTION_EDITED. EXPIRED is accepted only for resources 1, 2, 5, 7, 12 and 13.
  - `[RuleEventConfigResource <Int32?>]`: RuleResource identifier: 1 INBOUND_IT, 2 OUTBOUND_IT, 3 INBOUND_MFA, 4 OUTBOUND_MFA, 5 IDENTITY, 6 IDENTITY_MFA, 7 RPC, 8 RPC_MFA, 9 EXTERNAL_MFA, 10 INBOUND_AE, 11 OUTBOUND_AE, 12 INBOUND_OT, 13 OUTBOUND_OT
  - `[RuleReviewEventConfigEnforcementSourcesList <List<Int32>>]`: List of enforcement source identifiers
  - `[RuleReviewEventConfigEventList <List<Int32>>]`: Event identifiers: 1 ANY, 3 EDITED, 4 DELETED, 5 EXPIRED, 6 APPROVED, 7 SUGGESTION_CREATED, 8 REJECTED, 9 SUGGESTION_EDITED. CREATED is not accepted for this topic.
  - `[RuleReviewEventConfigResource <Int32?>]`: RuleReviewResource identifier: 1 INBOUND, 2 OUTBOUND, 3 DELETED_INBOUND, 4 DELETED_OUTBOUND

## RELATED LINKS

