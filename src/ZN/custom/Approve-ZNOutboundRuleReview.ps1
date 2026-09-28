<#
.Synopsis
Approve a "pending review" rule with or without changes
.Description
Approve a "pending review" rule with or without changes

.Link
https://github.com/zeronetworks/zero-powershell/zeronetworks/Approve-ZNOutboundRuleReview
#>
function Approve-ZNOutboundRuleReview {
    [OutputType([ZeroNetworks.PowerShell.Cmdlets.Api.Models.Any])]
    [CmdletBinding(DefaultParameterSetName = 'ApproveExpanded', PositionalBinding = $false, SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param(
        [Parameter(ParameterSetName = 'ApproveExpanded')]
        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Path')]
        [System.String]
        # Account Name
        ${AccountName},

        [Parameter(ParameterSetName = 'ApproveExpanded', Mandatory)]
        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded', Mandatory)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Path')]
        [System.String]
        # rule Id
        ${RuleId},

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String]
        # Comments. Required (3-200 characters) when Reason is Other.
        ${Details},

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ValidateSet('HumanTrafficCoveredByMFA', 'TightenRuleScope', 'MissingPortOrProcess', 'AffectedEntitiesContainedInAnExisitingGroup', 'AffectedEntitiesContainedInAnExistingGroup', 'RedundantRule', 'TrafficShouldBeBlocked', 'Other', 'WidenRuleScope')]
        # Review Reason. Required unless ForceReview is $false.
        ${Reason},

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [bool]
        # When true (default), a review Reason is mandatory.
        ${ForceReview},

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [int32]
        # Action
        ${Action},

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String]
        # the rule change ticket.
        ${ChangeTicket},

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String]
        # the rule description.
        ${Description},
        #[-RuleInfoDescription <String>]

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [string[]]
        # excluded destination asset(s).
        ${ExcludedLocalIdsList},
        #[-RuleInfoExcludedLocalIdsList <String[]>]

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [Int64]
        # when the rule should expiry.
        ${ExpiresAt},
        #[-RuleInfoExpiresAt <Int64>]

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String]
        # the firewall id.
        ${FirewallId},

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [int32]
        # ip sec configuration
        ${IpSecOpt},

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [bool]
        # reject (instead of drop) on linux.
        ${IsRejectOnLinux},

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String]
        # The Destination asset(s).
        ${LocalEntityId},
        #[-RuleInfoLocalEntityId <String>]

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String[]]
        # the destination process paths. Cannot be used with ServicesList.
        ${LocalProcessesList},
        #[-RuleInfoLocalProcessesList <String[]>]

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String]
        # the rule name.
        ${Name},

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.IPortsListItem[]]
        # the destination ports and protocols.
        ${PortsList},
        #[-RuleInfoPortsList <IPortsListItem[]>]

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [string[]]
        # the source asset(s).
        ${RemoteEntityIdsList},
        #[-RuleInfoRemoteEntityIdsList <String[]>]

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ValidateRange(1, 5)]
        [int32]
        # the rule category. 1=IT, 2=CLOUD_NSG, 3=CLOUD_RANGE, 4=CLOUD_FQDN, 5=CLOUD_S2S
        ${RuleCategory},

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [string[]]
        # the destination services. Cannot be used with LocalProcessesList.
        ${ServicesList},

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISrcUsersListItem[]]
        # the source users. Cannot be used with ServicesList.
        ${SrcUsersList},

        [Parameter(ParameterSetName = 'ApproveWithChangesExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ValidateSet(1, 2)]
        [int32]
        # the rule state. 1=Enabled, 2=Disabled
        ${State},

        [Parameter()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command as a job
        ${AsJob},

        [Parameter(DontShow)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},

        [Parameter()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command asynchronously
        ${NoWait},

        [Parameter(DontShow)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},

        [Parameter(DontShow)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )

    process {
        try {
            #handle based on paramtersetname
            switch ($PsCmdlet.ParameterSetName) {
                "ApproveExpanded" {
                    ZeroNetworks.internal\Approve-ZNOutboundRulesReview @PSBoundParameters
                }
                "ApproveWithChangesExpanded" {
                    #Validate review
                    $forceReview = -not $PSBoundParameters.ContainsKey('ForceReview') -or $PSBoundParameters['ForceReview']
                    if ($forceReview -and -not $PSBoundParameters.ContainsKey('Reason')) {
                        throw "You must provide Reason unless ForceReview is `$false"
                    }
                    if ($PSBoundParameters['Reason'] -eq 'Other') {
                        $detailsLength = "$($PSBoundParameters['Details'])".Length
                        if ($detailsLength -lt 3 -or $detailsLength -gt 200) {
                            throw "You must provide Details (3-200 characters) if Reason is Other"
                        }
                    }

                    #Handle Get
                    $ruleId = $PSBoundParameters['RuleId'].ToString()
                    $rule = ZeroNetworks\Get-ZNOutboundRule -RuleId $ruleId

                    $ruleReview = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.RuleReviewApproveWithChanges]::new()

                    if ($PSBoundParameters.ContainsKey('ForceReview')) {
                        $ruleReview.ForceReview = $PSBoundParameters['ForceReview']
                    }

                    if ($PSBoundParameters.ContainsKey('Reason')) {
                        switch ($PSBoundParameters['Reason']) {
                            'HumanTrafficCoveredByMFA' { $intReason = 1 }
                            'TightenRuleScope' { $intReason = 2 }
                            'MissingPortOrProcess' { $intReason = 3 }
                            'AffectedEntitiesContainedInAnExisitingGroup' { $intReason = 4 }
                            'AffectedEntitiesContainedInAnExistingGroup' { $intReason = 4 }
                            'RedundantRule' { $intReason = 5 }
                            'TrafficShouldBeBlocked' { $intReason = 6 }
                            'Other' { $intReason = 7 }
                            'WidenRuleScope' { $intReason = 8 }
                        }
                        $ruleReview.ReviewReason = $intReason
                    }

                    if ($PSBoundParameters.ContainsKey('Details')) {
                        $ruleReview.ReviewDetails = $PSBoundParameters['Details']
                    }

                    # direction is set by the server from the route

                    if ($PSBoundParameters.ContainsKey('Action')) {
                        $ruleReview.RuleInfoAction = $PSBoundParameters['Action']
                    }
                    else {
                        $ruleReview.RuleInfoAction = $rule.ItemAction
                    }

                    if ($PSBoundParameters.ContainsKey('ChangeTicket')) {
                        $ruleReview.RuleInfoChangeTicket = $PSBoundParameters['ChangeTicket']
                    }
                    else {
                        $ruleReview.RuleInfoChangeTicket = $rule.ItemChangeTicket
                    }

                    if ($PSBoundParameters.ContainsKey('Description')) {
                        $ruleReview.RuleInfoDescription = $PSBoundParameters['Description']
                    }
                    else {
                        $ruleReview.RuleInfoDescription = $rule.ItemDescription
                    }

                    if ($PSBoundParameters.ContainsKey('ExcludedLocalIdsList')) {
                        $ruleReview.RuleInfoExcludedLocalIdsList = $PSBoundParameters['ExcludedLocalIdsList']
                    }
                    else {
                        $ruleReview.RuleInfoExcludedLocalIdsList = $rule.ItemExcludedLocalIdsList
                    }

                    # leave expiresAt unset (omitted from the body) when the rule has no expiry
                    if ($PSBoundParameters.ContainsKey('ExpiresAt')) {
                        $ruleReview.RuleInfoExpiresAt = $PSBoundParameters['ExpiresAt']
                    }
                    elseif ($rule.ItemExpiresAt -gt 0) {
                        $ruleReview.RuleInfoExpiresAt = $rule.ItemExpiresAt
                    }

                    if ($PSBoundParameters.ContainsKey('FirewallId')) {
                        $ruleReview.RuleInfoFirewallId = $PSBoundParameters['FirewallId']
                    }
                    elseif ($rule.ItemFirewallId) {
                        $ruleReview.RuleInfoFirewallId = $rule.ItemFirewallId
                    }

                    if ($PSBoundParameters.ContainsKey('IpSecOpt')) {
                        $ruleReview.RuleInfoIpSecOpt = $PSBoundParameters['IpSecOpt']
                    }
                    else {
                        $ruleReview.RuleInfoIpSecOpt = $rule.ItemIpSecOpt
                    }

                    if ($PSBoundParameters.ContainsKey('IsRejectOnLinux')) {
                        $ruleReview.RuleInfoIsRejectOnLinux = $PSBoundParameters['IsRejectOnLinux']
                    }
                    else {
                        $ruleReview.RuleInfoIsRejectOnLinux = $rule.ItemIsRejectOnLinux
                    }

                    if ($PSBoundParameters.ContainsKey('LocalEntityId')) {
                        $ruleReview.RuleInfoLocalEntityId = $PSBoundParameters['LocalEntityId']
                    }
                    else {
                        $ruleReview.RuleInfoLocalEntityId = $rule.ItemLocalEntityId
                    }

                    # processes and services are mutually exclusive, only fall back to the rule when neither is provided
                    if ($PSBoundParameters.ContainsKey('LocalProcessesList') -or $PSBoundParameters.ContainsKey('ServicesList')) {
                        if ($PSBoundParameters.ContainsKey('LocalProcessesList')) {
                            $ruleReview.RuleInfoLocalProcessesList = $PSBoundParameters['LocalProcessesList']
                        }
                        if ($PSBoundParameters.ContainsKey('ServicesList')) {
                            $ruleReview.RuleInfoServicesList = $PSBoundParameters['ServicesList']
                        }
                    }
                    else {
                        $ruleReview.RuleInfoLocalProcessesList = $rule.ItemLocalProcessesList
                        $ruleReview.RuleInfoServicesList = $rule.ItemServicesList
                    }

                    if ($PSBoundParameters.ContainsKey('Name')) {
                        $ruleReview.RuleInfoName = $PSBoundParameters['Name']
                    }
                    else {
                        $ruleReview.RuleInfoName = $rule.ItemName
                    }

                    if ($PSBoundParameters.ContainsKey('PortsList')) {
                        $ruleReview.RuleInfoPortsList = $PSBoundParameters['PortsList']
                    }
                    else {
                        $ruleReview.RuleInfoPortsList = $rule.ItemPortsList
                    }

                    if ($PSBoundParameters.ContainsKey('RemoteEntityIdsList')) {
                        $ruleReview.RuleInfoRemoteEntityIdsList = $PSBoundParameters['RemoteEntityIdsList']
                    }
                    else {
                        $ruleReview.RuleInfoRemoteEntityIdsList = $rule.ItemRemoteEntityIdsList
                    }

                    # rule category is not returned on the rule, only send when provided (server defaults to IT)
                    if ($PSBoundParameters.ContainsKey('RuleCategory')) {
                        $ruleReview.RuleInfoRuleCategory = $PSBoundParameters['RuleCategory']
                    }

                    if ($PSBoundParameters.ContainsKey('SrcUsersList')) {
                        $ruleReview.RuleInfoSrcUsersList = $PSBoundParameters['SrcUsersList']
                    }
                    else {
                        $ruleReview.RuleInfoSrcUsersList = $rule.ItemSrcUsersList
                    }

                    if ($PSBoundParameters.ContainsKey('State')) {
                        $ruleReview.RuleInfoState = $PSBoundParameters['State']
                    }
                    elseif ($rule.ItemState -in 1, 2) {
                        $ruleReview.RuleInfoState = $rule.ItemState
                    }
                    else {
                        $ruleReview.RuleInfoState = 1
                    }

                    foreach ($bodyParam in 'Reason', 'Details', 'ForceReview', 'Action', 'ChangeTicket', 'Description', 'ExcludedLocalIdsList', 'ExpiresAt', 'FirewallId', 'IpSecOpt', 'IsRejectOnLinux', 'LocalEntityId', 'LocalProcessesList', 'Name', 'PortsList', 'RemoteEntityIdsList', 'RuleCategory', 'ServicesList', 'SrcUsersList', 'State') {
                        $null = $PSBoundParameters.Remove($bodyParam)
                    }

                    $null = $PSBoundParameters.Add('Body', $ruleReview)
                    ZeroNetworks.internal\Approve-ZNOutboundRulesReview @PSBoundParameters
                }
            }
        }
        catch {
            throw
        }
    }
}
