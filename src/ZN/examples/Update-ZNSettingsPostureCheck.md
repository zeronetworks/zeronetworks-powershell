### Example 1: Update a posture check
```powershell
Update-ZNSettingsPostureCheck -Enabled -Severity 1 -type 1
```

```output
DefinitionCategory            : 1
DefinitionDescription         : The identity is configured to allow login without providing a password, bypassing standard authentication.
DefinitionEnabled             : True
DefinitionExcludedUserIdsList : 
DefinitionMitreTacticsList    : {Persistence, Defense Evasion}
DefinitionMitreTechniquesList : {T1098}
DefinitionRemediation         : Disable the "Password Not Required" flag on the user object and enforce a strong password policy.
DefinitionSeverity            : 1
DefinitionType                : 1
```

This cmdlet updates a posture check.
