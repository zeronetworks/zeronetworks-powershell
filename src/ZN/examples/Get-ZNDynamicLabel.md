### Example 1: List dynamic labels
```powershell
(Get-ZNDynamicLabel).items
```

```output
ConditionDomains        : {}                                                             
ConditionIPBuiltins     : {}
ConditionNamePatterns   : {.*sql.*}
ConditionOSNamePatterns : {}
ConditionOSTypes        : {}
EnforcementSource       : 5
EntityCount             : 0
Id                      : 10c1820d-4fec-4e65-a545-85e792e22897
LabelKey                : shachaf
LabelValue              : rocks
Source                  : 3
Status                  : 1
```

This cmdlet lists dynamic labels.

### Example 2: Get a dyanmic label
```powershell
Get-ZNDynamicLabel -LabelId 10c1820d-4fec-4e65-a545-85e792e22897
```

```output
ConditionAssetTypes     : {}
ConditionDomains        : {}
ConditionIPBuiltins     : {}
ConditionNamePatterns   : {.*sql.*}
ConditionOSNamePatterns : {}
ConditionOSTypes        : {}
EnforcementSource       : 5
EntityCount             : 0
Id                      : 10c1820d-4fec-4e65-a545-85e792e22897
LabelKey                : shachaf
LabelValue              : rocks
Source                  : 3
Status                  : 1
```

This cmdlet gets a dynamic label.
