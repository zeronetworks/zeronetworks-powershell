---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8sclusterdesiredrule
schema: 2.0.0
---

# Get-ZNK8SClusterDesiredRule

## SYNOPSIS
Returns a desired-state rule by ID.
Returns 412 if the rule is not a networkingV1 rule.

## SYNTAX

```
Get-ZNK8SClusterDesiredRule -K8SClusterId <String> -RuleId <String> [-AccountName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns a desired-state rule by ID.
Returns 412 if the rule is not a networkingV1 rule.

## EXAMPLES

### Example 1: Get K8s Desird Rule
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
Get-ZNK8SClusterDesiredRule -K8SClusterId $k8scluster.id -RuleId "R:k:d96Ctt7J"
```

```output
Action                               : 1
ChangeTicket                         : 
ClusterId                            : k:c:j3PDZgKj
CompliantAt                          : 
CreatedAt                            : 1783553003795
CreatedById                          : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName                        : Zero Networks
DeployedAt                           : 
Description                          : 
Direction                            : 1
EnvironmentId                        : ca90ac47-3e4a-4898-baba-a1640fda83cd
ExcludedCidrs                        : {}
HostNamespaceId                      : k:n:Fo58v1jn
HostNamespaceName                    : powershell
Id                                   : R:k:d96Ctt7J
IsDeployed                           : False
IsDesired                            : True
LocalEntityApplication               : 
LocalEntityLabelsMap                 : 
LocalEntitySubnet                    : 
LocalEntityType                      : 2
LocalPodSelectorMatchExpressionsList : {}
LocalPodSelectorMatchLabelsMap       : {}
LocalSelectors                       : {}
NamespaceId                          : k:n:Fo58v1jn
NamespaceName                        : powershell
NetworkPolicyId                      : k:f:rlVqIRC0
NetworkPolicyName                    : newpolicy
NetworkPolicyUid                     : 
PolicyChangeTicket                   : 
PolicyDescription                    : 
Ports                                : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
RemoteEntities                       : {}
RemotePeerSelectorsList              : {}
RemoteSelectors                      : 
Source                               : 5
UpdatedAt                            : 
UpdatedById                          : 
UpdatedByName                        : 
```

This cmdlet gets a K8s Cluster desired rule.

## PARAMETERS

### -AccountName
this value is per customer / partner

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Read-ZNJWTtoken $env:ZNApiKey).aud.split(".")[0]
Accept pipeline input: False
Accept wildcard characters: False
```

### -K8SClusterId
cluserId to filter on

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RuleId
The id of the rule

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SDesiredRuleItemResponse

## NOTES

## RELATED LINKS

