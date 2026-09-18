---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znsettingssiem
schema: 2.0.0
---

# New-ZNSettingsSiem

## SYNOPSIS
Create SIEM Configuration

## SYNTAX

```
New-ZNSettingsSiem -ReceiverType <String> [-AccountName <String>] [-AuditsEndpoint <String>]
 [-IdentityActivitiesEndpoint <String>] [-NetworkActivitiesEndpoint <String>] [-ReceiverConfigApiKey <String>]
 [-ReceiverConfigClientId <String>] [-ReceiverConfigClientSecret <String>] [-ReceiverConfigHecUri <String>]
 [-ReceiverConfigIngestionEndpoint <String>] [-ReceiverConfigTenantId <String>]
 [-ReceiverConfigToken <String>] [-ReceiverConfigUrl <String>] [-RpcActivitiesEndpoint <String>] [-Confirm]
 [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Create SIEM Configuration

## EXAMPLES

### Example 1: Add SIEM settings
```powershell
New-ZNSettingsSiem -ReceiverType microsoft-sentinel -AuditsEndpoint Custom-zeronetworksaudit_CL -ReceiverConfigClientid 3e94d6b4-d231-4753-9640-61eea420fd07 -ReceiverConfigClientSecret "mytoken" -ReceiverConfigTenantId 0b655e46-ebd4-4eed-985a-df1cad4f8b28 -ReceiverConfigUrl "https://zeronetworks-dce-5bzg.eastus-1.ingest.monitor.azure.com/dataCollectionRules/dcr-6fc4b684a9c847f4abc971b34c846655/streams"
```

```output
ConfigAuditsEndpoint             : Custom-zeronetworksaudit_CL
ConfigIdentityActivitiesEndpoint : 
ConfigNetworkActivitiesEndpoint  : 
ConfigReceiverType               : 3
ConfigRpcActivitiesEndpoint      : 
ReceiverConfigClientId           : 3e94d6b4-d231-4753-9640-61eea420fd07
ReceiverConfigHecUri             : 
ReceiverConfigTenantId           : b0860d73-8f11-4321-bf37-b707c9e3dccf
ReceiverConfigUrl                : https://zeronetworks-dce-5bzg.eastus-1.ingest.monitor.azure.com/dataCollectionRules/dcr-6fc4b684a9c847f4abc971b34c846655/streams
```

This cmdlet adds a SIEM settings.

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

### -AuditsEndpoint
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

### -IdentityActivitiesEndpoint
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

### -NetworkActivitiesEndpoint
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

### -ReceiverConfigApiKey
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

### -ReceiverConfigClientId
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

### -ReceiverConfigClientSecret
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

### -ReceiverConfigHecUri
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

### -ReceiverConfigIngestionEndpoint
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

### -ReceiverConfigTenantId
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

### -ReceiverConfigToken
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

### -ReceiverConfigUrl
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

### -ReceiverType
receiver type

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

### -RpcActivitiesEndpoint
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsEventsReceiverConfig

## NOTES

## RELATED LINKS

