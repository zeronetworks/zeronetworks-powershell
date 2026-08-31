---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znk8sclusterdesiredrule
schema: 2.0.0
---

# New-ZNK8SClusterDesiredRule

## SYNOPSIS
Create a desired-state rule on an existing network policy.
networkPolicyUid is enriched server-side from the policy.

## SYNTAX

```
New-ZNK8SClusterDesiredRule -K8SClusterId <String> -Action <Int32> -Direction <Int32>
 -NetworkPolicyId <String> -NetworkPolicyName <String> [-AccountName <String>] [-ChangeTicket <String>]
 [-ClusterId <String>] [-Description <String>] [-Id <String>] [-NamespaceName <String>]
 [-Ports <IPortsListItem[]>] [-RemotePeerSelectors <IK8SPeerSelector[]>] [-RemotePeerSelectorsYaml <String>]
 [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Create a desired-state rule on an existing network policy.
networkPolicyUid is enriched server-side from the policy.

## EXAMPLES

### Example 1: Create K8s Desired rule
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
New-ZNK8SDesiredRule -Action 1 -NetworkPolicyName newpolicy -namespacename powershell -K8SClusterId k8scluster.id -NetworkPolicyId k:f:rlVqIRC0 -Direction 1
```

```output
HostNamespaceId                      : 
HostNamespaceName                    : 
ItemAction                           : 1
ItemChangeTicket                     : 
ItemClusterId                        : k:c:j3PDZgKj
ItemCompliantAt                      : 
ItemCreatedAt                        : 
ItemCreatedById                      : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
ItemCreatedByName                    : powershell-module-development
ItemDeployedAt                       : 
ItemDescription                      : 
ItemDirection                        : 1
ItemEnvironmentId                    : ca90ac47-3e4a-4898-baba-a1640fda83cd
ItemExcludedCidrs                    : {}
ItemId                               : R:k:2lGztizb
ItemIsDeployed                       : False
ItemIsDesired                        : True
ItemLocalSelectors                   : {}
ItemNetworkPolicyId                  : k:f:rlVqIRC0
ItemNetworkPolicyName                : newpolicy
ItemNetworkPolicyUid                 : 
ItemPolicyChangeTicket               : 
ItemPolicyDescription                : 
ItemPorts                            : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
ItemRemoteEntities                   : {}
ItemRemotePeerSelectorsList          : {}
ItemRemoteSelectors                  : 
ItemSource                           : 6
ItemUpdatedAt                        : 
ItemUpdatedById                      : 
ItemUpdatedByName                    : 
LocalEntityApplication               : 
LocalEntityLabelsMap                 : 
LocalEntitySubnet                    : 
LocalEntityType                      : 
LocalPodSelectorMatchExpressionsList : {}
LocalPodSelectorMatchLabelsMap       : {}
NamespaceId                          : 
NamespaceName                        : powershell
```

This cmdlet creates a K8s desired rule.

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

### -Action
* 1 - Allow* 2 - Block* 3 - Force Block

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ChangeTicket
.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClusterId
.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Direction
* '1' - Ingress* '2' - Egress

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
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

### -NamespaceName
.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NetworkPolicyId
.

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

### -NetworkPolicyName
.

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

