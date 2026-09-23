<#
.Synopsis
Reject a "pending review" rule
.Description
Reject a "pending review" rule

.Link
https://github.com/zeronetworks/zero-powershell/zeronetworks/Deny-ZNInboundRuleReview
#>
function Deny-ZNInboundRuleReview {
    [OutputType([ZeroNetworks.PowerShell.Cmdlets.Api.Models.Any])]
    [CmdletBinding(DefaultParameterSetName = 'DenyExpanded', PositionalBinding = $false, SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param(
        [Parameter(ParameterSetName = 'DenyExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Path')]
        [System.String]
        # Account Name
        ${AccountName},
        
        [Parameter(ParameterSetName = 'DenyExpanded', Mandatory)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Path')]
        [System.String]
        # rule Id
        ${RuleId},

        [Parameter(ParameterSetName = 'DenyExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String]
        # Comments
        ${Details},
        
        [Parameter(ParameterSetName = 'DenyExpanded', Mandatory)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ValidateSet('HumanTrafficCoveredByMFA', 'TightenRuleScope', 'MissingPortOrProcess', 'AffectedEntitiesContainedInAnExisitingGroup', 'RedundantRule', 'TrafficShouldBeBlocked', 'Other')]
        # Review Reason int32
        ${Reason},

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
            #Handle Get

            if ($PSBoundParameters['Reason']) {
                if ($PSBoundParameters['Reason'] -eq 'Other') {
                    if (!$PSBoundParameters['Details']) {
                        Write-Error "You must provide Details if Reason is Other"
                    }
                }
                switch ($PSBoundParameters['Reason']) {
                    'HumanTrafficCoveredByMFA' { $intReason = 1 }
                    'TightenRuleScope' { $intReason = 2 }
                    'MissingPortOrProcess' { $intReason = 3 }
                    'AffectedEntitiesContainedInAnExisitingGroup' { $intReason = 4 }
                    'RedundantRule' { $intReason = 5 }
                    'TrafficShouldBeBlocked' { $intReason = 6 }
                    "Other" { $intReason = 7 }
                }
                $PSBoundParameters['Reason'] = $intReason
            }

            ZeroNetworks.internal\Deny-ZNInboundRulesReview @PSBoundParameters
        }
        catch {
            throw
        }
    }
}