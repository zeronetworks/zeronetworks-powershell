---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8sdesiredrule
schema: 2.0.0
---

# Get-ZNK8SDesiredRule

## SYNOPSIS
Returns a desired-state rule by ID.
Returns 412 if the rule is not a networkingV1 rule.

## SYNTAX

```
Get-ZNK8SDesiredRule -K8SClusterId <String> -RuleId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a desired-state rule by ID.
Returns 412 if the rule is not a networkingV1 rule.

## EXAMPLES

### Example 1: Get a desired rule
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | Select-Object -First 1
Get-ZNK8SDesiredRule -K8SClusterId $k8scluster.Id -RuleId R:k:4mzKjmPs 
```

```output
HostNamespaceId                      : 
HostNamespaceName                    : 
ItemAction                           : 2
ItemChangeTicket                     : 
ItemClusterId                        : k:c:j3PDZgKj
ItemCompliantAt                      : 1782755585620
ItemCreatedAt                        : 1782291839531
ItemCreatedById                      : 1f352ed0-86f1-454f-90a5-592c197c8000
ItemCreatedByName                    : Zero Networks
ItemDeployedAt                       : 
ItemDescription                      : 
ItemDirection                        : 1
ItemEnvironmentId                    : ca90ac47-3e4a-4898-baba-a1640fda83cd
ItemExcludedCidrs                    : {}
ItemId                               : R:k:4mzKjmPs
ItemIsDeployed                       : True
ItemIsDesired                        : True
ItemLocalSelectors                   : {"matchLabels":{"app.kubernetes.io/instance":"znk8s-cloud-connector","app.kubernetes.io/name":"znk8s-cloud-
                                       connector"}}
ItemNetworkPolicyId                  : k:f:R0xni15n
ItemNetworkPolicyName                : znk8s-discovery
ItemNetworkPolicyUid                 : dd1c25a6-e892-44cc-8ed2-484050d9adad
ItemPolicyChangeTicket               : 
ItemPolicyDescription                : 
ItemPorts                            : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
ItemRemoteEntities                   : {}
ItemRemotePeerSelectorsList          : {}
ItemRemoteSelectors                  : 
ItemSource                           : 5
ItemUpdatedAt                        : 
ItemUpdatedById                      : 
ItemUpdatedByName                    : 
LocalEntityApplication               : 
LocalEntityLabelsMap                 : 
LocalEntitySubnet                    : 
LocalEntityType                      : 
LocalPodSelectorMatchExpressionsList : {}
LocalPodSelectorMatchLabelsMap       : {app.kubernetes.io/instance znk8s-cloud-connector, app.kubernetes.io/name znk8s-cloud-connector}
NamespaceId                          : 
NamespaceName                        : znk8s
```

This cmdlet gets a k8s desired rule.

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

