---
description: Runs a PDM task on one file or files found by search.
title: RUNTASK Command | PDMShell | SOLIDWORKS PDM
---
# RUNTASK Command
## Description
The `runtask` command allows you to execute a PDM task on a specific file or via search in the PDM vault. 

## Syntax
```bash
runtask -taskName -filePath -search -recursive
```

## Parameters
The command requires the following parameters:


- `taskName`: Task name. This can be found in under Tasks in the Administration tool.
- `filePath`: Path to the affected file.
- `search`: (Optional) Search query to find files to run the macro on.
- `recursive`: (Optional) If set, search will include subfolders.

## Examples
```bash
# run PrintPDF task on an assembly
 taskrun -TaskName "PrintPDF" -filePath "Assembly.sldasm"  
 ```

## Availability
Available since PDMShell 2.0.33.
