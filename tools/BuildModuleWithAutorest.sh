python3 tools/flatten-anyof-schemas.py
redocly bundle src/openapi-flattened.yaml -o src/openapi-flattened.yaml

rm -rf src/ZN/obj/
cd src/ZN
autorest
dotnet add ZeroNetworks.csproj package Newtonsoft.Json
dotnet add ZeroNetworks.csproj package Hyak.Common

pwsh build-module.ps1

cd ../../
rm -rf zeronetworks/
cp -R src/ZN/docs/ zeronetworks/
