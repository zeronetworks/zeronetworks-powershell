---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znsettingsk8santitamperingconfig
schema: 2.0.0
---

# Get-ZNSettingsK8SAntiTamperingConfig

## SYNOPSIS
Get K8s anti-tampering audit cooldown settings

## SYNTAX

```
Get-ZNSettingsK8SAntiTamperingConfig [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Get K8s anti-tampering audit cooldown settings

## EXAMPLES

### Example 1: Get K8s antitamper config
```powershell
Get-ZNSettingsK8SAntiTamperingConfig
```

```output
AuditCooldownMinutes
--------------------
                   5
```

This cmdlet gets the k8s anti tamper config.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsK8SAntiTamperingConfig

## NOTES

## RELATED LINKS

