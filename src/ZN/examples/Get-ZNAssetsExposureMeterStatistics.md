### Example 1: List exposure meter statistics
```powershell
get-znassetsExposureMeterStatistics | Format-List
```

```output
Date                        : 1779840000000
LateralMovementRiskClients  : 20
LateralMovementRiskServers  : 91
LateralMovementRiskTotal    : 85
MonitoredAssetClients       : 1
MonitoredAssetServers       : 11
MonitoredAssetTotal         : 12
SegmentationCoverageClients : 0
SegmentationCoverageServers : 0
SegmentationCoverageTotal   : 0
SegmentedAssetClients       : 0
SegmentedAssetServers       : 0
SegmentedAssetTotal         : 0

Date                        : 1779907859374
LateralMovementRiskClients  : 20
LateralMovementRiskServers  : 91
LateralMovementRiskTotal    : 85
MonitoredAssetClients       : 1
MonitoredAssetServers       : 11
MonitoredAssetTotal         : 12
SegmentationCoverageClients : 100
SegmentationCoverageServers : 18.18
SegmentationCoverageTotal   : 25
SegmentedAssetClients       : 1
SegmentedAssetServers       : 2
SegmentedAssetTotal         : 3
```

This cmdlet lists exposure meter statistics.

