### Example 1: List alert exclusions
```powershell
(Get-ZNNetworkAlertExclusion).Items 
```

```output
AlertTypeCategory       : 
AlertTypeDescription    : 
AlertTypeId             : 
AlertTypeName           : 
AlertTypeReferencesList : 
ChangeTicket            : 
Comment                 : 
CreatedAtNanos          : 305624000
CreatedAtSeconds        : 1794331812
CreatedById             : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName           : Zero Networks
Id                      : n:x:It35U35w
InvolvedEntities        : {c:\test.exe}
InvolvedEntityType      : 3
MainEntities            : {}
NetworkAlertTypeId      : 
UpdatedAtNanos          : 305624000
UpdatedAtSeconds        : 1794331812
UpdatedById             : 1f352ed0-86f1-454f-90a5-592c197c8000
UpdatedByName           : Zero Networks
UserAlertClassification : 12
```

This cmdlet lists network alert exclusions.
