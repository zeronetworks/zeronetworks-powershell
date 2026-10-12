### Example 1: List inbound rules
```powershell
Get-ZNInboundRule
```

```output
Action CreatedAt     Description                                      Direction ExpiresAt Id                                   LocalEntityId LocalProcessesList ParentId ParentType RemoteEntityIdsList State UpdatedAt
------ ---------     -----------                                      --------- --------- --                                   ------------- ------------------ -------- ---------- ------------------- ----- ---------
1      1652856440164 Allow communication between all nodes in cluster 1         0         be2bdc05-7837-4125-88ba-983e3ff7e763 g:c:wq1SFxhc  {*}                         0          {g:c:wq1SFxhc}      1     
1      1648717512348 Access portal                                    1         0         f645ad68-9c9c-4172-aeb4-b139048eaf3b a:a:EP2KKITZ  {*}                         0          {b:110001}          1     1651260692136
```

This cmdlet gets inbound rules from the environment.

### Example 2: Get a specific inbound rule
```powershell
Get-ZNInboundRule -RuleId "be2bdc05-7837-4125-88ba-983e3ff7e763"
```

```output
CreatedByEnforcementSource : 5
CreatedById                : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName              : Zero Networks
CreatedByUserRole          : 1
ItemAction                 : 1
ItemCreatedAt              : 1652856440164
ItemDescription            : Allow communication between all nodes in cluster
ItemDirection              : 1
ItemExcludedLocalIdsList   : {}
ItemExpiresAt              : 0
ItemId                     : be2bdc05-7837-4125-88ba-983e3ff7e763
ItemLocalEntityId          : g:c:wq1SFxhc
ItemLocalProcessesList     : {*}
ItemParentId               : 
ItemParentType             : 0
ItemPortsList              : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
ItemRemoteEntityIdsList    : {g:c:wq1SFxhc}
ItemRemoteEntityInfos      : {Hyper-V cluster (deleted)}
ItemState                  : 1
ItemUpdatedAt              : 1671621569513
LocalEntityInfoId          : g:c:wq1SFxhc
LocalEntityInfoName        : Hyper-V cluster (deleted)
UpdatedById                : 
UpdatedByName              : 
```

Get a specific inbound rule.
