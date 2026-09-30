---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znassetsnetworksegmented
schema: 2.0.0
---

# Get-ZNAssetsNetworkSegmented

## SYNOPSIS
Returns a list of Protected assets.

## SYNTAX

```
Get-ZNAssetsNetworkSegmented [-AccountName <String>] [-Cursor <Int64>] [-Filters <String>] [-Limit <Int32>]
 [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of Protected assets.

## EXAMPLES

### Example 1: List Segmented Assets
```powershell
(Get-ZNAssetsNetworkSegmented).Items
```

```output
AddedAt                      : 
AddedById                    : 
AddedByName                  : 
AssetStatus                  : 5
AssetType                    : 15
AssignedDeploymentId         : 
AssignedDeploymentName       : 
BreakGlassActivated          : False
DistinguishedName            : 
Domain                       : 
EnvironmentGroupId           : 
EnvironmentGroupName         : 
Fqdn                         : switch01
Guid                         : 
HealthStateHealthIssuesList  : {}
HealthStateHealthStatus      : 4
IPV4Addresses                : {10.0.0.250}
IPV6Addresses                : {}
Id                           : a:t:HQ4WQBZo
IdNamePairId                 : 
IdentityProtectAt            : 
IdentityProtectedAt          : 
IdentityProtectionState      : 1
InactiveReason               : 3
InactiveSince                : 
LastLogonReplicated          : 
Name                         : switch01
OperatingSystem              : 
PasswordUpdateTime           : 
PreferredDeploymentId        : 
PreferredDeploymentId1       : 
PreferredDeploymentName      : 
PrincipalName                : 
ProtectAt                    : 
ProtectedAt                  : 1702315984418
ProtectionState              : 3
RpcMonitored                 : False
RpcProtectAt                 : 
RpcProtectedAt               : 
RpcProtectionState           : 1
ServicePrincipleNames        : 
Sid                          : 
Source                       : 7
StateAssetId                 : 
StateIdentityProtectAt       : 
StateIdentityProtectedAt     : 
StateIdentityProtectionState : 
StateIsAssetConnected        : 
StateLastConnectedAt         : 
StateLastDisconnectedAt      : 
StateProtectAt               : 
StateProtectedAt             : 
StateProtectionState         : 
StateRpcProtectAt            : 
StateRpcProtectedAt          : 
StateRpcProtectionState      : 
UserAccountControl           : 

AddedAt                      : 
AddedById                    : 
AddedByName                  : 
AssetStatus                  : 2
AssetType                    : 2
AssignedDeploymentId         : 0c4a5747-19de-4961-b4b6-6cf5ecfb36b5
AssignedDeploymentName       : ts01
BreakGlassActivated          : False
DistinguishedName            : 
Domain                       : posh.local
EnvironmentGroupId           : 
EnvironmentGroupName         : 
Fqdn                         : ts01.posh.local
Guid                         : 
HealthStateHealthIssuesList  : {}
HealthStateHealthStatus      : 1
IPV4Addresses                : {10.0.0.5}
IPV6Addresses                : {}
Id                           : a:a:cPpim9Xb
IdNamePairId                 : 0c4a5747-19de-4961-b4b6-6cf5ecfb36b5
IdentityProtectAt            : 
IdentityProtectedAt          : 1702316224793
IdentityProtectionState      : 3
InactiveReason               : 3
InactiveSince                : 
LastLogonReplicated          : 
Name                         : ts01
OperatingSystem              : Windows Server 2022 Datacenter
PasswordUpdateTime           : 1728520682343
PreferredDeploymentId        : 
PreferredDeploymentId1       : 
PreferredDeploymentName      : 
PrincipalName                : POSH\TS01$
ProtectAt                    : 
ProtectedAt                  : 1728500988174
ProtectionState              : 3
RpcMonitored                 : True
RpcProtectAt                 : 
RpcProtectedAt               : 
RpcProtectionState           : 1
ServicePrincipleNames        : 
Sid                          : 
Source                       : 3
StateAssetId                 : a:a:cPpim9Xb
StateIdentityProtectAt       : 
StateIdentityProtectedAt     : 1702316224793
StateIdentityProtectionState : 3
StateIsAssetConnected        : True
StateLastConnectedAt         : 1729607235810
StateLastDisconnectedAt      : 
StateProtectAt               : 
StateProtectedAt             : 1728500988174
StateProtectionState         : 3
StateRpcProtectAt            : 
StateRpcProtectedAt          : 
StateRpcProtectionState      : 1
UserAccountControl           :
```

This cmdlet lists network segmented assets.

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

