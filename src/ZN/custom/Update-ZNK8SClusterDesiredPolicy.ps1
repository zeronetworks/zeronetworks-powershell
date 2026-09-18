<#
.Synopsis
Updates a K8s desired policy.
.Description
Updates a K8s desired policy.

.Link
https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znk8sclusterdesiredpolicy
#>
function Update-ZNK8SClusterDesiredPolicy {
    [OutputType([ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SDesiredPolicyItemResponse])]
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
        # Policy Id
        ${PolicyId},

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
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.DesiredK8sRuleBody[]]
        # Desired rules
        ${DesiredRules},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [switch]
        # Is egress policy
        ${IsEgressPolicy},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [switch]
        # Is ingress policy
        ${IsIngressPolicy},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SMatchExpression[]]
        # Pod selector match labels
        ${LocalPodSelectorMatchExpressionsList},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [string[]]
        # Pod selector match labels map
        ${LocalPodSelectorMatchLabelsMap},
        
        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [string]
        # Local pod selector in YAML format
        ${LocalPodSelectorYaml},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [string]
        # Policy name
        ${Name},
        
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
            $policyId = $PSBoundParameters['PolicyId'].ToString()
            $clusterid = $PSBoundParameters['K8SClusterId'].ToString()
            $policy = (ZeroNetworks\Get-ZNK8SClusterNetworkPolicy -K8SClusterId $K8SClusterId -Limit 400).Items | where-object {$_.Id -eq $policyId}

            $updatedPolicy = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.desiredK8sNetworkPolicyBody]::new()
            

            if ($PSBoundParameters['ChangeTicket']) {
                $updatedPolicy.ChangeTicket = $PSBoundParameters['ChangeTicket']
                $null = $PSBoundParameters.Remove('ChangeTicket')
            }
            else {
                $updatedPolicy.ChangeTicket = $policy.ChangeTicket
                $null = $PSBoundParameters.Remove('ChangeTicket')
            }

            if ($PSBoundParameters['Description']) {
                $updatedPolicy.Description = $PSBoundParameters['Description']
                $null = $PSBoundParameters.Remove('Description')
            }
            else {
                $updatedPolicy.Description = $policy.Description
                $null = $PSBoundParameters.Remove('Description')
            }
            
            if ($PSBoundParameters['DesiredRules']) {
                $updatedPolicy.DesiredRules = $PSBoundParameters['DesiredRules']
                $null = $PSBoundParameters.Remove('DesiredRules')
            }
            else {
                $updatedPolicy.DesiredRules = $policy.DesiredRules
                $null = $PSBoundParameters.Remove('DesiredRules')
            }

            if ($PSBoundParameters['IsEgressPolicy']) {
                $updatedPolicy.IsEgressPolicy = $PSBoundParameters['IsEgressPolicy']
                $null = $PSBoundParameters.Remove('IsEgressPolicy')
            }
            else {
                $updatedPolicy.IsEgressPolicy = $policy.IsEgressPolicy
                $null = $PSBoundParameters.Remove('IsEgressPolicy')
            }

            if ($PSBoundParameters['IsIngressPolicy']) {
                $updatedPolicy.IsIngressPolicy = $PSBoundParameters['IsIngressPolicy']
                $null = $PSBoundParameters.Remove('IsIngressPolicy')
            }
            else {
                $updatedPolicy.IsIngressPolicy = $policy.IsIngressPolicy
                $null = $PSBoundParameters.Remove('IsIngressPolicy')
            }
            
            if ($PSBoundParameters['LocalPodSelectorMatchExpressionsList'] -and $PSBoundParameters['LocalPodSelectorYaml']) {
                throw "Please provide either LocalPodSelectorMatchExpressionsList or LocalPodSelectorYaml, not both."
            }

            if ($PSBoundParameters['LocalPodSelectorMatchLabelsMap'] -and $PSBoundParameters['LocalPodSelectorYaml']) {
                throw "Please provide either LocalPodSelectorMatchLabelsMap or LocalPodSelectorYaml, not both."
            }

            if ($PSBoundParameters['LocalPodSelectorMatchExpressionsList']) {
                $updatedPolicy.LocalPodSelectorMatchExpressionsList = $PSBoundParameters['LocalPodSelectorMatchExpressionsList']
                $null = $PSBoundParameters.Remove('LocalPodSelectorMatchExpressionsList')
            }
            else {
                $updatedPolicy.LocalPodSelectorMatchExpressionsList = ($policy.SelectorString | ConvertFrom-Json).matchlabelsexpressions
                $null = $PSBoundParameters.Remove('LocalPodSelectorMatchExpressionsList')
            }
            
            if ($PSBoundParameters['LocalPodSelectorMatchLabelsMap']) {
                $updatedPolicy.LocalPodSelectorMatchLabelsMap = $PSBoundParameters['LocalPodSelectorMatchLabelsMap']
                $null = $PSBoundParameters.Remove('LocalPodSelectorMatchLabelsMap')
            } else {
                $matchLabelsMap = @()
                if (-not [string]::IsNullOrWhiteSpace($policy.SelectorString)) {
                    $parsedSelector = $policy.SelectorString | ConvertFrom-Json   # succeeds, produces empty PSCustomObject
                    if ($parsedSelector.matchLabels) {                            # $null -> falsy, block skipped
                        $parsedSelector.matchLabels.PSObject.Properties | ForEach-Object {
                            $matchLabelsMap += , @($_.Name, $_.Value)
                        }
                    }
                }
                $updatedPolicy.LocalPodSelectorMatchLabelsMap = $matchLabelsMap
                $null = $PSBoundParameters.Remove('LocalPodSelectorMatchLabelsMap')
            }

            if ($PSBoundParameters['LocalPodSelectorYaml']) {
                $updatedPolicy.LocalPodSelectorYaml = $PSBoundParameters['LocalPodSelectorYaml']
                $null = $PSBoundParameters.Remove('LocalPodSelectorYaml')
            }

            if ($PSBoundParameters['Name']) {
                $updatedPolicy.Name = $PSBoundParameters['Name']
                $null = $PSBoundParameters.Remove('Name')
            }
            else {
                $updatedPolicy.Name = $policy.Name
                $null = $PSBoundParameters.Remove('Name')
            }

            $updatedPolicy.NamespaceName = $policy.NamespaceName

            #$updatedPolicy | convertto-json -depth 10 | write-debug
            #$PSBoundParameters| ConvertTo-Json | write-debug
            $null = $PSBoundParameters.Add('Body', $updatedPolicy)
            ZeroNetworks.internal\Update-ZNK8SClusterDesiredPolicy @PSBoundParameters
        }
        catch {
            throw
        }
    }
}