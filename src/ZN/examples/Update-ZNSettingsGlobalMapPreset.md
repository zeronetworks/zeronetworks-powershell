### Example 1: Update global map settings
```powershell
$mapconfig = Get-ZNSettingsGlobalMapPreset 
Update-ZNSettingsGlobalMapPreset -PresetClient $mapconfig.PresetClient -PresetCloud $mapconfig.PresetCloud -PresetK8S @(,@("app")) -PresetOt $mapconfig.PresetOt -PresetServer $mapconfig.PresetServer
```

```output
PresetClient : {Site Business Unit}
PresetCloud  : {}
PresetK8S    : {App}
PresetOt     : {Site OTType}
PresetServer : {Application Environment}
```

This cmdlet updates the global map settings.
