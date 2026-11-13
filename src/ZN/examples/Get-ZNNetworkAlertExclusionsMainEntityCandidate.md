### Example 1: List main entity exclusion candidates
```powershell
(Get-Get-ZNNetworkAlertExclusionsMainEntityCandidate).Items
```

```output
AssetStatus                  : 1
AssetType                    : 0
BreakGlassActivated          : False
ConditionAssetTypes          : 
ConditionDomains             : 
ConditionIPBuiltins          : 
ConditionLabelConditionsList : 
ConditionNamePatterns        : 
ConditionOSNamePatterns      : 
ConditionOSTypes             : 
Domain                       : 
Email                        : 
Guid                         : 
HasIdentityProtectionPolicy  : 
HasNetworkProtectionPolicy   : 
Id                           : a:l:mATpjRhv
IdentityProtectionState      : 1
IsQuarantined                : 
Name                         : aalinux02.server.com
OtLocattionInterfaceName     : 
OtLocattionName              : 
OtLocattionSwitchId          : 
ProtectionState              : 1
RpcProtectionState           : 1
Sid                          : 
UserType                     : 
```

This cmdlet lists main entities that can be ecluded in network alerts.
