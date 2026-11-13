### Example 1: Create an alert exclusion
```powershell
New-ZNNetworkAlertExclusion -UserAlertClassification not_malicious -InvolvedEntityIds @("C:\test2.exe") -Comment "test api" -InvolvedEntityType process
```

```output
AlertTypeCategory                : 
AlertTypeDescription             : 
AlertTypeName                    : 
AlertTypeReferencesList          : 
ClosedAlertsCount                : 0
CreatedAtNanos                   : 89920000
CreatedAtSeconds                 : 1794336734
CreatedById                      : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
CreatedByName                    : powershell-module-development
ExclusionAlertTypeId             : 
ExclusionChangeTicket            : 
ExclusionComment                 : test api
ExclusionId                      : n:x:n9dUgoob
ExclusionInvolvedEntities        : {c:\test2.exe}
ExclusionInvolvedEntityType      : 3
ExclusionMainEntities            : {}
ExclusionUserAlertClassification : 12
NetworkAlertTypeId               : 
UpdatedAtNanos                   : 89920000
UpdatedAtSeconds                 : 1794336734
UpdatedById                      : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
UpdatedByName                    : powershell-module-development
```

This cmdlet creates an alert exclusion.