### -Ports
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IPortsListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RemotePeerSelectors
Mutually exclusive with remotePeerSelectorsYaml.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SPeerSelector[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RemotePeerSelectorsYaml
Raw NetworkPolicy-peer YAML (an array of peers, each with namespaceSelector, podSelector, and/or ipBlock).
Parsed server-side into remotePeerSelectors.
Mutually exclusive with remotePeerSelectors.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
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

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


`PORTS <IPortsListItem[]>`: .
  - `[Ports <String>]`: 
  - `[ProtocolType <Int32?>]`: * '0' - HOPOPT         * '1' - ICMP         * '2' - IGMP         * '3' - GGP         * '4' - IPv4         * '5' - ST         * '6' - TCP         * '7' - CBT         * '8' - EGP         * '9' - IGP         * '10' - BBN-RCC-MON         * '11' - NVP-II         * '12' - PUP         * '13' - ARGUS         * '14' - EMCON         * '15' - XNET         * '16' - CHAOS         * '17' - UDP         * '18' - MUX         * '19' - DCN-MEAS         * '20' - HMP         * '21' - PRM         * '22' - XNS-IDP         * '23' - TRUNK-1         * '24' - TRUNK-2         * '25' - LEAF-1         * '26' - LEAF-2         * '27' - RDP         * '28' - IRTP         * '29' - ISO-TP4         * '30' - NETBLT         * '31' - MFE-NSP         * '32' - MERIT-INP         * '33' - DCCP         * '34' - 3PC         * '35' - IDPR         * '36' - XTP         * '37' - DDP         * '38' - IDPR-CMTP         * '39' - TP++         * '40' - IL         * '41' - Embedded         * '42' - SDRP         * '43' - IPv6RoutingHeader         * '44' - IPv6FragmentHeader         * '45' - IDRP         * '46' - RSVP         * '47' - GRE         * '48' - DSR         * '49' - BNA         * '50' - ESP         * '51' - AH         * '52' - I-NLSP         * '53' - SwIPe         * '54' - NARP         * '55' - MOBILE         * '56' - TLSP         * '57' - SKIP         * '58' - ICMPv6         * '59' - IPv6NonExtHeader         * '60' - IPv6DestinationOptions         * '61' - Host-interanl         * '62' - CFTP         * '63' - local-network         * '64' - SAT-EXPAK         * '65' - KRYPTOLAN         * '66' - RVD         * '67' - IPPC         * '68' - distributed-file-system         * '69' - SAT-MON         * '70' - VISA         * '71' - IPCU         * '72' - CPNX         * '73' - CPHB         * '74' - WSN         * '75' - PVP         * '76' - BR-SAT-MON         * '77' - ND         * '78' - WB-MON         * '79' - WB-EXPAK         * '80' - ISO-IP         * '81' - VMTP         * '82' - SECURE-VMTP         * '83' - VINES         * '84' - IPTM         * '85' - NSFNET-IGP         * '86' - DGP         * '87' - TCF         * '88' - EIGRP         * '89' - OSPF         * '90' - Sprite-RPC         * '91' - LARP         * '92' - MTP         * '93' - AX.25         * '94' - OS         * '95' - MICP         * '96' - SCC-SP         * '97' - ETHERIP         * '98' - ENCAP         * '99' - private-encryption         * '100' - GMTP         * '101' - IFMP         * '102' - PNNI         * '103' - PIM         * '104' - ARIS         * '105' - SCPS         * '106' - QNX         * '107' - A/N         * '108' - IPComp         * '109' - SNP         * '110' - Compaq-Peer         * '111' - IPX-in-IP         * '112' - VRRP         * '113' - PGM         * '114' - 0-hop         * '115' - L2TP         * '116' - DDX         * '117' - IATP         * '118' - STP         * '119' - SRP         * '120' - UTI         * '121' - SMP         * '122' - SM         * '123' - PTP         * '124' - IS-IS-over-IPv4         * '125' - FIRE         * '126' - CRTP         * '127' - CRUDP         * '128' - SSCOPMCE         * '129' - IPLT         * '130' - SPS         * '131' - PIPE         * '132' - SCTP         * '133' - FC         * '134' - RSVP-E2E-IGNORE         * '135' - Mobility-Header         * '136' - UDPLite         * '137' - MPLS-in-IP         * '138' - manet         * '139' - HIP         * '140' - Shim6         * '141' - WESP         * '142' - ROHC         * '143' - Ethernet         * '144' - 144 (custom)         * '145' - 145 (custom)         * '146' - 146 (custom)         * '147' - 147 (custom)         * '148' - 148 (custom)         * '149' - 149 (custom)         * '150' - 150 (custom)         * '151' - 151 (custom)         * '152' - 152 (custom)         * '153' - 153 (custom)         * '154' - 154 (custom)         * '155' - 155 (custom)         * '156' - 156 (custom)         * '157' - 157 (custom)         * '158' - 158 (custom)         * '159' - 159 (custom)         * '160' - 160 (custom)         * '161' - 161 (custom)         * '162' - 162 (custom)         * '163' - 163 (custom)         * '164' - 164 (custom)         * '165' - 165 (custom)         * '166' - 166 (custom)         * '167' - 167 (custom)         * '168' - 168 (custom)         * '169' - 169 (custom)         * '170' - 170 (custom)         * '171' - 171 (custom)         * '172' - 172 (custom)         * '173' - 173 (custom)         * '174' - 174 (custom)         * '175' - 175 (custom)         * '176' - 176 (custom)         * '177' - 177 (custom)         * '178' - 178 (custom)         * '179' - 179 (custom)         * '180' - 180 (custom)         * '181' - 181 (custom)         * '182' - 182 (custom)         * '183' - 183 (custom)         * '184' - 184 (custom)         * '185' - 185 (custom)         * '186' - 186 (custom)         * '187' - 187 (custom)         * '188' - 188 (custom)         * '189' - 189 (custom)         * '190' - 190 (custom)         * '191' - 191 (custom)         * '192' - 192 (custom)         * '193' - 193 (custom)         * '194' - 194 (custom)         * '195' - 195 (custom)         * '196' - 196 (custom)         * '197' - 197 (custom)         * '198' - 198 (custom)         * '199' - 199 (custom)         * '200' - 200 (custom)         * '201' - 201 (custom)         * '202' - 202 (custom)         * '203' - 203 (custom)         * '204' - 204 (custom)         * '205' - 205 (custom)         * '206' - 206 (custom)         * '207' - 207 (custom)         * '208' - 208 (custom)         * '209' - 209 (custom)         * '210' - 210 (custom)         * '211' - 211 (custom)         * '212' - 212 (custom)         * '213' - 213 (custom)         * '214' - 214 (custom)         * '215' - 215 (custom)         * '216' - 216 (custom)         * '217' - 217 (custom)         * '218' - 218 (custom)         * '219' - 219 (custom)         * '220' - 220 (custom)         * '221' - 221 (custom)         * '222' - 222 (custom)         * '223' - 223 (custom)         * '224' - 224 (custom)         * '225' - 225 (custom)         * '226' - 226 (custom)         * '227' - 227 (custom)         * '228' - 228 (custom)         * '229' - 229 (custom)         * '230' - 230 (custom)         * '231' - 231 (custom)         * '232' - 232 (custom)         * '233' - 233 (custom)         * '234' - 234 (custom)         * '235' - 235 (custom)         * '236' - 236 (custom)         * '237' - 237 (custom)         * '238' - 238 (custom)         * '239' - 239 (custom)         * '240' - 240 (custom)         * '241' - 241 (custom)         * '242' - 242 (custom)         * '243' - 243 (custom)         * '244' - 244 (custom)         * '245' - 245 (custom)         * '246' - 246 (custom)         * '247' - 247 (custom)         * '248' - 248 (custom)         * '249' - 249 (custom)         * '250' - 250 (custom)         * '251' - 251 (custom)         * '252' - 252 (custom)         * '253' - 253 (custom)         * '254' - 254 (custom)         * '255' - Raw         * '256' - Any         

`REMOTEPEERSELECTORS <IK8SPeerSelector[]>`: Mutually exclusive with remotePeerSelectorsYaml.
  - `[IPBlockCidr <String>]`: 
  - `[IPBlockExceptCidrsList <List<String>>]`: 
  - `[NamespaceSelectorMatchExpressionsList <List<IK8SMatchExpression>>]`: 
    - `Key <String>`: 
    - `Operator <Int32>`: * '1' - In         * '2' - NotIn         * '3' - Exists         * '4' - DoesNotExist         
    - `[ValuesList <List<String>>]`: 
  - `[NamespaceSelectorMatchLabelsMap <List<List<String>>>]`: Array of [key, value] tuples.
  - `[PodSelectorMatchExpressionsList <List<IK8SMatchExpression>>]`: 
  - `[PodSelectorMatchLabelsMap <List<List<String>>>]`: Array of [key, value] tuples.

## RELATED LINKS

