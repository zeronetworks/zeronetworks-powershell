---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znk8sdesiredrulesmarkasdesired
schema: 2.0.0
---

# Update-ZNK8SDesiredRulesMarkAsDesired

## SYNOPSIS
Marks a batch of deployed-but-not-desired rules as desired.
All requested rules must be in (is_deployed=true, is_desired=false); if any is not, the whole batch fails with 412.
For rules whose parent network policy is also deployed-but-not-desired, the policy is promoted in the same transaction.
Max 100 IDs per request.

## SYNTAX

```
Update-ZNK8SDesiredRulesMarkAsDesired -K8SClusterId <String> -RuleIds <String[]> [-AccountName <String>]
 [-PassThru] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Marks a batch of deployed-but-not-desired rules as desired.
All requested rules must be in (is_deployed=true, is_desired=false); if any is not, the whole batch fails with 412.
For rules whose parent network policy is also deployed-but-not-desired, the policy is promoted in the same transaction.
Max 100 IDs per request.

## EXAMPLES

### Example 1: Mark a rule as compliant
```powershell
Update-ZNK8SDesiredRulesMarkAsDesired -K8SClusterId k:c:j3PDZgKj -RuleIds R:k:5tzie90L
```

This cmdlet marks a K8s rule as compliant.

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

### -K8SClusterId
cluserId to filter on

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

### -PassThru
Returns true when the command succeeds

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

### -RuleIds
.

```yaml
Type: System.String[]
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

## NOTES

## RELATED LINKS

