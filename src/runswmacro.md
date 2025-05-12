---
description: Execute a SOLIDWORKS macro on a specific file or on multiple files found via search in the PDM vault.
title: RUNSWMACRO Command Documentation | PDMShell | SOLIDWORKS PDM
---
# RUNSWMACRO Command Documentation

## DESCRIPTION:

The `RunSWMacro` command allows you to execute a SOLIDWORKS macro on a specific file or on multiple files found via search in the PDM vault. This is useful for automating repetitive tasks or applying custom logic to many files.


## SYNTAX:

```bash
runswmacro -filePath -search -recursive
```

## PARAMETERS:

The command requires the following parameters:

- `filePath`: Path to the SOLIDWORKS macro file (`.swp` or `.swb`). This is required.
- `search`: (Optional) Search query to find files to run the macro on.
- `recursive`: (Optional) If set, search will include subfolders.

## REMARKS:

>[!WARNING]
> Please read the remarks below to properly call your macro.

- The macro procedure name must be called `main`.
- The macro module name must be called the file name of the macro appended by `1`. Example: If the macro called `print.swp` the module name must be called `print1`.

## EXAMPLE:

```bash
# run batch export macro on all part in the current directory
 runswmacro -filePath "Macros/BatchExport.swp" -search "%.sldprt" 
 ```