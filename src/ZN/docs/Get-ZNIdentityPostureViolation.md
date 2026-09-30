---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znidentitypostureviolation
schema: 2.0.0
---

# Get-ZNIdentityPostureViolation

## SYNOPSIS
Returns a list of identity posture violations.

## SYNTAX

```
Get-ZNIdentityPostureViolation [-AccountName <String>] [-Limit <Int32>] [-Offset <Int32>] [-Order <String>]
 [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of identity posture violations.

## EXAMPLES

### Example 1: List ISPM violations
```powershell
 (Get-ZNIdentityPostureViolation).Items
 ```

```

```output
AffectedIdentitiesCount        : 6
Category                       : 1
Description                    : The identity password is set to never expire, increasing the risk of compromise due to credential reuse or leakage.
Id                             : a1b5b7b8-95cb-471f-b637-16bc87cba65a
IgnoredAffectedIdentitiesCount : 0
MitreTactics                   : {Persistence}
MitreTechniques                : {T1078}
PostureCheckType               : 4
Remediation                    : Uncheck "Password never expires" and enforce regular password rotation.
Severity                       : 2
TotalCheckedUsers              : 6

AffectedIdentitiesCount        : 1
Category                       : 4
Description                    : The default built-in Administrator account is active, providing a well-known target for attackers to exploit.
Id                             : 4da69e35-a46a-4ae7-8ef0-3b3ab53530f6
IgnoredAffectedIdentitiesCount : 1
MitreTactics                   : {Persistence, Defense Evasion}
MitreTechniques                : {T1098}
PostureCheckType               : 6
Remediation                    : Disable the built-in Administrator account and use named administrative accounts for management tasks.
Severity                       : 2
TotalCheckedUsers              : 6

AffectedIdentitiesCount        : 6
Category                       : 1
Description                    : These "stale" accounts often belong to former employees or contractors who were not properly offboarded, providing attackers with a silent way to maintain access.
Id                             : cc088be1-5118-4127-ad62-543bfa5832fa
IgnoredAffectedIdentitiesCount : 0
MitreTactics                   : {Persistence, Initial Access}
MitreTechniques                : {T1110}
PostureCheckType               : 12
Remediation                    : Force Reset: Trigger a "Password Change on Next Logon" for active users. Disable Stale Accounts: If the account has not logged in for 30+ days AND has an old password, disable it. 
                                 Verify GPO: Check if a "Fine-Grained Password Policy" or GPO is intentionally (or accidentally) allowing certain users to bypass rotation.
Severity                       : 3
TotalCheckedUsers              : 6

AffectedIdentitiesCount        : 1
Category                       : 4
Description                    : The identity has not authenticated for a long period, indicating it is likely dormant or abandoned.
Id                             : 85a3928e-dd0f-4f57-a25c-c2f65f74ff0f
IgnoredAffectedIdentitiesCount : 0
MitreTactics                   : {Persistence, Initial Access}
MitreTechniques                : {T1136, T1078.00}
PostureCheckType               : 13
Remediation                    : Disable or delete the inactive identity if it is no longer required for business operations.
Severity                       : 2
TotalCheckedUsers              : 6
```

This cmdlet lists ISPM violations.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IIdentityPostureViolationsList

## NOTES

## RELATED LINKS

