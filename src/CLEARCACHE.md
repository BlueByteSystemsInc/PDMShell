---
description: Clears the local cache of a folder or many files.
title: clearcache Command | PDMShell | SOLIDWORKS PDM
---
# clearcache
## Description
Clears the local cache of a folder or many files.

## Syntax
```bash
clearcache -directory -search -toolboxflag -source
```

## Parameters
- `Directory`: The directory to clear the local cache of.
- `search`: Search query.
- `toolboxflag`: Ignore toolbox files.
- `source`: CSV files containing complete local file paths to clear. First row is header.

## Examples
```bash
clearcache -search "*.sldprt"
# clearcache

clearcache -directory project -toolboxflag
# clearcache

clearcache -source "source.csv"
# clearcache
```

## Availability
Available since PDMShell 2.0.0.
