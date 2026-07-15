### Example 1: List posture check excluded users candidates
```powershell
(Get-ZNSettingsPostureChecksExcludedUsersUserCandidate).Items
```

```output
AssetStatus                 : 
AssetType                   : 
BreakGlassActivated         : 
Domain                      : posh.local
Email                       : 
Guid                        : 
HasIdentityProtectionPolicy : 
HasNetworkProtectionPolicy  : 
Id                          : u:a:2wl9Once
IdentityProtectionState     : 
IsQuarantined               : 
Name                        : zero
OtLocattionInterfaceName    : 
OtLocattionName             : 
OtLocattionSwitchId         : 
ProtectionState             : 
RpcProtectionState          : 
Sid                         : S-1-5-21-2080224548-755750904-2027765315-500
UserType                    : 1

AssetStatus                 : 
AssetType                   : 
BreakGlassActivated         : 
Domain                      : posh.local
Email                       : 
Guid                        : 
HasIdentityProtectionPolicy : 
HasNetworkProtectionPolicy  : 
Id                          : u:a:47SVmKvw
IdentityProtectionState     : 
IsQuarantined               : 
Name                        : znRemoteManagement
OtLocattionInterfaceName    : 
OtLocattionName             : 
OtLocattionSwitchId         : 
ProtectionState             : 
RpcProtectionState          : 
Sid                         : S-1-5-21-2080224548-755750904-2027765315-1115
UserType                    : 3
```

This cmdlet lists posture check excluded users candidates.
