---
description: Renames SOLIDWORKS files and updates their properties and references.
title: docman Command | PDMShell | SOLIDWORKS PDM
---
# docman
## Description
Exports SOLIDWORKS Document Manager data for files in a directory or search result.

## Syntax
```bash
docman -directory -csv -search -recursive -extensions
```

## Parameters
- `directory`: Directory containing files to process.
- `csv`: CSV file path used for output.
- `search`: Search query used to find matching files.
- `recursive`: When used with [`search`](SEARCH.md), includes files in subfolders.
- `updaterefs`: Reserved parameter for reference update behavior.
- `extensions`: File extensions to include.

## Availability
Available since PDMShell 2.0.16.
