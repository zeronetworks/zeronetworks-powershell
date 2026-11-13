---
name: release-module
description: Package, remote-sign, and publish the ZeroNetworks PowerShell module to the PowerShell Gallery. Use when the user asks to release, package, sign, or publish a new version of the ZeroNetworks PowerShell module.
---

# Release the ZeroNetworks PowerShell module

This orchestrates the release process the maintainer already does by hand: stage the release
files, upload them to `gs://zn-sign-bucket` for remote Authenticode signing via the
`zeronetworks/ci-cd-actions` GitHub Action, download the signed result, then `Publish-Module` to
the PowerShell Gallery. Reference: the internal wiki page "Manually sign artifacts using Remote
Signing action" (Confluence ENG space) and `zeronetworks/ci-cd-actions/.github/workflows/upload-and-signing.yaml`.

Signing does not require the devcontainer - it only needs `gcloud`/`gsutil`, `gh`, and `pwsh` on
whatever machine this runs on. The devcontainer (`wonderful_raman` or similar) is only where the
module gets built and tested beforehand.

Scripts live in `tools/release/` and are the source of truth for the exact steps - read them
before running if anything here seems to disagree with them.

## Preconditions - check before doing anything else

1. The module must already be built and tested: `src/ZN/bin/ZeroNetworks.private.dll` must exist
   and reflect what's about to ship. If the user hasn't just built it, ask whether to build+test
   now (that still needs the devcontainer toolchain - `pwsh build-module.ps1 -Release -Test`) or
   whether the existing build is already what they want released.
2. Tools on PATH: `dotnet` (not actually needed for this flow, but `pwsh` modules may want it),
   `pwsh`, `gsutil`, `gh`. If `gsutil`/`gcloud` is missing, tell the user to install the Google
   Cloud SDK and stop.
3. `gcloud auth list --filter=status:ACTIVE --format='value(account)'` must return something. If
   empty, tell the user to run `gcloud auth login` and stop - do not try to authenticate for them.
4. `gh auth status` must show an authenticated account with access to `zeronetworks/ci-cd-actions`.
5. Confirm the target version. Default source of truth is `src/ZN/ZeroNetworks.psd1`
   (`ModuleVersion` + `PrivateData.PSData.Prerelease`, e.g. `0.26.100` + `preview` ->
   `0.26.100-preview`). If the user wants a different version than what's in the manifest, that
   manifest needs to be updated first (out of scope for this skill) - don't silently override it.

## Phase 1 - Stage

```pwsh
$stage = pwsh -File tools/release/New-ZNReleaseStage.ps1
```

This copies the curated file set (mirroring `src/ZN/ZeroNetworks.nuspec`) into
`release/<version>/ZeroNetworks/`, independent of the real working tree. Show the user the staged
file listing the script prints. This is the point to sanity-check nothing unexpected is being
shipped (no test files, no `.cs` sources, no stray secrets) before anything leaves the machine.

## Phase 2 - Remote sign

This step uploads real build output to a shared company GCS bucket and kicks off a GitHub Action
in another repo. Low-risk and reversible (it's a scratch signing bucket), but it's an external
action - say what you're about to do in one line before running it; no need to block on
confirmation for this step specifically.

```pwsh
$signed = pwsh -File tools/release/Submit-ZNRemoteSigning.ps1 -StagePath $stage -Version <version>
```

This uploads to `gs://zn-sign-bucket/ZeroNetworks-<version>`, triggers
`upload-and-signing.yaml` on `zeronetworks/ci-cd-actions` with that path, watches the run via
`gh run watch` (several minutes), and downloads the result from
`gs://zn-sign-bucket/signed/ZeroNetworks-<version>` into `release/<version>/signed/`.

If the run fails: check the linked Actions URL the script prints, or the Devops team per the wiki
page. Do not retry signing in a loop without understanding why it failed first.

## Phase 3 - Publish

**This is the irreversible step** - a published PSGallery version can be unlisted but never
deleted or overwritten. Always stop and get explicit confirmation from the user before running the
real publish, even if they asked for the whole pipeline up front. Summarize what's about to be
published (module name, version, where the signed files came from) and wait for a clear go-ahead.

First, a dry run (no API key needed, nothing leaves the machine):

```pwsh
pwsh -File tools/release/Publish-ZNRelease.ps1 -SignedPath $signed -Version <version>
```

This validates the manifest, verifies every shipped script/manifest file actually carries a valid
Authenticode signature (refuses to continue if not - that means the sign step silently skipped
something and needs investigating, not forcing through), and runs `Publish-Module -WhatIf`.

Once the user has confirmed they want to actually publish: never ask them to paste the NuGet API
key in chat, and don't try to pass `-NuGetApiKey $env:ZN_NUGET_API_KEY` from your own shell either -
an env var the user `export`s in their own terminal is NOT visible to commands you run (you execute
in a separate sandboxed process). Have the user run the real publish themselves, in their own
terminal, in whichever shell they set the key in:

```pwsh
pwsh -File tools/release/Publish-ZNRelease.ps1 -SignedPath $signed -Version <version> -Confirm -NuGetApiKey $env:ZN_NUGET_API_KEY
```

The script itself requires typing the version string back as a second confirmation gate before it
calls `Publish-Module` for real. A 403 from the Gallery at this point means the API key is wrong/
stale/wrongly-scoped, not a bug in the script - have them check the key (re-export after
regenerating, or check its package-name scope on the Gallery's key management page) and retry the
same command themselves.

## After publishing

- The script's last step already runs `Update-Module ZeroNetworks -AllowPrerelease` itself (waiting
  for Gallery indexing first, installing instead if the module isn't already present) and verifies
  the installed version matches - confirming the published package is actually installable, not
  just that the upload succeeded. If it reports the new version isn't indexed yet after ~2 minutes,
  it skips this check rather than failing the whole run; re-check manually a bit later with the
  same command.
- Verify at `https://www.powershellgallery.com/packages/ZeroNetworks/<version>`.
- `release/` is gitignored (local build output) - nothing from this process needs to be committed.
- Remind the user any follow-up (bumping to the next dev version, tagging the release in git,
  announcing it) is a separate, explicit step - don't do it automatically.
