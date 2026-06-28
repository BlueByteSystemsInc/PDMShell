---
description: Exports one file or multiple files found by search to the specified formats.
title: EXPORT Command | PDMShell | SOLIDWORKS PDM
---
# EXPORT Command
## Description
The `ExportCommand` allows you to export SOLIDWORKS files from the PDM vault to various formats using SOLIDWORKS. This command supports exporting a single file or multiple files found via search, with options for specifying file extensions, export location, and more.


## Syntax
```bash
export [-search|-filePath] -name -directory -extensions -recursive -version
```
## Parameters
The export command requires several parameters:

- `filePath`: Path to the file to export (relative or absolute).
- `name`: The base name for the exported file(s). This supports evaluation. More [information here](/src/EVAL.html).
- `directory`: The target folder for exported files.
- `extensions`: Comma-separated list of file extensions to export to (e.g., `pdf,dxf`).
- `search`: Search query to find files for export.
- `recursive`: If set, search will include subfolders.
- `timeout`: timeout in seconds (for starting SOLIDWORKS only)
- `version`: SOLIDWORKS year version. Example 2023. Default is latest.

## Examples
Export a file to PDF and DXF in a specific directory using SOLIDWORKS 2023:

```bash
export -filePath"Designs/part1.sldprt" -name "part1_export" -directory "Exports" -extensions "pdf,dxf" -version 2023
```

## Availability
Available since PDMShell 2.0.0.
