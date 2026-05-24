---
description: Exports the Bill of Materials (BOM) of a SOLIDWORKS assembly to a CSV file.
title: BOM Command Documentation | PDMShell | SOLIDWORKS PDM
---
# BOM Command Documentation

## DESCRIPTION:

The `BOMCommand` allows you to extract a Bill of Materials from a SOLIDWORKS file inside the PDM vault and export it to a CSV file.  
This command supports configuration evaluation using **$configuration**, allows specifying **configNames**, and supports selecting a **layout** from all available BOM layouts.

## SYNTAX:
```bash
bom -filePath -name -directory -search -recursive -configNames -layout
```
## PARAMETERS:

- `filePath`  
  Path to the SOLIDWORKS file whose BOM you want to export.

- `name`  
  The base name for the exported CSV file.  
  Supports evaluation (e.g., `$configuration`).  
  [More information here](EVAL.md).

- `directory`  
  Target folder where the CSV will be saved.


- `search`  
  Search query used to find files in the current directory and run the BOM command on each result.

- `recursive`  
  When used with `search`, includes files in subfolders.

- `configNames`  
  Comma-separated list of configurations to extract the BOM from. If unspecified, all configurations are processed. 
  Example: `@,Default,Manufacturing`.

- `layout`  
  A comma-separated list of BOM layout names to export.  
  Example: `Engineering,Manufacturing`.  
  PDMShell validates layout names against PDM before exporting.

