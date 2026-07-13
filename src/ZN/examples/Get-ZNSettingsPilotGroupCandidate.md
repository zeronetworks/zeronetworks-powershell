### Example 1: List pilot group candidates
```powershell
Get-ZNSettingsPilotGroupCandidate -OSType windows -Product cloud-connector
```

```output
AssetStatus              : 7
AssetType                : 1
BreakGlassActivated      : False
Domain                   : posh.local
Id                       : a:a:o8w4Bpq7
IdentityProtectionState  : 3
IsQuarantined            : 
Name                     : WC01
OtLocattionInterfaceName : 
OtLocattionName          : 
OtLocattionSwitchId      : 
ProtectionState          : 3
RpcProtectionState       : 3
```

This cmdlet lists candidates for a pilot group.
