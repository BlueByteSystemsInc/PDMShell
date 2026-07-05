---
description: Exports one file or multiple files found by search to the specified formats.
title: export Command | PDMShell | SOLIDWORKS PDM
---
# export
## Description
The `export` command allows you to export SOLIDWORKS files from the PDM vault to various formats using SOLIDWORKS. This command supports exporting a single file or multiple files found via search, with options for specifying file extensions, export location, and more.


## Syntax

```text
export [-search|-filePath] -name -directory -extensions -recursive -version
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-search` | No | Search query to find files for export. |
| `-filePath` | No | Path to the file to export (relative or absolute). |
| `-name` | Mode-dependent | The base name for the exported file(s). This supports evaluation. More [information here](/src/EVAL.html). |
| `-directory` | Mode-dependent | The target folder for exported files. |
| `-extensions` | Mode-dependent | Comma-separated list of file extensions to export to (e.g., `pdf,dxf`). |
| `-recursive` | Mode-dependent | If set, search will include subfolders. |
| `-version` | Mode-dependent | SOLIDWORKS year version. Example 2023. Default is latest. |
| `-timeout` | No | timeout in seconds (for starting SOLIDWORKS only) |

### Parameter Details

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
