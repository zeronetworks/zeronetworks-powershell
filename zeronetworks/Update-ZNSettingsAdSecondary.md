---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znsettingsadsecondary
schema: 2.0.0
---

# Update-ZNSettingsAdSecondary

## SYNOPSIS
Update a secondary AD settings in Asset Management

## SYNTAX

```
Update-ZNSettingsAdSecondary -DomainId <String> -ForestId <String> [-AccountName <String>]
 [-SecondaryDomainConfigAssetsClusterId <String>] [-SecondaryDomainConfigDomainControllerFqdn <String>]
 [-SecondaryDomainConfigDomainName <String>] [-SecondaryDomainConfigSyncingClusterId <String>] [-Confirm]
 [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Update a secondary AD settings in Asset Management

## EXAMPLES

### Example 1: Update a secondary domain
```powershell
$forest = Get-ZNSettingsAd | where {$_.ActiveDirectoryInfoDomainName -eq "test.local"}
Update-ZNSettingsAdSecondary -forest $forest.ForestId -DomainId child.test.local -Dc newdc.child.test.local
```

This cmdlet updates the settings for a Secondary domain in AD settings.

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

### -DomainId
The fqdn of the domain

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

### -ForestId
The forest id

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

### -SecondaryDomainConfigAssetsClusterId
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

### -SecondaryDomainConfigDomainControllerFqdn
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

### -SecondaryDomainConfigDomainName
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

### -SecondaryDomainConfigSyncingClusterId
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IAny

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

