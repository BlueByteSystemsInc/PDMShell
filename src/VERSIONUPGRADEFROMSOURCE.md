---
description: Upgrades file versions from a CSV source and optionally moves revision values after a PDM upgrade.
title: UPGRADEVERSIONFROMSOURCE Command | PDMShell | SOLIDWORKS PDM
---
# UPGRADEVERSIONFROMSOURCE Command
## Description
Checks and upgrades SOLIDWORKS PDM file versions from a CSV source.

## Syntax
```bash
versionupgradefromsource -source -csv -bumprevision -referencescheck
```

## Parameters
- `source`: CSV source file containing files to process.
- `csv`: CSV file path used to write command results.
- `bumprevision`: Bumps the file revision during the version upgrade operation.
- `referencescheck`: Checks references before running the version upgrade operation.

## Availability
Available since PDMShell 3.0.13.
