<#
.Synopsis
Create a in-memory object for K8SIPBlock
.Description
Create a in-memory object for K8SIPBlock

.Outputs
ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SIPBlock
.Link
https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znk8sipblock
#>
function New-ZNK8SIPBlock {
    [OutputType([ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SIPBlock])]
    [CmdletBinding(PositionalBinding = $false)]
    Param(

        [Parameter(Mandatory, HelpMessage = "CIDR range, e.g. 10.0.0.0/16")]
        [string]
        $Cidr,

        [Parameter(HelpMessage = "List of CIDR ranges to exclude from the block")]
        [string[]]
        $ExceptCidrs
    )

    process {
        $Object = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SIPBlock]::New()

        $Object.Cidr = $PSBoundParameters['Cidr']

        if ($PSBoundParameters.ContainsKey('ExceptCidrs')) {
            $Object.ExceptCidrsList = $PSBoundParameters['ExceptCidrs']
        }

        return $Object
    }
}