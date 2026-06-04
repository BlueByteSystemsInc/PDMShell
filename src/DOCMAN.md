---
description: Renames SOLIDWORKS files and updates their properties and references.
title: DOCMAN Command Documentation | PDMShell | SOLIDWORKS PDM
---
# DOCMAN Command Documentation

## DESCRIPTION:
Exports SOLIDWORKS Document Manager data for files in a directory or search result.

## SYNTAX:
```bash
docman -directory -csv -search -recursive -extensions
```

## PARAMETERS:
- `directory`: Directory containing files to process.
- `csv`: CSV file path used for output.
- `search`: Search query used to find matching files.
- `recursive`: When used with `search`, includes files in subfolders.
- `updaterefs`: Reserved parameter for reference update behavior.
- `extensions`: File extensions to include.
