<#
.Synopsis
Create a in-memory object for K8s desired rule for a new policy
.Description
Create a in-memory object for K8s desired rule for a new policy

.Outputs
ZeroNetworks.PowerShell.Cmdlets.Api.Models.DesiredK8SRuleBody
.Link
https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znk8sdesiredrulebody
#>
function New-ZNK8SDesiredRuleBody {
    [OutputType([ZeroNetworks.PowerShell.Cmdlets.Api.Models.DesiredK8SRuleBody])]
    [CmdletBinding(PositionalBinding = $false)]
    Param(

        [Parameter(Mandatory, HelpMessage = "Allow or Block")]
        [ValidateSet("Allow","Block")]
        [string]
        $Action,

        [Parameter(HelpMessage = "Change Ticket associated with this rule")]
        [string]
        $ChangeTicket,

        [Parameter(HelpMessage = "Description of the rule")]
        [string]
        $Description,

        [Parameter(Mandatory, HelpMessage = "Inbound or Outbound")]
        [ValidateSet("Inbound","Outbound")]
        [string]
        $Direction,
        
        [Parameter(Mandatory, HelpMessage = "Name of the namespace to which this rule applies")]
        [string]
        $NamespaceName,

        [Parameter(Mandatory, HelpMessage = "Name of the network policy to which this rule applies")]
        [string]
        $NetworkPolicyName,

        [Parameter(HelpMessage = "Ports and protocols for this rule")]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.IPortsListItem[]]
        $Ports,

        [Parameter(HelpMessage = "Remote peer selectors for this rule")]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SPeerSelector[]]
        $RemotePeerSelectors,

        [Parameter(HelpMessage = "Remote peer selectors for this rule in yaml format")]
        [string]
        $RemotePeerSelectorsYaml
    )

    process {
        $Object = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.DesiredK8SRuleBody]::New()

        if($PSBoundParameters['Action'] -eq "Allow") {
            $Object.Action = 1
        }
        elseif($PSBoundParameters['Action'] -eq "Block") {
            $Object.Action = 2
        }
        

        if($PSBoundParameters.ContainsKey('ChangeTicket')) {
            $Object.ChangeTicket = $ChangeTicket
        }
        else {
            $Object.ChangeTicket = ""
        }

        if($PSBoundParameters.ContainsKey('Description')) {
            $Object.Description = $Description
        }
        else {
            $Object.Description = ""
        }

        if($PSBoundParameters['Direction'] -eq "Inbound") {
            $Object.Direction = 1
        }
        elseif($PSBoundParameters['Direction'] -eq "Outbound") {
            $Object.Direction = 2
        }


        $Object.NamespaceName = $NamespaceName
        $Object.NetworkPolicyName = $NetworkPolicyName
        
        if($PSBoundParameters.ContainsKey('Ports')) {
            $Object.Ports = $Ports
        }
        else {
            $Object.Ports = @()
        }
        
        if($PSBoundParameters.ContainsKey('RemotePeerSelectors')) {
            $Object.RemotePeerSelectors = $RemotePeerSelectors
        }
        else {
            $Object.RemotePeerSelectors = $null
        }

        $Object.RemotePeerSelectors = $RemotePeerSelectors

        if($PSBoundParameters.ContainsKey('RemotePeerSelectorsYaml')) {
            $Object.RemotePeerSelectorsYaml = $RemotePeerSelectorsYaml
        }
        else {
            $Object.RemotePeerSelectorsYaml = $null
        }

        return $Object
    }
}