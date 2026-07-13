<!-- region Generated -->
# ZeroNetworks
This directory contains the PowerShell module for the Api service.

---
## Info
- Modifiable: yes
- Generated: all
- Committed: yes
- Packaged: yes

---
## Detail
This module was primarily generated via [AutoRest](https://github.com/Azure/autorest) using the [PowerShell](https://github.com/Azure/autorest.powershell) extension.

## Development
For information on how to develop for `ZeroNetworks`, see [how-to.md](how-to.md).
<!-- endregion -->

### AutoRest Configuration
> see https://aka.ms/autorest

``` yaml
# Zero Networks PowerShell AutoRest Configuration

require:
  - $(this-folder)/../readme.noprofile.md

input-file:
  - $(this-folder)/../openapi.yaml

module-version: 0.26.6-preview
title: Api
  
inlining-threshold: 200

directive:
  # Following is two common directive which are normally required
  # 1. Remove the unexpanded parameter set
  # 2. For New-* cmdlets, ViaIdentity is not required, so CreateViaIdentityExpanded is removed as well
  - where:
      variant: ^Activate$|^ActivateViaIdentity$|^ActivateViaIdentityExpanded$|^AddViaIdentity$|^AddViaIdentityExpanded$|^ApproveViaIdentity$|^Create$|^CreateViaIdentity$|^CreateViaIdentityExpanded$|^Deactivate$|^DeactivateViaIdentity$|^DeactivateViaIdentityExpanded$|^DeleteViaIdentity$|^DeleteViaIdentityExpanded$|^Deny$|^DenyViaIdentity$|^DenyViaIdentityExpanded$|^Enable$|^EnableViaIdentity$|^EnableViaIdentityExpanded$|^ExpandViaIdentity$|^Extend$|^Extend1$|^ExtendViaIdentity$|^ExtendViaIdentityExpanded$|^Generate$|^GenerateViaIdentity$|^GenerateViaIdentityExpanded$|^GetViaIdentity$|^Learn$|^LearnViaIdentity$|^LearnViaIdentityExpanded$|^Mirror$|^Mirror1$|^MirrorViaIdentity$|^MirrorViaIdentityExpanded$|^Move$|^Notify$|^NotifyViaIdentity$|^ProtectViaIdentity$|^ProtectViaIdentityExpanded$|^Queue$|^Queue1$|^QueueViaIdentity$|^QueueViaIdentityExpanded$|^RevokeViaIdentity$|^SearchViaIdentity$|^Set$|^SetViaIdentity$|^SetViaIdentityExpanded$|^UnprotectViaIdentity$|^UnprotectViaIdentityExpanded$|^UpdateViaIdentity$|^UpdateViaIdentityExpanded$|^ValidateViaIdentity$|^ValidateViaIdentityExpanded$
    remove: true
  - where:
      subject: ^CustomGroupsMember$|^TagGroupsMember$
      variant: Delete
    remove: true
  - where:
      subject: AssetDeploymentsCluster
    remove: true
  - where:
      subject: UserType
      variant: Update
    remove: true
  - where:
      variant: ^Add$|^Update$
    hide: true
  # Better in UX
  - where:
      subject: SettingsAdOuConfig|^AccessMatrix$
    hide: true
  # Remove Update Recovery
  - where:
      subject: SettingsSegmentConnector
    hide: true
  # Remove the export cmdlets
  - where:
      subject: (.*)Export$
    remove: true
  - where:
      verb: Export
    remove: true
  #Remove External Maint Window and Temp
  - where:
      subject: ^MaintenanceWindow$|^SettingsVersionMaintenanceWindowTemp$
    remove: true
  #Remove Activity cmdlets
  - where:
      subject: (.*)Activity$|(.*)Activities(.*)
    remove: true
  - where:
      subject: (.*)ActivityMap$|^K8sAccessMatrix$
    remove: true
  - where:
      subject: (.*)Analysis$
    remove: true
  # Remove Role cmdlets
  - where:
      subject: (.*)Role$
    remove: true
  - where:
      verb: Get
      subject: RolesCandidate
    remove: true
  #Remove filters cmdlets
  - where:
      subject: (.*)Filter$
    remove: true
  # remove Ad Sync Info
  - where:
      subject: SettingsAdSyncInfo
    hide: true
  # Hide remove ot (Not implemneted)
  - where:
      verb: Remove
      subject: AssetOt
    hide: true
  # Hide (Not Implemented)
  - where:
      subject: SettingsAssetManager
      verb: ^Add$|^Remove$
    hide: true
  # Hide (Not Implemented)
  - where:
      subject: AuthLogout
      verb: Invoke
    hide: true
  # Hide (Not Implemented)
  - where:
      subject: InvokeAssetRetryHealth
      verb: Invoke
    hide: true
  - where:
      subject: ^AssetsScriptsPowerShellTestUdpNetConnection$|^AssetsScriptsPythonTestUdpNetConnection$|^FixAssetScriptWmi$|^FixAssetsScriptWmi$
    remove: true
  # Hide Rule History (not useful)
  - where:
      subject: (.*)RulesHistory$
    hide: true
  # hide environment commands (not useful)
  - where:
        subject: Environments(.*)
    hide: true
  # hide simulate (not useful)
  - where:
      subject: (.*)PoliciesSimulate.*
    hide: true
  - where:
      subject: GroupsSimulateSegmentation.*
    remove: true
  # hide linux scripts (not useful)
  - where:
      subject: ^AssetsLinuxScript$|^AssetsLinuxScriptAvailable$|^AssetsLinuxScriptForProfile$
    hide: true
  # hide K8s cmdlets (not useful)
  - where:
      subject: ^K8sClusterLabelNode$|^K8sClusterWorkloadApplication$|^K8sClusterWorkloadLabel$|^K8sWorkloadApplication$|^K8s(.*)NetworkPolicy$
    hide: true
  # Hide profile cmdlets
  - where:
      subject: ^ProfileEnvironment$|^Profile$|^K8SNamespaceWorkloadApplication$|^K8SNamespaceWorkloadNetworkAnalysis$|^LinuxSetupScriptTry$
    hide: true
  # Hide Not useful for OT assets
  - where:
      subject: ^AssetOtAnalysis$|^AssetOtIdentityRule$|^AssetOtIdentityRulesAssetsCandidate$|^AssetOtIdentityRulesExcludedAssetsCandidate$|^AssetOtIdentityRulesUserCandidate$|^AssetOtInboundRule$|^AssetOtInboundRulesDestinationCandidate$|^AssetOtInboundRulesExcludedDestinationCandidate$|^AssetOtInboundRulesSourceCandidate$|^AssetOtmfaIdentityPoliciesDestinationCandidate$|^AssetOtmfaIdentityPoliciesExcludedSourceCandidate$|^AssetOtmfaIdentityPoliciesMfamethod$|^AssetOtmfaIdentityPoliciesSourceCandidate$|^AssetOtmfaIdentityPoliciesSourceUserCandidate$|^AssetOtmfaIdentityPolicy$|^AssetOtmfaInboundPoliciesDestinationCandidate$|^AssetOtmfaInboundPoliciesExcludedSourceCandidate$|^AssetOtmfaInboundPoliciesMfamethod$|^AssetOtmfaInboundPoliciesSourceCandidate$|^AssetOtmfaInboundPoliciesSourceUserCandidate$|^AssetOtmfaInboundPolicy$|^AssetOtOutboundRule$|^AssetOtmfaOutboundPoliciesDestinationCandidate$|^AssetOtmfaOutboundPoliciesExcludedSourceCandidate$|^AssetOtmfaOutboundPoliciesMfamethod$|^AssetOtmfaOutboundPoliciesSourceCandidate$|^AssetOtmfaOutboundPoliciesSourceUserCandidate$|^AssetOtmfaOutboundPolicy$|^AssetOtOutboundRulesDestinationCandidate$|^AssetOtOutboundRulesExcludedSourceCandidate$|^AssetOtOutboundRulesSourceCandidate$|^AssetOtOutboundRulesUserCandidate$|^AssetOtrpcRule$|^AssetOtrpcRulesDestinationCandidate$|^AssetOtrpcRulesExcludedDestinationCandidate$|^AssetOtrpcRulesSourceCandidate$|^AssetOtrpcRulesUserCandidate$|^AssetOtRulesDistribution$
    hide: true
  # Remove notifications cmdlets
  - where:
      subject: ^SettingsNotification$
    remove: true
  # Remove APIs that require Human access
  - where:
      subject: (.*)Token
    remove: true
  - where:
      subject: SettingsCustomUser
    remove: true
  # Rename Queue Commands
  - where:
      subject: ^QueueAssetsNetwork$|^QueueAssetNetwork$
    set:
      subject: AssetNetworkQueue
  - where:
      subject: ^QueueAssetsExtendNetwork$|^QueueAssetExtendNetwork$
    set:
      subject: AssetNetworkExtendQueue
  - where:
      subject: ^QueueAssetOtNetwork$|^QueueAssetsOtNetwork$
    set:
      subject: AssetOtNetworkQueue
  - where:
      subject:  ^QueueAssetOtExtendNetwork$|^QueueAssetsOtExtendNetwork$
    set:
      subject: AssetOtNetworkExtendQueue
  - where:
      subject: QueueUsersIdentity
    set:
      subject: UserIdentityQueue
  - where:
      subject: ^QueueAssetIdentity$|^QueueAssetsIdentity$
    set:
      subject: AssetIdentityQueue
  - where:
      subject: ^QueueAssetExtendIdentity$|^QueueAssetsExtendIdentity$
    set:
      subject: AssetIdentityExtendQueue
  - where:
      subject: QueueAssetsRpc
    set:
      subject: AssetRpcQueue
  - where:
      subject: QueueAssetsExtendRpc
    set:
      subject: AssetRpcExtendQueue
  # rename asset/ot/user queue/protect/unprotect commands
  - where:
      subject: AssetsOtNetworkSegment
      variant: ^Protect$|^Unprotect$
    remove: true
  - where:
      subject: AssetsOtNetworkSegment
      verb: ^Protect$|^Unprotect$
    set:
      subject: AssetOtNetworkSegment
  - where:
      subject: AssetsNetworkSegment
      variant: ^Protect$|^Unprotect$
    remove: true
  - where:
      subject: AssetsNetworkSegment
      verb: ^Protect$|^Unprotect$
    set:
      subject: AssetNetworkSegment
  - where:
      subject: ^AssetsNetworkSegmentProtect$|^AssetsetworkSegmentUnprotect$
      variant: Validate
    hide: true
  - where:
      subject: AssetsNetworkSegmentProtect
      verb: Test
    set:
      subject: AssetNetworkSegmentProtect
  - where:
      subject: AssetsNetworkSegmentUnprotect
      verb: Test
    set:
      subject: AssetNetworkSegmentUnprotect
  - where:
      subject: ^AssetsOtNetworkSegmentUnprotect$
      variant: Validate
    hide: true
  - where:
      subject: AssetsOtNetworkSegmentUnprotect
      verb: Test
    set:
      subject: AssetOtNetworkSegmentUnprotect
  - where:
      subject: UsersIdentitySegment
      variant: ^Protect$|^Unprotect$
    remove: true
  - where:
      subject: UsersIdentitySegment
      verb: ^Protect$|^Unprotect$
    set:
      subject: UserIdentitySegment
  - where:
      subject: AssetsIdentitySegment
      variant: ^Protect$|^Unprotect$
    remove: true
  - where:
      subject: AssetsIdentitySegment
      verb: ^Protect$|^Unprotect$
    set:
      subject: AssetIdentitySegment
  - where:
      subject: ^AssetsRpcSegment$|^AssetRpcSegment$
      variant: ^Protect$|^Unprotect$
    remove: true
  - where:
      subject: AssetsRpcSegment
      verb: ^Protect$|^Unprotect$
    set:
      subject: AssetRpcSegment
  - where:
      subject: ^AssetsIdentitySegmentProtect$|^AssetsIdentitySegmentUnprotect$
      variant: Validate
    hide: true
  - where:
      subject: AssetsIdentitySegmentProtect
      verb: Test
    set:
      subject: AssetIdentitySegmentProtect
  - where:
      subject: AssetsIdentitySegmentUnprotect
      verb: Test
    set:
      subject: AssetIdentitySegmentUnprotect
  - where:
      subject: AssetsQuarantine
      verb: Enable
    set:
      subject: AssetQuarantine
  - where:
      subject: UsersQuarantine
      verb: Enable
    set:
      subject: UserQuarantine
  - where:
      subject: AssetsOSType
    set:
      subject: AssetOSType
  - where:
      subject: AssetsOutboundRestriction
    set:
      subject: AssetOutboundRestriction
  - where:
      subject: AssetsOutboundRestriction
    set:
      subject: AssetOutboundRestriction
  # combine assets/asset
  - where:
      subject: AssetsMirror
    set:
      subject: AssetMirror
  - where:
      subject: AssetPreferredSegmentServer
    hide: true
  - where:
      subject: AssetsDeploymentsCluster
    set:
      subject: AssetDeploymentsCluster
  # combine user search
  - where:
      subject: ^UsersByPrincipalName$|^UsersBySid$
      verb: Search
    set:
      subject: User
  #combine user type
  - where:
      subject: UsersType
      verb: Update
    set:
      subject: UserType
  #combine rpc monitor/segment
  - where:
      subject: ^AssetsRpcMonitoring|^AssetRpcSegment$
      variant: ^Add$|^Delete$
    remove: true
  - where:
      subject: AssetsRpcMonitoring
    set:
      subject: AssetRpcMonitoring
  - where:
      subject: AssetRpcMonitoring
      variant: Add
    hide: false
  - where:
      subject: AssetsRpcSegment
      variant: ^Add$|^Delete$
    remove: true
  - where:
      subject: AssetsRpcSegment
    set:
      subject: AssetRpcSegment
  - where:
      subject: AssetRpcSegment
      variant: Add
    hide: false
  #Combine Active/Inactive
  - where:
      subject: ^AssetActive$|^AssetsActive$|^AssetInactive$|^AssetsInactive$|^AssetOtActive$|^AssetsOtActive$|^AssetOtInactive$|^AssetsOtInactive$
      variant: Set
    remove: true
  - where:
      subject: AssetsActive
      variant: SetExpanded
    set:
      subject: AssetActive
  - where:
      subject: AssetsInactive
      variant: SetExpanded
    set:
      subject: AssetInactive
  - where:
      subject: AssetsOtInactive
      variant: SetExpanded
    set:
      subject: AssetOtInactive
  - where:
      subject: AssetsOtActive
      variant: SetExpanded
    set:
      subject: AssetOtActive
  - where:
      subject: ^SwitchActive$|^SwitchInactive$
    remove: true
  - where:
      subject: SwitchesActive
      variant: SetExpanded
    set:
      subject: SwitchActive
  - where:
      subject: SwitchesInactive
      variant: SetExpanded
    set:
      subject: SwitchInactive
  #Combine Update Asset
  - where:
      subject: AssetsUpdate
      variant: UpdateExpanded
    set:
      subject: AssetUpdate
  # Combine break glass
  - where:
      subject: AssetsBreakGlass
      verb: Initialize
    set:
      subject: AssetBreakGlass
  - where:
      subject: ^DeactivateAssetsBreakGlass$|^DeactivateAssetBreakGlass$
      verb: Invoke
    set:
      subject: AssetDeactivateBreakGlass
  - where:
      subject: SwitchesNetworkBreakGlass
      verb: Initialize
    set:
      subject: SwitchNetworkBreakGlass
  - where:
      subject: SwitchesMonitoringBreakGlass
      verb: Initialize
    set:
      subject: SwitchMonitoringBreakGlass
  # change set to update
  - where:
      verb: Set
    set:
      verb: Update
  # set Limit parameter default
  - where:
      parameter-name: Limit
    set:
      default:
        name: Limit Default
        description: Sets the limit parameter to 10
        script: '10'
  - where:
      parameter-name: Offset
    set:
      default:
        name: Offset Default
        description: Sets the offset parameter to 0
        script: '0'
  - where:
      parameter-name: AccountName
    set:
      default:
        name: AccountName Default
        description: Set the acccount name paramater to an environment variable
        script: '(Read-ZNJWTtoken $env:ZNApiKey).aud.split(".")[0]'
  # set the default directions for cmdlets
  - where:
      subject: ^AssetInboundRule$|^AssetOtOutboundRule$|^GroupsInboundRule$|^AssetOtInboundOtRule$|^GroupsInboundOtRule$|^InboundOtRule$
      parameter-name: Direction
    set:
      default:
        name: Direction Default
        description: Sets the direction parameter to 1
        script: '1'
  - where:
      subject: ^AssetOutboundRule$|^AssetOtInboundRule$|^GroupsOutboundRule$|^AssetOtOutboundOtRule$|^GroupsOutboundOtRule$|^OutboundOtRule$
      parameter-name: Direction
    set:
      default:
        name: Direction Default
        description: Sets the direction parameter to 2
        script: '2'
  # set default Direction for Analysis Commands
  - where:
      subject: (.*)Analysis
      parameter-name: Direction
    set:
      default:
        name: Direction Default
        description: Sets the direction parameter to 1
        script: '1'
  #set default for directlyretrievedfromasset
  - where:
      subject: ^AssetNetworkAnalysis$|^GroupsNetworkAnalysis$
      parameter-name: DirectlyRetrievedFromAsset
    set:
      default:
        name: DirectlyRetrievedFromAsset Default
        description: Sets the default to True
        script: '$true'
  - where:
      subject: AssetOtNetworkAnalysis
      parameter-name: DirectlyRetrievedFromAsset
    set:
      default:
        name: DirectlyRetrievedFromAsset Default
        description: Sets the default to True
        script: '$false'
  # Set Default TrafficType for Network Analysis commands
  - where:
      subject: (.*)NetworkAnalysis
      parameter-name: TrafficType
    set:
      default:
        name: TrafficType Default
        description: Sets the TrafficType to Both
        script: '3'
  # Set default ConnectionState for  Network Analysis
  - where:
      subject: (.*)NetworkAnalysis
      parameter-name:  ConnectionState
    set:
      default:
        name: ConnectionState Default
        description: Sets the ConnectionState to Established
        script: '3'
# Set Default EventType for Identity Analysus commands
  - where:
      subject: (.*)IdentityAnalysis
      parameter-name: EventType
    set:
      default:
        name: EventType Default
        description: Sets the EventType to Success
        script: '0'
  # set the default RuleType for AE Exclusions
  - where:
      subject: AeExclusionsInbound(.*)
      parameter-name: RuleType
    set:
      default:
        name: RuleType Default
        description: Sets the rule type parameter to 1
        script: '1'
  - where:
      subject: AeExclusionsOutbound(.*)
      parameter-name: RuleType
    set:
      default:
        name: RuleType Default
        description: Sets the rule type parameter to 2
        script: '2'
  # set AddAncestors parameter default
  - where:
      parameter-name: AddAncestors
    set:
      default:
        name: AddAncestors Default
        description: Sets the AddAncestors parameter to $true
        script: '$true'
  # set withCount default
  - where:
      parameter-name: WithCount
    set:
      default:
        name: WithCount Default
        description: Sets the WithCount parmaeter to true.
        script: '$true'
  #Set default policy type for onboarding policies
  - where:
      subject: IdentityOnboardingPolicy
      verb: Update
      parameter-name: PolicyType
    set:
      default:
        name: PolicyType Default
        description: Sets the PolicyType parmaeter to 2.
        script: '2'
  - where:
      subject: NetworkOnboardingPolicy
      verb: Update
      parameter-name: PolicyType
    set:
      default:
        name: PolicyType Default
        description: Sets the PolicyType parmaeter to 1.
        script: '1'
  #set default state for AE Exclusions
  - where:
      verb: New
      subject: ^AeExclusionsInbound$|^AeExclusionsOutbound$
      parameter-name: state
    set:
      default:
        name: State Default
        description: Sets the State parmaeter to 7.
        script: '7'
  - where:
      verb: New
      subject: ^AeExclusionsInbound$|^AeExclusionsOutbound$
      parameter-name: action
    set:
      default:
        name: Action Default
        description: Sets the Action parmaeter to 1.
        script: '1'
  # combine User Inactive
  - where:
      subject: UsersActive
    set:
      subject: UserActive
  - where:
      subject: UsersInactive
      verb: Update
    set:
      subject: UserInactive
  - where:
      verb: Getx
      subject: AssetPreferredSegmentServer
      variant: Get
    hide: true
  - where:
      subject: SettingsMaintenanceWindow
    remove: true
  # Remove commands not useful
  - where:
      subject: ^SimulateSegmentation$|^activitiesAnalysisWidget$|^SwitchBindingDirection$
    remove: true
  - where:
      subject: SettingsLicense
      verb: Update
    remove: true
  # Hide for Custom Wrappers
  - where:
      verb: Update
      subject: ^AeExclusionsInbound$|^AeExclusionsOutbound$|^AssetExternalAccessPolicy$|^AssetIdentityRule$|^AssetInboundRule$|^AssetInboundOtRule$|^AssetMfaIdentityPolicy$|^AssetMFAInboundPolicy$|^AssetMFAOutboundPolicy$|^AssetOtInboundOtrule$|^AssetOtOutboundOtrule$|^AssetOutboundRule$|^ConnectPolicy$|^ConnectPostureProfile$|^AssetOutboundOtRule$|^AssetOtMFAOutboundPolicy$|^AssetRpcRule$|^CustomGroup$|^ExternalAccessPolicy$|^GroupsExternalAccessPolicy$|^GroupsIdentityRule$|^GroupsInboundRule$|^GroupsInboundOtRule$|^GroupsMfaIdentityPolicy$|^GroupsMFAInboundPolicy$|^GroupsMFAOutboundPolicy$|^GroupsOutboundRule$|^GroupsOutboundOtRule$|^GroupsRpcRule$|^IdentityRule$|^InboundRule$|^InboundOtRule$|^InternalAccessPolicy$|^K8SDesiredRule$|^MfaIdentityPolicy$|^MFAInboundPolicy$|^MFAOutboundPolicy$|^OutboundRule$|^OutboundOtRule$|^RpcRule$|^SettingsPushNotification$|^SwitchInboundOtRule$|^SwitchOutboundOtRule$|^UserExternalAccessPolicy$|^UserIdentityRule$|^UserMfaIdentityPolicy$|^UserMfaInboundPolicy$|^UserMfaOutboundPolicy$|^UserOutboundRule$
    hide: true
  - where:
      subject: ^AuthLogin$|^AuthChallenge$|^SettingsFirewallMode$|^SettingsFirewallModeAsset$
    hide: true
  - where:
      subject: (.*)RuleReview$|(.*)RulesReview$
    hide: true
  # cloud
  - where:
      subject: ^CloudAzureResource$|^CloudAzureResourceGroup$|^CloudAzureSubscription$|^SettingsCloudDeploymentsAzure$|^SettingsCloudDeploymentsAzureSync$|^CloudAzureSubscriptionSyncConfig$
    remove: true
  # Firewall
  - where:
      subject: Firewall
    remove: true
  # Hyerpvisor
  - where:
      subject: SettingsHypervisor(.*)|^ResyncHypervisor$
    remove: true
  # Health Center
  - where:
      subject: HealthCenter(.*)
    remove: true
  # Remove deployments cluster cmdlet
  - where:
      subject: AssetDeploymentsCluster
      verb: Remove
    remove: true
  # not useful
  - where:
      subject: SettingsPostureChecksExcludedUser
      verb: Update
    remove: true
  # Remove Download cmdlets
  - where:
      subject: ^SettingsSiemDataStructure$
    remove: true
  - where:
      subject: Download(.*)
    remove: true
  - where:
      subject: ^SettingsPilotGroupPilotRollout$|^SettingsPilotGroupActivePilotRollout$
    remove: true
  # format Responses
  - where:
      model-name: Asset
    set:
      format-table:
        properties:
          - Id
          - Fqdn
          - IPV4Addresses
          - IPV6Addresses
          - Source
          - AssetStatus
          - ProtectionState
  - where:
      model-name: AssetOt
    set:
      format-table:
        properties:
          - Id
          - Fqdn
          - IPV4Addresses
          - IPV6Addresses
          - Source
          - AssetStatus
          - ProtectionState
  - where:
      model-name: Audit
    set:
      format-table:
        properties:
          - IsoTimestamp
          - AuditType
          - DestinationEntitiesList
          - EnforcementSource
          - PerformedByName
  - where:
      model-name: Rule
    set:
      format-table:
        properties:
          - CreatedAt
          - RemoteEntityInfos
          - LocalEntityInfoName
          - ExcludedEntityInfoName
          - RuleClass
          - ActivitiesCount
          - Id
          - CreatedByEnforcementSource
          - State
          - Description
  - where:
      model-name: SwitchRule
    set:
      format-table:
        properties:
          - CreatedAt
          - RemoteEntityInfos
          - LocalEntityInfoName
          - ExcludedEntityInfoName
          - RuleClass
          - ActivitiesCount
          - Id
          - CreatedByEnforcementSource
          - State
          - Description
  - where:
      model-name: AeExclusion
    set:
      format-table:
        properties:
          - CreatedAt
          - RemoteEntityInfos
          - LocalEntityInfoName
          - ExcludedEntityInfoName
          - RuleClass
          - ActivitiesCount
          - Id
          - CreatedByEnforcementSource
          - State
          - Description
  - where:
      model-name: IdentityRule
    set:
      format-table:
        properties:
          - CreatedAt
          - Id
          - UserInfos
          - AssetInfoName
          - ExcludedAssetInfos
          - IdentityProtectionCategoryList
          - ExpiresAt
          - Ruleclass
          - CreatedByEnforcementSource
          - State
          - Description
  - where:
      model-name: RpcRule
    set:
      format-table:
        properties:
          - CreatedAt
          - Id
          - UserInfos
          - RemoteAssetInfos
          - LocalAssetInfoName
          - ProtocolsList
          - InterfaceUuidsList
          - OpNumbersList
          - Action
          - ExpiresAt
          - RuleClass
          - State
  - where:
      model-name: ReactivePolicy
    set:
      format-table:
        properties:
          - SrcEntityInfos
          - SrcProcessNames
          - SrcUserInfos
          - DstEntityInfoName
          - DstPort
          - DstProcessNames
          - RuleDuration
          - ExtraPorts
          - FallbackToLoggedOnUser
          - MfaMethods
  - where:
      model-name: User
    set:
      format-table:
        properties:
          - Id
          - Name
          - Email
          - Phone
          - JobTitle
          - LastLogon
  - where:
      model-name: Group
    set:
      format-table:
        properties:
          - Id
          - Name
          - Description
          - DirectMembersCount
  - where:
      model-name: settingsIdp
    set:
      format-table:
        properties:
          - identityProviderType
          - isDefault
  - where:
      model-name: SettingsAdForest
    set:
      format-table:
        properties:
          - ForestId
          - ActiveDirectoryInfoDomainName
          - ActiveDirectoryInfoDomainControllerFqdn
          - ActiveDirectoryInfoUsername
          - ActiveDirectoryInfoUseLdaps
  - where:
      model-name: AssetsOrGroupsListItemsItem
    set:
      format-table:
        properties:
          - Id
          - Fqdn
          - Name
          - Description
          - DirectMembersCount
          - IPV4Addresses
          - IPV6Addresses
          - Source
          - AssetStatus
          - ProtectionState
  - where:
      model-name: GroupsOrUsersListItemsItem
    set:
      format-table:
        properties:
          - Id
          - Name
          - Email
          - Description
          - DirectMembersCount
          - Phone
          - JobTitle
          - LastLogon
  - where:
      model-name: CandidatesList
    set:
      format-table:
        properties:
          - Id
          - Name
          - Domain
  - where:
      model-name: GroupCandidate
    set:
      format-table:
        properties:
          - Id
          - Name
          - Domain
```
