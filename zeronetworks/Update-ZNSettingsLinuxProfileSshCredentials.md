---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znsettingslinuxprofilesshcredentials
schema: 2.0.0
---

# Update-ZNSettingsLinuxProfileSshCredentials

## SYNOPSIS
Update the SSH credentials of a Linux profile.
Omit the body to clear them.

## SYNTAX

```
Update-ZNSettingsLinuxProfileSshCredentials -ProfileId <String> [-AccountName <String>]
 [-SshCredentialsPassword <String>] [-SshCredentialsPrivateKey <String>] [-SshCredentialsUsername <String>]
 [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Update the SSH credentials of a Linux profile.
Omit the body to clear them.

## EXAMPLES

### Example 1: Update a linux profile SSH creds
```powershell
Update-ZNSettingsLinuxProfileSshCredentials -ProfileId l:c:LmOwDgds -SshCredentialsPassword "newpassword" -SshCredentialsPrivateKey "-----BEGIN OPENSSH PRIVATE KEY-----b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAaAAAABNlY2RzYS1zaGEyLW5pc3RwMjU2AAAACG5pc3RwMjU2AAAAQQQbIasl5Gh2GNPIIowEPyJAzZIjgbBZ2uDggWyZI5qnIeWLFa3OjG9bG2CmmGWcVMwkG96Xr9das+bG8/SK5mJQAAAAuAFsZmYBbGZmAAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBshqyXkaHYY08gijAQ/IkDNkiOBsFna4OCBbJkjmqch5YsVrc6Mb1sbYKaYZZxUzCQb3pev11qz5sbz9IrmYlAAAAAhAMYeVSy3xRUDxfhRxbXeuc4SxDKt5teAnnwaNwuCTmP8AAAAGW5pY2hvbGFzQFNlY0plZGlBaXIubG9jYWwBAgMEBQY=-----END OPENSSH PRIVATE KEY-----" -SshCredentialsUsername "zn-admin"
```

This cmdlet updates a linux profile SSH credentials.

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

### -ProfileId
The Linux profile id

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

### -SshCredentialsPassword
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

### -SshCredentialsPrivateKey
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

### -SshCredentialsUsername
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

