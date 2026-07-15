<#
    .Synopsis
    Create a in-memory object for K8SPeerSelector
    .Description
    Create a in-memory object for K8SPeerSelector. At least one of NamespaceSelector, PodSelector, or IPBlock must be provided.

    .Outputs
    ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SPeerSelector
    .Link
    https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znk8speerselector
    #>
function New-ZNK8SPeerSelector {
    [OutputType([ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SPeerSelector])]
    [CmdletBinding(PositionalBinding = $false)]
    Param(

        [Parameter(HelpMessage = "Namespace selector, use New-ZNK8SSelector to create")]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SSelector]
        $NamespaceSelector,

        [Parameter(HelpMessage = "Pod selector, use New-ZNK8SSelector to create")]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SSelector]
        $PodSelector,

        [Parameter(HelpMessage = "IP block, use New-ZNK8SIPBlock to create")]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SIPBlock]
        $IPBlock
    )

    process {
        if (-not ($PSBoundParameters.ContainsKey('NamespaceSelector') -or $PSBoundParameters.ContainsKey('PodSelector') -or $PSBoundParameters.ContainsKey('IPBlock'))) {
            throw "At least one of NamespaceSelector, PodSelector, or IPBlock must be provided."
        }

        $Object = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SPeerSelector]::New()

        if ($PSBoundParameters.ContainsKey('NamespaceSelector')) {
            $Object.NamespaceSelectorMatchLabelsMap = $PSBoundParameters['NamespaceSelector'].MatchLabelsMap
            $object.NamespaceSelectorMatchExpressionsList = $PSBoundParameters['NamespaceSelector'].MatchExpressionsList
        }

        if ($PSBoundParameters.ContainsKey('PodSelector')) {
            $Object.PodSelectorMatchLabelsMap = $PSBoundParameters['PodSelector'].MatchLabelsMap
            $Object.PodSelectorMatchExpressionsList = $PSBoundParameters['PodSelector'].MatchExpressionsList
        }

        if ($PSBoundParameters.ContainsKey('IPBlock')) {
            $Object.IPBlockCidr = $PSBoundParameters['IPBlock'].Cidr
            $Object.IPBlockExceptCidrsList = $PSBoundParameters['IPBlock'].ExceptCidrsList
        }

        return $Object
    }
}