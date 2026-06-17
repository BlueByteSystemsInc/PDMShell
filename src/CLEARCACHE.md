---
description: Clears the local cache of a folder or many files.
title: CLEARCACHE Command | PDMShell | SOLIDWORKS PDM
---
# CLEARCACHE Command
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
# Clears the cache of all `.sldprt` files in the current directory.

clearcache -directory project -toolboxflag
# Clears the directory called project whiling ignore toolbox files.

clearcache -source "source.csv"
# Clears the cache for the specified source.
```

## Availability
Available since PDMShell 2.0.0 or earlier.
