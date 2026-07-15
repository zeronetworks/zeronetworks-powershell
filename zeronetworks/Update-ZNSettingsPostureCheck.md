---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znsettingsposturecheck
schema: 2.0.0
---

# Update-ZNSettingsPostureCheck

## SYNOPSIS
Sets a single posture check override.
If the setting matches the catalog default, the override is removed.

## SYNTAX

```
Update-ZNSettingsPostureCheck [-AccountName <String>] [-Enabled] [-ExcludedUserIdsList <String[]>]
 [-Severity <Int32>] [-Type <Int32>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Sets a single posture check override.
If the setting matches the catalog default, the override is removed.

## EXAMPLES

### Example 1: Update a posture check
```powershell
Update-ZNSettingsPostureCheck -Enabled -Severity 1 -type 1
```

```output
DefinitionCategory            : 1
DefinitionDescription         : The identity is configured to allow login without providing a password, bypassing standard authentication.
DefinitionEnabled             : True
DefinitionExcludedUserIdsList : 
DefinitionMitreTacticsList    : {Persistence, Defense Evasion}
DefinitionMitreTechniquesList : {T1098}
DefinitionRemediation         : Disable the "Password Not Required" flag on the user object and enforce a strong password policy.
DefinitionSeverity            : 1
DefinitionType                : 1
```

This cmdlet updates a posture check.

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

### -Enabled
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

### -ExcludedUserIdsList
User IDs to exclude from this specific posture check type

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

### -Severity
Violation severity:* `1` - CRITICAL* `2` - HIGH* `3` - MEDIUM* `4` - LOW

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

### -Type
* '1' - Password Not Needed* '2' - Use DES key only* '3' - Dont Require PreAuth* '4' - Password Never Expire* '5' - Unconstrained Delegation Enabled* '6' - Default Admin Account Enabled* '7' - Constrained Delegation Enabled* '8' - Identity With SPN* '9' - Service Account Domain Admin* '10' - Reversible Encryption* '11' - Non-Default Primary Group ID* '12' - Old Password* '13' - Stale Identity* '14' - Locked User* '15' - Temporary Account No Expiration* '16' - Privileged SID History* '17' - Non-Default DCSync Rights* '18' - Non-Default Generic All Rights* '19' - Non-Default Write DACL Rights* '20' - Non-Default Reset Password Rights* '21' - Orphaned Admin Count

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsPostureCheckDefinition

## NOTES

## RELATED LINKS

