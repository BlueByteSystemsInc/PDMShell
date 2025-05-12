---
description: Exports a specified SOLIDWORKS file or many SOLIDWORKS files the specified extensions.
title: EXPORT Command Documentation | PDMShell | SOLIDWORKS PDM
---
# EXPORT Command Documentation

## DESCRIPTION:

The `ExportCommand` allows you to export SOLIDWORKS files from the PDM vault to various formats using SOLIDWORKS. This command supports exporting a single file or multiple files found via search, with options for specifying file extensions, export location, and more.


## SYNTAX:

```bash
export [-search|-filePath] -name -directory -extensions -recursive 
```
## PARAMETERS:

The export command requires several parameters:

- `filePath`: Path to the file to export (relative or absolute).
- `name`: The base name for the exported file(s). This supports evaluation. More [information here](/src/EVAL.html).
- `directory`: The target folder for exported files.
- `extensions`: Comma-separated list of file extensions to export to (e.g., `pdf,dxf`).
- `search`: Search query to find files for export.
- `recursive`: If set, search will include subfolders.

## EXAMPLE:

Export a file to PDF and DXF in a specific directory:

```bash
export -filePath"Designs/part1.sldprt" -name "part1_export" -directory "Exports" -extensions "pdf,dxf"