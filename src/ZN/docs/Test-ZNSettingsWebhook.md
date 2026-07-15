---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/test-znsettingswebhook
schema: 2.0.0
---

# Test-ZNSettingsWebhook

## SYNOPSIS
Test Webhooks settings

## SYNTAX

### TestExpanded (Default)
```
Test-ZNSettingsWebhook [-AccountName <String>] [-AuthType <Int32>] [-Description <String>] [-IsEnabled]
 [-Name <String>] [-Url <String>] [-ValidateCertificate] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### Test
```
Test-ZNSettingsWebhook -Body <ISettingsWebhookTestBody> [-AccountName <String>] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

### Test1
```
Test-ZNSettingsWebhook -WebhookId <String> -Body <ISettingsWebhookTestBody> [-AccountName <String>] [-Confirm]
 [-WhatIf] [<CommonParameters>]
```

### TestExpanded1
```
Test-ZNSettingsWebhook -WebhookId <String> [-AccountName <String>] [-AuthType <Int32>] [-Description <String>]
 [-IsEnabled] [-Name <String>] [-Url <String>] [-ValidateCertificate] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

### TestViaIdentity
```
Test-ZNSettingsWebhook -InputObject <IApiIdentity> -Body <ISettingsWebhookTestBody> [-AccountName <String>]
 [-Confirm] [-WhatIf] [<CommonParameters>]
```

### TestViaIdentityExpanded
```
Test-ZNSettingsWebhook -InputObject <IApiIdentity> [-AccountName <String>] [-AuthType <Int32>]
 [-Description <String>] [-IsEnabled] [-Name <String>] [-Url <String>] [-ValidateCertificate] [-Confirm]
 [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Test Webhooks settings

## EXAMPLES

### Example 1: Test a webhook
```powershell
Test-ZNSettingsWebhook -WebhookId e:w:C0uUcJSV
```

```output
ConnectionStateErrorMessage
---------------------------                                                                                                
failed to send data to index, expectedCode: 200, actualCode: 404, body: <html><head><title>Not Found</title></head><body>4
```

This cmdlet tests a webhook and returns success or error data.

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

### -AuthType
.

```yaml
Type: System.Int32
Parameter Sets: TestExpanded, TestExpanded1, TestViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Body
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsWebhookTestBody
Parameter Sets: Test, Test1, TestViaIdentity
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Description
.

```yaml
Type: System.String
Parameter Sets: TestExpanded, TestExpanded1, TestViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Identity Parameter

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IApiIdentity
Parameter Sets: TestViaIdentity, TestViaIdentityExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IsEnabled
.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: TestExpanded, TestExpanded1, TestViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
.

```yaml
Type: System.String
Parameter Sets: TestExpanded, TestExpanded1, TestViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Url
.

```yaml
Type: System.String
Parameter Sets: TestExpanded, TestExpanded1, TestViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ValidateCertificate
.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: TestExpanded, TestExpanded1, TestViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WebhookId
webhookId to filter on

```yaml
Type: System.String
Parameter Sets: Test1, TestExpanded1
Aliases:

Required: True
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IApiIdentity

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsWebhookTestBody

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsWebhookTestResponse

## NOTES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


`BODY <ISettingsWebhookTestBody>`: .
  - `AuthType <Int32>`: 
  - `IsEnabled <Boolean>`: 
  - `Name <String>`: 
  - `Url <String>`: 
  - `ValidateCertificate <Boolean>`: 
  - `[Description <String>]`: 

`INPUTOBJECT <IApiIdentity>`: Identity Parameter
  - `[ActivityType <String>]`: the activity type
  - `[ApplicationName <String>]`: application name to filter on
  - `[AssetId <String>]`: assetId to filter on
  - `[ClientId <String>]`: clientId to filter on
  - `[ConnectServerId <String>]`: connect server id
  - `[CustomUserId <String>]`: id of the customer user
  - `[DeploymentsClusterId <String>]`: 
  - `[DomainId <String>]`: The fqdn of the domain
  - `[Dvplatform <String>]`: platform
  - `[EntityId <String>]`: The id of the user or group
  - `[ExportId <String>]`: exportId to download
  - `[ExternalId <String>]`: The external id of the group
  - `[FieldName <String>]`: The field name to filter on
  - `[FilterId <String>]`: The saved filter id
  - `[FirewallId <String>]`: firewall id
  - `[ForestId <String>]`: The forest id
  - `[FreezePeriodId <String>]`: id of freeze period
  - `[GroupId <String>]`: groupId to filter on
  - `[GroupOrAssetId <String>]`: group or asset id to filter on
  - `[GroupOrUserId <String>]`: group or user id to filter on
  - `[GroupType <String>]`: group type to filter on
  - `[HypervisorId <String>]`: 
  - `[IPAliasId <String>]`: IP Alias ID
  - `[IdentityProviderId <String>]`: Identity provider Id
  - `[K8SClusterId <String>]`: cluserId to filter on
  - `[K8SNamespaceId <String>]`: id of the K8s namespace
  - `[K8SNodeId <String>]`: nodeId to filter on
  - `[K8SWorkloadId <String>]`: id of the K8s workload
  - `[Label <String>]`: id of the K8s namespace
  - `[LabelId <String>]`: The label id
  - `[LicenseType <String>]`: The license type
  - `[MaintenanceWindowId <String>]`: id of the maintence window
  - `[NamespaceId <String>]`: K8s namespace id identifying the namespace.
  - `[OSType <String>]`: OS type for pilot group
  - `[PolicyId <String>]`: id of the external acess policy
  - `[PostureCheckType <String>]`: posture check type
  - `[Product <String>]`: Product type for which to modify or fetch the version maintenance window
  - `[ProfileId <String>]`: The Linux profile id
  - `[ProtectionPolicyId <String>]`: The id of the onboarding policy
  - `[PushIdentityProviderId <String>]`: Push Identity provider Id
  - `[ReactivePolicyId <String>]`: The id of the MFA policy
  - `[ReceiverType <String>]`: receiver type
  - `[RegionId <String>]`: connect region id
  - `[ResourceGroupId <String>]`: Azure Resource Group ID
  - `[RoleEntityId <String>]`: The id of the user or group
  - `[RuleId <String>]`: The id of the rule
  - `[SessionId <String>]`: The id of the session
  - `[SiemEventType <String>]`: siem event type for the query
  - `[SubscriptionId <String>]`: Azure Subscription ID
  - `[SwitchId <String>]`: switch to delete
  - `[TenantId <String>]`: Azure Tenant ID
  - `[UserAccessConfigId <String>]`: userAccessConfigId to filter on
  - `[UserId <String>]`: userId to filter on
  - `[WebhookId <String>]`: webhookId to filter on
  - `[WidgetId <String>]`: The id of the widget

## RELATED LINKS

