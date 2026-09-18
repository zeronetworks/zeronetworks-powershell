### Example 1: List K8s Namespace Services
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
$k8snamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8scluster.id -Limit 400).Items | where {$_.Name -eq "kube-system"}
(Get-ZNK8SNamespaceService -K8SNamespaceId $k8snamespace.Id).Items
```

```output
AnnotationsList : 
ClusterId       : k:c:j3PDZgKj
ClusterName     : rke
Id              : k:s:fQW0d0aq
IpsList         : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SServiceIP}
K8SUid          : 3614fcba-c4d5-47a7-addd-ec15b72301c5
LabelsList      : 
Name            : rke2-metrics-server
NamespaceId     : k:n:VLMwpoCy
NamespaceName   : kube-system
PortsList       : {https}
TargetsList     : {rke2-metrics-server}
Type            : 1

AnnotationsList : 
ClusterId       : k:c:j3PDZgKj
ClusterName     : rke
Id              : k:s:LaNe6zVy
IpsList         : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SServiceIP}
K8SUid          : 781e6de8-2f36-420e-b6e3-aa7c9fe279fc
LabelsList      : 
Name            : rke2-ingress-nginx-controller-admission
NamespaceId     : k:n:VLMwpoCy
NamespaceName   : kube-system
PortsList       : {https-webhook}
TargetsList     : {rke2-ingress-nginx-controller}
Type            : 1

AnnotationsList : 
ClusterId       : k:c:j3PDZgKj
ClusterName     : rke
Id              : k:s:UhopPd3l
IpsList         : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SServiceIP}
K8SUid          : e0cdfbd3-34e2-4979-980d-13012a862a4b
LabelsList      : 
Name            : rke2-coredns-rke2-coredns
NamespaceId     : k:n:VLMwpoCy
NamespaceName   : kube-system
PortsList       : {udp-53, tcp-53}
TargetsList     : {rke2-coredns-rke2-coredns}
Type            : 1
```

This cmdlet lists services for a K8s Namespace.
