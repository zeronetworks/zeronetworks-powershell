# zero-powershell

AutoRest-generated PowerShell module (`src/ZN`) for the Zero Networks API.

## Build

`./tools/BuildModuleWithAutorest.sh` from the repo root (autorest takes ~20 min on the full spec).
Output lands in `src/ZN/bin/`; the script fails if `bin/ZeroNetworks.private.dll` isn't produced.

## Never hand-edit the OpenAPI spec files

`src/openapi.yaml` and `src/openapi-flattened.yaml` are gitignored and `openapi-flattened.yaml`
is regenerated from `openapi.yaml` on every build. Edits there are lost on the next build and never
reach other machines (this is how the `StaleConflictError` CS0535 fix got lost after 0.26.100).
Put spec fixes in a tracked place instead:

- property/schema renames (`x-ms-client-name` etc.): `CLIENT_NAME_OVERRIDES` in
  `tools/flatten-anyof-schemas.py`
- cmdlet/parameter renames, hide/remove: `directive:` in `src/ZN/README.md`

Before committing a codegen fix, check `git status` shows the file that actually carries it.

## Releasing

Use the `release-module` skill (`.claude/skills/release-module/SKILL.md`, scripts in
`tools/release/`). The shipped `bin/` must contain every dependency DLL (Hyak.Common,
Newtonsoft.Json, Microsoft.CSharp, System.Threading, System.Management.Automation), not just
`ZeroNetworks.private.dll`. 0.26.100-preview shipped without them and was broken.
