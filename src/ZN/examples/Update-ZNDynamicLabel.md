### Example 1: Update a dynamic label
```powershell
Update-ZNDynamicLabel -LabelId $label.Id -ConditionNamePatterns $label.ConditionNamePatterns -ConditionOSTypes 2 -LabelKey $label.LabelKey -LabelValue $label.LabelValue
```

```output
ConditionAssetTypes     : {}
ConditionDomains        : {}
ConditionIPBuiltins     : {}
ConditionNamePatterns   : {(.*)DB2(.*)}
ConditionOSNamePatterns : {}
ConditionOSTypes        : {2}
EnforcementSource       : 5
EntityCount             : 0
Id                      : 80d6837a-cc8d-4c9b-8092-1d0ea51bd3c2
LabelKey                : DBServer
LabelValue              : True
Source                  : 3
Status                  : 3
```

This cmdlet updates a dynamic label.
