---
description: Sets or clears the SOLIDWORKS Toolbox flag on one or more files.
title: TOOLBOX Command | PDMShell | SOLIDWORKS PDM
---
# TOOLBOX Command
## Description
Updates or filters files using the Toolbox flag.

## Syntax
```bash
toolbox -filePath -search -recursive -toolboxflag
```

## Parameters
- `filePath`: File to process.
- `search`: Search query used to find files to process.
- `recursive`: When used with [`search`](SEARCH.md), includes files in subfolders.
- `toolboxflag`: Toolbox flag value to apply or filter by.

## Availability
Available since PDMShell 2.0.17.
