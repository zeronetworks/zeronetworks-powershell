<#
    .Synopsis
    Create a in-memory object for webhooks trigger
    .Description
    Create a in-memory object for webhooks trigger

    .Outputs
    ZeroNetworks.PowerShell.Cmdlets.Api.Models.settingsWebhookTriggerBody
    
    .Link
    https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znwebhookstrigger
    #>
function New-ZNSettingsWebhooksTrigger {
    [OutputType([ZeroNetworks.PowerShell.Cmdlets.Api.Models.settingsWebhookTriggerBody])]
    [CmdletBinding(PositionalBinding = $false)]
    Param(
    
        [Parameter(Mandatory, HelpMessage = "Webhook Trigger Topic", ParameterSetName = 'Rules')]
        [switch]
        $Rules,

        [Parameter(Mandatory, HelpMessage = "Webhook Trigger Topic", ParameterSetName = 'RulesReview')]
        [switch]
        $RulesReview,

        [Parameter(Mandatory, HelpMessage = "Webhook Trigger Topic", ParameterSetName = 'MFAPolicies')]
        [switch]
        $MFAPolicies,

        [Parameter(Mandatory, HelpMessage = "Resource", ParameterSetName = 'Rules')]
        [ValidateSet("INBOUNDIT", "OUTBOUNDIT", "INBOUNDMFA", "OUTBOUNDMFA", "IDENTITY", "IDENTITYMFA", "RPC", "RPCMFA", "EXTERNALMFA", "INBOUNDAE", "OUTBOUNDAE", "INBOUNDOT", "OUTBOUNDOT")]
        [string]
        $RulesResource,

        [Parameter(HelpMessage = "Event", ParameterSetName = 'Rules')]
        [string[]][ValidateSet("ANY", "CREATED", "EDITED", "EXPIRED", "APPROVED", "SUGGESTIONCREATED", "REJECTED")]
        $RulesTriggerEvent,

        [Parameter(Mandatory, HelpMessage = "Enforcement Source", ParameterSetName = 'RulesReview')]
        [string][ValidateSet("INBOUND", "OUTBOUND", "DELETEDINBOUND", "DELETEDOUTBOUND")]
        $RulesReviewResource,

        [Parameter(HelpMessage = "Event", ParameterSetName = 'RulesReview')]
        [string[]][ValidateSet("ANY", "CREATED", "APPROVED", "REJECTED", "SUGGESTIONCREATED")]
        $RulesReviewTriggerEvent,

        [Parameter(Mandatory, HelpMessage = "Webhook Trigger Topic", ParameterSetName = 'MFAPolicies')]
        [string][ValidateSet("INBOUND", "OUTBOUND", "IDENTITY", "EXTERNAL")]
        $MFAPoliciesResource,

        [Parameter(HelpMessage = "Event", ParameterSetName = 'MFAPolicies')]
        [string[]][ValidateSet("ANY", "CREATED", "EDITED", "DELETED")]
        $MFAPoliciesTriggerEvent,

        [Parameter(HelpMessage = "Enforcement Source")]
        [string[]][ValidateSet("ANY", "MFA", "AUTOMATED", "ACCESSPORTAL", "ADMINPORTAL", "AUTOMATAIONENGINE", "API", "SETUP", "CONNECT", "SYSTEM", "DOWNLOADPORTAL", "EXTERNALACCESSPORTAL", "DAY2AUTOMATION")]
        $EnforcementSource
           

    )

    process {
        $Object = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.settingsWebhookTriggerBody]::New()

        # Set Enforcement Source
        if($PSBoundParameters['EnforcementSource']) {
            $EnforcementSourceList = @()
            foreach ($source in $EnforcementSource) {
                switch ($source) {
                    "ANY" { $EnforcementSourceList += 0 }
                    "MFA" { $EnforcementSourceList += 1 }
                    "AUTOMATED" { $EnforcementSourceList += 2 }
                    "ACCESSPORTAL" { $EnforcementSourceList += 3 }
                    "ADMINPORTAL" { $EnforcementSourceList += 4 }
                    "AUTOMATAIONENGINE" { $EnforcementSourceList += 5 }
                    "API" { $EnforcementSourceList += 6 }
                    "SETUP" { $EnforcementSourceList += 7 }
                    "CONNECT" { $EnforcementSourceList += 8 }
                    "SYSTEM" { $EnforcementSourceList += 9 }
                    "DOWNLOADPORTAL" { $EnforcementSourceList += 10 }
                    "EXTERNALACCESSPORTAL" { $EnforcementSourceList += 11 }
                    "DAY2AUTOMATION" { $EnforcementSourceList += 12 }
                    "default" {
                        $EnforcementSourceList += 0
                    }
                }
            }
        } else {
            $EnforcementSourceList = @(0)
        }


        if($PSCmdlet.ParameterSetName -eq 'Rules') {
            # Set Topic
            $Object.Topic = 1
            $Object.RuleEventConfigEnforcementSourcesList = $EnforcementSourceList
            # Set Resource
            switch ($PSBoundParameters['RulesResource']) {
                "INBOUNDIT" { $Object.RuleEventConfigResource = 1 }
                "OUTBOUNDIT" {$Object.RuleEventConfigResource = 2 }
                "INBOUNDMFA" { $Object.RuleEventConfigResource = 3}
                "OUTBOUNDMFA" { $Object.RuleEventConfigResource = 4 }
                "IDENTITY" { $Object.RuleEventConfigResource = 5 }
                "IDENTITYMFA" { $Object.RuleEventConfigResource = 6 }
                "RPC" { $Object.RuleEventConfigResource = 7 }
                "RPCMFA" { $Object.RuleEventConfigResource = 8 }
                "EXTERNALMFA" { $Object.RuleEventConfigResource = 9 }
                "INBOUNDAE" { $Object.RuleEventConfigResource = 10 }
                "OUTBOUNDAE" { $Object.RuleEventConfigResource = 11 }
                "INBOUNDOT" { $Object.RuleEventConfigResource = 12 }
                "OUTBOUNDOT" { $Object.RuleEventConfigResource = 13 }
                "default" {
                    throw "Invalid Resource value. Allowed values are: INBOUNDIT, OUTBOUNDIT, INBOUNDMFA, OUTBOUNDMFA, IDENTITY, IDENTITYMFA, RPC, RPCMFA, EXTERNALMFA, INBOUNDAE, OUTBOUNDAE, INBOUNDOT, OUTBOUNDOT."
                }
            }
            # Set Events
            if ($PSBoundParameters['RulesTriggerEvent']) {
                $TriggerEventList = @()
                foreach ($triggerEvent in $RulesTriggerEvent) {
                    switch ($triggerEvent) {
                        "ANY" { $TriggerEventList += 1 }
                        "CREATED" { $TriggerEventList += 2 }
                        "EDITED" {  $TriggerEventList += 3 }
                        "DELETED" { $TriggerEventList += 4 }
                        "EXPIRED" { $TriggerEventList += 5 }
                        "APPROVED" { $TriggerEventList += 6 }
                        "SUGGESTIONCREATED" { $TriggerEventList += 7 }
                        "REJECTED" { $TriggerEventList += 8 }
                        "default" { $TriggerEventList += 1 }
                    }
                }
                $Object.RuleEventConfigEventList = $TriggerEventList
            } else {
                # if not provided means any
                $Object.RuleEventConfigEventList = @(1)
            }

        } elseif ($PSCmdlet.ParameterSetName -eq 'RulesReview') {
            # Set Topic
            $Object.Topic = 2
            $Object.RuleReviewEventConfigEnforcementSourcesList = $EnforcementSourceList
            #Set Resource
            switch ($PSBoundParameters['RulesReviewResource']) {
                "INBOUND" { $Object.RuleReviewEventConfigResource = 1 }
                "OUTBOUND" { $Object.RuleReviewEventConfigResource = 2 }
                "DELETEDINBOUND" { $Object.RuleReviewEventConfigResource = 3 }
                "DELETEDOUTBOUND" { $Object.RuleReviewEventConfigResource = 4 }
                Default {
                    throw "Invalid Resource value. Allowed values are: INBOUND, OUTBOUND, DELETEDINBOUND, DELETEDOUTBOUND."
                }
            }
            # Set Events
            if ($PSBoundParameters['RulesReviewTriggerEvent']) {
                $RulesReviewTriggerEventList = @()
                foreach ($triggerEvent in $RulesReviewTriggerEvent) {
                    switch ($triggerEvent) {
                        "ANY" { $RulesReviewTriggerEventList += 1 }
                        "CREATED" { $RulesReviewTriggerEventList += 2 }
                        "APPROVED" { $RulesReviewTriggerEventList += 6 }
                        "REJECTED" { $RulesReviewTriggerEventList += 8 }
                        "SUGGESTIONCREATED" { $RulesReviewTriggerEventList += 7 }
                        Default {
                            $RulesReviewTriggerEventList += 1
                        }
                    }
                }
                $Object.RuleReviewEventConfigEventList = $RulesReviewTriggerEventList
            } else {
                # if not provided means any
                $Object.RuleReviewEventConfigEventList = @(1)
            }
        } elseif ($PSCmdlet.ParameterSetName -eq 'MFAPolicies') {
            # Set Topic
            $Object.Topic = 3
            $Object.ReactivePolicyEventConfigEnforcementSourcesList = $EnforcementSourceList
            # Set Resource
            switch ($PSBoundParameters['MFAPoliciesResource']) {
                "INBOUND" { $Object.ReactivePolicyEventConfigResource = 1 }
                "OUTBOUND" { $Object.ReactivePolicyEventConfigResource = 2 }
                "IDENTITY" { $Object.ReactivePolicyEventConfigResource = 3 }
                "EXTERNAL" { $Object.ReactivePolicyEventConfigResource = 4 }
                Default {}
            }
            #Set Events
            if ($PSBoundParameters['MFAPoliciesTriggerEvent']) {
                $MFAPoliciesTriggerEventList = @()
                foreach ($triggerEvent in $MFAPoliciesTriggerEvent) {
                    switch ($triggerEvent) {
                        "ANY" { $MFAPoliciesTriggerEventList += 1 }
                        "CREATED" { $MFAPoliciesTriggerEventList += 2 }
                        "EDITED" { $MFAPoliciesTriggerEventList += 3 }
                        "DELETED" { $MFAPoliciesTriggerEventList += 4 }
                        Default {
                            $MFAPoliciesTriggerEventList += 1
                        }
                    }
                }
                $Object.ReactivePolicyEventConfigEventList = $MFAPoliciesTriggerEventList
            } else {
                # if not provided means any
                $Object.ReactivePolicyEventConfigEventList = @(1)
            }
        }

        

        return $Object
    }
}
    
