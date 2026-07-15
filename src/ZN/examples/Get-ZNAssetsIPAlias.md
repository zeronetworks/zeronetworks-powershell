### Example 1: List IP aliases
```powershell
(Get-ZNAssetsIPAlias).Items
```

```output
Alias             : NewIpAlias
CreatedAt         : 1765466672902
CreatedById       : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
CreatedByName     : powershell-module-development
EnforcementSource : 5
IP                : 1.1.1.26
Id                : e:i:ZocZFJ6s
UpdatedAt         : 
UpdatedById       : 
UpdatedByName     : 

Alias             : NewIPAlias
CreatedAt         : 1765464092001
CreatedById       : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName     : Zero Networks
EnforcementSource : 5
IP                : 1.1.1.10
Id                : e:i:TgXxpb4l
UpdatedAt         : 
UpdatedById       : 
UpdatedByName     : 

Alias             : NewName
CreatedAt         : 1765990389293
CreatedById       : m:3929d40ebf7ecfe8dbce815b1c97ea93c2b2aa59
CreatedByName     : poshtesting
EnforcementSource : 5
IP                : 2.2.2.4
Id                : e:i:69k7DDLZ
UpdatedAt         : 1780415616690
UpdatedById       : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
UpdatedByName     : powershell-module-development
```

This cmdlet lists IP aliases.

### Example 2: Get an IP Alias
```powershell
Get-ZNAssetsIPAlias -IPAliasId e:i:69k7DDLZ
```

```output
CreatedById           : m:3929d40ebf7ecfe8dbce815b1c97ea93c2b2aa59
CreatedByName         : poshtesting
ItemAlias             : NewName
ItemCreatedAt         : 1765990389293
ItemEnforcementSource : 5
ItemIP                : 2.2.2.4
ItemId                : e:i:69k7DDLZ
ItemUpdatedAt         : 1780415616690
UpdatedById           : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
UpdatedByName         : powershell-module-development
```

This cmdlet gets an IP alias.
