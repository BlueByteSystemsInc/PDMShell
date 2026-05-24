---
description: Checks and upgrades SOLIDWORKS PDM file versions, performs reference validation, and optionally exports broken references to CSV.
title: UPGRADEVERSIONFROMSOURCE Command Documentation | PDMShell | SOLIDWORKS PDM
---
# UPGRADEVERSIONFROMSOURCE Command Documentation

## DESCRIPTION:
Checks and upgrades SOLIDWORKS PDM file versions from a CSV source.

## SYNTAX:
```bash
versionupgradefromsource -source -csv -bumprevision -referencescheck
```

## PARAMETERS:
- `source`: CSV source file containing files to process.
- `csv`: CSV file path used to write command results.
- `bumprevision`: Bumps the file revision during the version upgrade operation.
- `referencescheck`: Checks references before running the version upgrade operation.
