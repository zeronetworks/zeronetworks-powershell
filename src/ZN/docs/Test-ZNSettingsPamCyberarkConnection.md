---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/test-znsettingspamcyberarkconnection
schema: 2.0.0
---

# Test-ZNSettingsPamCyberarkConnection

## SYNOPSIS
Test CyberArk connection

## SYNTAX

```
Test-ZNSettingsPamCyberarkConnection [-AccountName <String>] [-Address <String>] [-CyberArkLogonType <Int32>]
 [-Password <String>] [-SecretsType <Int32>] [-UserName <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Test CyberArk connection

## EXAMPLES

### Example 1: Test PAM CyberArk settings
```powershell
$pam = Get-ZNSettingsPamCyberark
Test-ZNSettingsPamCyberarkConnection -Address $pam.Address -Password "myPassword" -UserName $pam.UserName -SecretsType $pam.SecretsType -CyberArkLogonType $pam.CyberArkLogonType
```

```output
ErrMsg     Success
------     -------
Connected     True
```

This cmdlet tests the PAM CyberArk settings.

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

### -Address
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

### -CyberArkLogonType
* 1 - CyberArk* 2 - LDAP* 3 - Radius* 4 - Windows

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

### -Password
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

### -SecretsType
* 1 - Plain* 2 - RDP File

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

### -UserName
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsCyberarkConfigTest

## NOTES

## RELATED LINKS

