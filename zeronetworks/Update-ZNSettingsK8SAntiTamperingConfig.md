---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znsettingsk8santitamperingconfig
schema: 2.0.0
---

# Update-ZNSettingsK8SAntiTamperingConfig

## SYNOPSIS
Set K8s anti-tampering audit cooldown settings

## SYNTAX

```
Update-ZNSettingsK8SAntiTamperingConfig [-AccountName <String>] [-AuditCooldownMinutes <Int32>] [-Confirm]
 [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Set K8s anti-tampering audit cooldown settings

## EXAMPLES

### Example 1: Update k8s antitamper setting
```powershell
Update-ZNSettingsK8SAntiTamperingConfig -AuditCooldownMinutes 7
```

```output
AuditCooldownMinutes
--------------------
                   7
```

This cmdlet updates the K8s Antitamper setting.

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

### -AuditCooldownMinutes
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsK8SAntiTamperingConfig

## NOTES

## RELATED LINKS

