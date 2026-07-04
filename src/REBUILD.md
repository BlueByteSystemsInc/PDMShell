---
description: Runs a ghost rebuild for SOLIDWORKS files from a file path or search result.
title: rebuild Command | PDMShell | SOLIDWORKS PDM
---
# rebuild
## Description
Runs a ghost rebuild for SOLIDWORKS files from a file path or search result.

Use this command when you need PDMShell to open matching SOLIDWORKS documents, rebuild them, and save the updated model data back to SOLIDWORKS PDM without manually opening each file.

## Syntax
```bash
rebuild -filePath -search -swversion
```

## Parameters
- `filePath`: File to rebuild.
- `search`: Search query used to find files to rebuild.
- `swversion`: SOLIDWORKS version year to use.

## Availability
Available since PDMShell 2.0.0.

Updated in PDMShell 4.0.21 to describe this workflow as ghost rebuild.
