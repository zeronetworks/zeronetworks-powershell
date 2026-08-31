---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/test-znsettingswebhook
schema: 2.0.0
---

# Test-ZNSettingsWebhook

## SYNOPSIS
Test Webhook settings

## SYNTAX

### TestExpanded (Default)
```
Test-ZNSettingsWebhook [-AccountName <String>] [-AuthType <Int32>] [-Description <String>] [-IsEnabled]
 [-Name <String>] [-Url <String>] [-ValidateCertificate] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### Test1
```
Test-ZNSettingsWebhook -WebhookId <String> -Body <ISettingsWebhookTestBody> [-AccountName <String>] [-Confirm]
 [-WhatIf] [<CommonParameters>]
```

### TestExpanded1
```
Test-ZNSettingsWebhook -WebhookId <String> [-AccountName <String>] [-AuthType <Int32>] [-Description <String>]
 [-IsEnabled] [-Name <String>] [-Url <String>] [-ValidateCertificate] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

## DESCRIPTION
Test Webhook settings

## EXAMPLES

### Example 1: Test a webhook
```powershell
Test-ZNSettingsWebhook -WebhookId e:w:C0uUcJSV
```

```output
ConnectionStateErrorMessage
---------------------------                                                                                                
failed to send data to index, expectedCode: 200, actualCode: 404, body: <html><head><title>Not Found</title></head><body>4
```

This cmdlet tests a webhook and returns success or error data.

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
Parameter Sets: TestExpanded, TestExpanded1
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Body
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsWebhookTestBody
Parameter Sets: Test1
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Description
.

```yaml
Type: System.String
Parameter Sets: TestExpanded, TestExpanded1
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
Parameter Sets: TestExpanded, TestExpanded1
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
Parameter Sets: TestExpanded, TestExpanded1
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
Parameter Sets: TestExpanded, TestExpanded1
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
Parameter Sets: TestExpanded, TestExpanded1
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
Parameter Sets: Test1, TestExpanded1
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsWebhookTestBody

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsWebhookTestResponse

## NOTES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


`BODY <ISettingsWebhookTestBody>`: .
  - `AuthType <Int32>`: 
  - `IsEnabled <Boolean>`: 
  - `Name <String>`: 
  - `Url <String>`: 
  - `ValidateCertificate <Boolean>`: 
  - `[Description <String>]`: 

## RELATED LINKS

