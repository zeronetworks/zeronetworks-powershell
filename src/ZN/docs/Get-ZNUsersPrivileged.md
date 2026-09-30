---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znusersprivileged
schema: 2.0.0
---

# Get-ZNUsersPrivileged

## SYNOPSIS
Returns a list of Privileged Users.

## SYNTAX

```
Get-ZNUsersPrivileged [-AccountName <String>] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>]
 [-Order <String>] [-OrderColumns <List<String>>] [-Search <String>] [-WithCount] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of Privileged Users.

## EXAMPLES

### Example 1: List privileged users
```powershell
(Get-ZNUsersPrivileged).Items
```

```output
AddedAt             : 
AddedBy             : 
ClassifiedById      : u:a:JnQxZS6j
ClassifiedByName    : nicholas-ad
CreatedAt           : 1702251607787
DistinguishedName   : CN=zero,CN=Users,DC=posh,DC=local
Domain              : posh.local
Email               : nicholas+poshprdzero@zeronetworks.com
FirstName           : 
Guid                : a1b2e06b-f114-4ca1-a577-c0d7d138f743
Id                  : u:a:jRVryncp
JobTitle            : 
LastLogonReplicated : 
LastName            : 
Name                : zero
OfficePhone         : 
Phone               : 
PrincipalName       : POSH\zero
ProtectAt           : 
ProtectedAt         : 
ProtectionState     : 1
Role                : 1
Sid                 : S-1-5-21-4035814016-3211323426-385196088-500
Source              : 3
UserPrincipleName   : 
UserType            : 7
```

This cmdlet lists privileged users.

### Example 2: Search for a privileged user
```powershell
(Get-ZNUsersPrivileged -Search zero).Items
```

```output
AddedAt             : 
AddedBy             : 
ClassifiedById      : u:a:JnQxZS6j
ClassifiedByName    : nicholas-ad
CreatedAt           : 1702251607787
DistinguishedName   : CN=zero,CN=Users,DC=posh,DC=local
Domain              : posh.local
Email               : nicholas+poshprdzero@zeronetworks.com
FirstName           : 
Guid                : a1b2e06b-f114-4ca1-a577-c0d7d138f743
Id                  : u:a:jRVryncp
JobTitle            : 
LastLogonReplicated : 
LastName            : 
Name                : zero
OfficePhone         : 
Phone               : 
PrincipalName       : POSH\zero
ProtectAt           : 
ProtectedAt         : 
ProtectionState     : 1
Role                : 1
Sid                 : S-1-5-21-4035814016-3211323426-385196088-500
Source              : 3
UserPrincipleName   : 
UserType            : 7
```

This cmdlet can serch for a privleged user.

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

### -Filters
JSON string URI encoded set of filters

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

### -Limit
Limit the return results

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -Offset
Used to page through results

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Order
What order to sort the results

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

### -OrderColumns
what column to order on

```yaml
Type: System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Search
Test to search for

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

### -WithCount
return count of objects

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: $true
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISearchUsersResponse

## NOTES

## RELATED LINKS

