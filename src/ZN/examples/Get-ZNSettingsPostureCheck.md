### Example 1: List posture checks
```powershell
Fet-ZnSettingsPostureCheck
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

DefinitionCategory            : 1
DefinitionDescription         : The identity is forced to use weak DES encryption, making it vulnerable to ticket forgery attacks.
DefinitionEnabled             : True
DefinitionExcludedUserIdsList : 
DefinitionMitreTacticsList    : {Credential Access}
DefinitionMitreTechniquesList : {T1558}
DefinitionRemediation         : Uncheck "Use Kerberos DES encryption types for this account" and ensure AES encryption is supported.
DefinitionSeverity            : 2
DefinitionType                : 2
```

This cmdlet lists posture check settings.
