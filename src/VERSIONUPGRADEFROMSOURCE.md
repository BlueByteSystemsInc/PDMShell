---
description: Upgrades file versions from a CSV source and optionally moves revision values after a PDM upgrade.
title: versionupgradefromsource Command | PDMShell | SOLIDWORKS PDM
---
# versionupgradefromsource
## Description
Checks and upgrades SOLIDWORKS PDM file versions from a CSV source.

## Syntax

```text
versionupgradefromsource -source -csv -bumprevision -referencescheck
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-source` | Yes | CSV source file containing files to process. |
| `-csv` | Yes | CSV file path used to write command results. |
| `-bumprevision` | Yes | Bumps the file revision during the version upgrade operation. |
| `-referencescheck` | Yes | Checks references before running the version upgrade operation. |

### Parameter Details

- `source`: CSV source file containing files to process.
- `csv`: CSV file path used to write command results.
- `bumprevision`: Bumps the file revision during the version upgrade operation.
- `referencescheck`: Checks references before running the version upgrade operation.

## Availability
Available since PDMShell 3.0.13.
