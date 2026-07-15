<#
.Synopsis
Updates a K8s desired rule.
.Description
Updates a K8s desired rule.

.Link
https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znk8sdesiredrule
#>
function Update-ZNK8SDesiredRule {
    [OutputType([ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SDesiredRuleItemResponse])]
    [CmdletBinding(DefaultParameterSetName = 'UpdateExpanded', PositionalBinding = $false, SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param(
        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Path')]
        [System.String]
        # Account Name
        ${AccountName},
        
        [Parameter(ParameterSetName = 'UpdateExpanded', Mandatory)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Path')]
        [System.String]
        # k8s cluster Id
        ${K8SClusterId},
        
        [Parameter(ParameterSetName = 'UpdateExpanded', Mandatory)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Path')]
        [System.String]
        # Rule Id
        ${RuleId},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [string]
        # Change ticket
        ${ChangeTicket},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [string]
        # description
        ${Description},
        
        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.IPortsListItem[]]
        # the destination ports and protocols.
        ${PortsList},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SPeerSelector[]]
        # Remote selectors
        ${RemotePeerSelectors},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String]
        # remote secltors in yaml format
        ${RemotePeerSelectorsYaml},

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
            $ruleId = $PSBoundParameters['RuleId'].ToString()
            $clusterid = $PSBoundParameters['K8SClusterId'].ToString()
            $rule = ZeroNetworks\Get-ZNK8sDesiredRule -RuleId $ruleId -K8sClusterId $clusterid

            $updatedRule = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.DesiredK8sRuleBody]::new()
            
            $updatedRule.Action = $rule.ItemAction
            $updatedRule.ClusterId = $rule.ItemClusterId
            $updatedRule.Direction = $rule.ItemDirection
            $updatedRule.NamespaceName = $rule.NamespaceName
            $updatedRule.NetworkPolicyId = $rule.ItemNetworkPolicyId
            $updatedRule.NetworkPolicyName = $rule.ItemNetworkPolicyName

            if ($PSBoundParameters['ChangeTicket']) {
                $updatedRule.ChangeTicket = $PSBoundParameters['ChangeTicket']
                $null = $PSBoundParameters.Remove('ChangeTicket')
            }
            else {
                $updatedRule.ChangeTicket = $rule.ItemChangeTicket
                $null = $PSBoundParameters.Remove('ChangeTicket')
            }

            if ($PSBoundParameters['Description']) {
                $updatedRule.Description = $PSBoundParameters['Description']
                $null = $PSBoundParameters.Remove('Description')
            }
            else {
                $updatedRule.Description = $rule.ItemDescription
                $null = $PSBoundParameters.Remove('Description')
            }
            
            if ($PSBoundParameters['PortsList']) {
                $updatedRule.Ports = $PSBoundParameters['PortsList']
                $null = $PSBoundParameters.Remove('PortsList')
            }
            else {
                $updatedRule.Ports = $rule.ItemPorts
                $null = $PSBoundParameters.Remove('PortsList')
            }
            
            if ($PSBoundParameters['RemotePeerSelectors'] -and $PSBoundParameters['RemotePeerSelectorsYaml']) {
                throw "Please provide either RemotePeerSelectors or RemotePeerSelectorsYaml, not both."
            }

            if ($PSBoundParameters['RemotePeerSelectors']) {
                $updatedRule.RemotePeerSelectors = $PSBoundParameters['RemotePeerSelectors']
                $null = $PSBoundParameters.Remove('RemotePeerSelectors')
            }
            else {
                $updatedRule.RemotePeerSelectors = $rule.ItemRemotePeerSelectorsList
                $null = $PSBoundParameters.Remove('RemotePeerSelectors')
            }
            
            if ($PSBoundParameters['RemotePeerSelectorsYaml']) {
                $updatedRule.RemotePeerSelectorsYaml = $PSBoundParameters['RemotePeerSelectorsYaml']
                $null = $PSBoundParameters.Remove('RemotePeerSelectorsYaml')
            }

            #Write-Debug $updatedRule | Out-String
            $null = $PSBoundParameters.Add('Body', $updatedRule)
            ZeroNetworks.internal\Update-ZNK8SDesiredRule @PSBoundParameters
        }
        catch {
            throw
        }
    }
}