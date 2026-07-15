---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znsettingspushnotification
schema: 2.0.0
---

# New-ZNSettingsPushNotification

## SYNOPSIS
Create an push notifications settings

## SYNTAX

### CreateExpanded (Default)
```
New-ZNSettingsPushNotification -PushIdentityProviderId <String> [-AccountName <String>]
 [-ExtraConfigUnpairedAction <Int32>] [-Host <String>] [-Id <String>] [-IdentityProvider <String>]
 [-SecretKey <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### CreateDuo
```
New-ZNSettingsPushNotification -PushIdentityProviderId <String> -ApiHostname <String> -IntegrationKey <String>
 -SecretKey <String> [-AccountName <String>] [<CommonParameters>]
```

### CreateMSFT
```
New-ZNSettingsPushNotification -PushIdentityProviderId <String> -SecretKey <String> -TenantId <String>
 [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Create an push notifications settings

## EXAMPLES

### Example 1: Configure Microsoft Authenticator Push notifications
```powershell
New-ZNSettingsPushNotification -PushIdentityProviderId microsoftAuthenticator -SecretKey "mySecretKey" -TenantId "myTenantId"   
```

This cmdlet creates a Microsoft Authenticator push notifications settings.

### Example 2: Configure Duo Push notifications
```powershell
New-ZNSettingsPushNotification -PushIdentityProviderId duo -SecretKey "mySecretKey" -ApiHostname "api-12345.duosecurity.com"  -IntegrationKey "myIntegrationKey"
```

This cmdlet creates a Duo push notifications settings.

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

### -ApiHostname
Api Hostname

```yaml
Type: System.String
Parameter Sets: CreateDuo
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExtraConfigUnpairedAction
Silverfort unpaired action(1) default behavior(2) allow(3) deny

```yaml
Type: System.Int32
Parameter Sets: CreateExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Host
empty for Microsoft Authenticator

```yaml
Type: System.String
Parameter Sets: CreateExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
.

```yaml
Type: System.String
Parameter Sets: CreateExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IdentityProvider
.

```yaml
Type: System.String
Parameter Sets: CreateExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IntegrationKey
Integration Key

```yaml
Type: System.String
Parameter Sets: CreateDuo
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PushIdentityProviderId
Push Identity provider Id

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

### -SecretKey
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

### -TenantId
TenantId

```yaml
Type: System.String
Parameter Sets: CreateMSFT
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.Any

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsPushNotifications

## NOTES

## RELATED LINKS

