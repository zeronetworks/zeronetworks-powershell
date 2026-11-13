### Example 1: Update exclusion
```powershell
$exclusion =  Get-ZNNetworkAlertExclusion -ExclusionId n:x:It35U35w
Update-ZNNetworkAlertExclusion -ExclusionId $exclusion.Id -UserAlertClassification $exclusion.UserAlertClassification -Comment "New Comment"
```

```output
AlertTypeCategory                : 
AlertTypeDescription             : 
AlertTypeName                    :                    
AlertTypeReferencesList          : 
ClosedAlertsCount                : 0
CreatedAtNanos                   : 305624000
CreatedAtSeconds                 : 1794331812
CreatedById                      : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName                    : Zero Networks
ExclusionAlertTypeId             : 
ExclusionChangeTicket            : 
ExclusionComment                 : New Comment
ExclusionId                      : n:x:It35U35w
ExclusionInvolvedEntities        : {c:\test.exe}
ExclusionInvolvedEntityType      : 3
ExclusionMainEntities            : {}
ExclusionUserAlertClassification : 12
NetworkAlertTypeId               : 
UpdatedAtNanos                   : 816264000
UpdatedAtSeconds                 : 1794342192
UpdatedById                      : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
UpdatedByName                    : powershell-module-development
```

This cmdlet updates a network alert exclusion.
