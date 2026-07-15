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
 [-Name <String>] [-Triggers <ISettingsWebhookTriggersBody[]>] [-Url <String>] [-ValidateCertificate]
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
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsWebhookTriggersBody[]
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


`TRIGGERS <ISettingsWebhookTriggersBody[]>`: .
  - `Triggers <List<ISettingsWebhookTriggersBodyTriggersItem>>`: 
    - `RuleEventConfigEnforcementSourcesList <List<Int32>>`: 
    - `RuleEventConfigEventList <List<Int32>>`: 
    - `RuleEventConfigResource <Int32>`: 
    - `Topic <Int32>`: 

## RELATED LINKS

