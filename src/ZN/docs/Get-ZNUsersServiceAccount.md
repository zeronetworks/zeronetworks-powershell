---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znusersserviceaccount
schema: 2.0.0
---

# Get-ZNUsersServiceAccount

## SYNOPSIS
Returns a list of ServiceAccount Users.

## SYNTAX

```
Get-ZNUsersServiceAccount [-AccountName <String>] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>]
 [-Order <String>] [-OrderColumns <List<String>>] [-Search <String>] [-WithCount] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of ServiceAccount Users.

## EXAMPLES

### Example 1: List Service Accounts
```powershell
(Get-ZNUsersServiceAccount).Items
```

```output
ClassifiedById    : 1f352ed0-86f1-454f-90a5-592c197c8000
ClassifiedByName  : Zero Networks
CreatedAt         : 1702251607315
DistinguishedName : CN=zSvcAcct6,CN=Users,DC=posh,DC=local
Domain            : posh.local
Email             : 
FirstName         : 
Guid              : bae3a3e6-ff5a-4909-bc9b-fd4a2ae28905
Id                : u:a:lQdqKqlE
JobTitle          : 
LastLogon         : 
LastName          : 
Name              : zSvcAcct6
OfficePhone       : 
Phone             : 
PrincipalName     : POSH\zSvcAcct6
ProtectionState   : 1
Role              : 3
Sid               : S-1-5-21-4035814016-3211323426-385196088-1120
Source            : 3
UserPrincipleName : 
UserType          : 3

ClassifiedById    : 1f352ed0-86f1-454f-90a5-592c197c8000
ClassifiedByName  : Zero Networks
CreatedAt         : 1702251607945
DistinguishedName : CN=znremotemanagement,OU=ZeroNetworks,DC=posh,DC=local
Domain            : posh.local
Email             : 
FirstName         : 
Guid              : d6fdc234-0163-49a5-9466-15eece2569e4
Id                : u:a:uupJGyne
JobTitle          : 
LastLogon         : 1709211002028
LastName          : 
Name              : znremotemanagement
OfficePhone       : 
Phone             : 
PrincipalName     : POSH\znremotemanagement
ProtectionState   : 5
Role              : 3
Sid               : S-1-5-21-4035814016-3211323426-385196088-2606
Source            : 3
UserPrincipleName : 
UserType          : 3
```

This cmdlet lists service accounts.

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

