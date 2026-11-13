---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znidentitypostureusersviolation
schema: 2.0.0
---

# Get-ZNIdentityPostureUsersViolation

## SYNOPSIS
Returns a list of users with a specific posture violation.

## SYNTAX

```
Get-ZNIdentityPostureUsersViolation -PostureCheckType <String> [-AccountName <String>] [-Filters <String>]
 [-Limit <Int32>] [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>] [-WithCount]
 [<CommonParameters>]
```

## DESCRIPTION
Returns a list of users with a specific posture violation.

## EXAMPLES

### Example 1: List user violations
```powershell
(Get-ZNIdentityPostureUsersViolation -PostureCheckType PASSWORD_NEVER_EXPIRE).Items
```

```output
FoundTime        : 1769095547459
LastLogon        : 
PostureCheckType : 4
UserId           : u:a:HHzQ02eL
UserName         : bad user
UserType         : 1
ViolationState   : 1

FoundTime        : 1769095547459
LastLogon        : 1764720163473
PostureCheckType : 4
UserId           : u:a:85fqUZ9R
UserName         : Nicholas
UserType         : 2
ViolationState   : 1

FoundTime        : 1769095547459
LastLogon        : 
PostureCheckType : 4
UserId           : u:a:IevssPW3
UserName         : NicholasVPN
UserType         : 1
ViolationState   : 1
```

This cmdlet lists user violations for an Identity Security Posture Managment.

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

### -PostureCheckType
posture check type

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IUsersViolationList

## NOTES

## RELATED LINKS

