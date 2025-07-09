---
description: Execute a PDM task on specific file found or via search in the PDM vault.
title: RUNTASK Command Documentation | PDMShell | SOLIDWORKS PDM
---
# RUNTASK Command Documentation

## DESCRIPTION:

The `RUNTASK` command allows you to execute a PDM task on a specific file or via search in the PDM vault. 

## SYNTAX:

```bash
runtask -taskName -filePath -search -recursive
```

## PARAMETERS:

The command requires the following parameters:


- `taskName`: Task name. This can be found in under Tasks in the Administration tool.
- `filePath`: Path to the affected file.
- `search`: (Optional) Search query to find files to run the macro on.
- `recursive`: (Optional) If set, search will include subfolders.

## EXAMPLE:

```bash
# run PrintPDF task on an assembly
 taskrun -TaskName "PrintPDF" -filePath "Assembly.sldasm"  
 ```