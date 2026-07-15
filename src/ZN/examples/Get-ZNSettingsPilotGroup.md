### Example 1: Get the pilot group settings
```powershell
(Get-ZNSettingsPilotGroup -OSType windows -Product cloud-connector).Items
```

```output
AssetId          : a:a:o8w4Bpq7
AssetStatus      : 7
AssetType        : 1
CreatedAtNanos   : 78250000
CreatedAtSeconds : 1780930854
CreatedByEmail   : 
CreatedById      : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
Id               : a:a:o8w4Bpq7
Name             : WC01
OSType           : 2
ProtectionState  : 3
Version          : {13,4,12,1}
```

This cmdlet shows the settings for the pilot group.
