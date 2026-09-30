---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znassetsrpcqueued
schema: 2.0.0
---

# Get-ZNAssetsRpcQueued

## SYNOPSIS
Returns a list of assets in RPC learning.

## SYNTAX

```
Get-ZNAssetsRpcQueued [-AccountName <String>] [-Cursor <Int64>] [-Filters <String>] [-Limit <Int32>]
 [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of assets in RPC learning.

## EXAMPLES

### Example 1: List assets in RPC Learnings
```powershell
(Get-ZNAssetsRpcQueued).Items
```

```output
AddedAt                      : 
AddedById                    : 
AddedByName                  : 
AssetStatus                  : 2
AssetType                    : 2
AssignedDeploymentId         : f56dd59d-ab65-45ed-871c-b6c0742db568
AssignedDeploymentName       : ts01
BreakGlassActivated          : False
DistinguishedName            : 
Domain                       : posh.local
EnvironmentGroupId           : 
EnvironmentGroupName         : 
Fqdn                         : dc01.posh.local
Guid                         : 
HealthStateHealthIssuesList  : {}
HealthStateHealthStatus      : 1
IPV4Addresses                : {10.0.0.4}
IPV6Addresses                : {fe80::bf24:9b00:66bd:2f51}
Id                           : a:a:VWW2G2C8
IdNamePairId                 : f56dd59d-ab65-45ed-871c-b6c0742db568
IdentityProtectAt            : 
IdentityProtectedAt          : 
IdentityProtectionState      : 1
InactiveReason               : 3
InactiveSince                : 
LastLogon                    : 1716175601728
LastLogonTimestamp           : 1716175601712
Name                         : dc01
OperatingSystem              : Windows Server 2022 Datacenter
PasswordUpdateTime           : 1715359241005
PreferredDeploymentId        : 
PreferredDeploymentId1       : 
PreferredDeploymentName      : 
PrincipalName                : POSH\dc01$
ProtectAt                    : 
ProtectedAt                  : 
ProtectionState              : 10
RpcMonitored                 : True
RpcProtectAt                 : 1718895600000
RpcProtectedAt               : 
RpcProtectionState           : 5
ServicePrincipleNames        : 
Sid                          : 
Source                       : 3
StateAssetId                 : a:a:VWW2G2C8
StateIdentityProtectAt       : 
StateIdentityProtectedAt     : 
StateIdentityProtectionState : 1
StateIsAssetConnected        : True
StateLastConnectedAt         : 1716123955616
StateLastDisconnectedAt      : 
StateProtectAt               : 
StateProtectedAt             : 
StateProtectionState         : 10
StateRpcProtectAt            : 1718895600000
StateRpcProtectedAt          : 
StateRpcProtectionState      : 5
UserAccountControl           : 
```

This cmdlet lists assets in RPC learning.

### Example 2: List next page of assets in RPC learning
```powershell
(Get-ZNAssetsRpcQueued -Offset 10).Items
```

Use offset to get the next page of Assets in RPC learning.

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

### -Cursor
cursor position to start at

```yaml
Type: System.Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISearchAssetsResponse

## NOTES

## RELATED LINKS

