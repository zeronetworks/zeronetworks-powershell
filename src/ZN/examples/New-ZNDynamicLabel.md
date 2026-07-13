### Example 1: Create a dynamic label
```powershell
New-ZNDynamicLabel -LabelKey DBServer -LabelValue True -ConditionNamePatterns "(.*)DB(.*)"
```

```output
ConditionAssetTypes     : {}
ConditionDomains        : {}
ConditionIPBuiltins     : {}
ConditionNamePatterns   : {(.*)DB(.*)}
ConditionOSNamePatterns : {}
ConditionOSTypes        : {}
EnforcementSource       : 5
EntityCount             : 0
Id                      : 80d6837a-cc8d-4c9b-8092-1d0ea51bd3c2
LabelKey                : DBServer
LabelValue              : True
Source                  : 3
Status                  : 3
```

This cmdlet creates a dynamic label.
