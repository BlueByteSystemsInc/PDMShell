---
description: Runs a PDM task on one file or files found by search.
title: runtask Command | PDMShell | SOLIDWORKS PDM
---
# runtask
## Description
The `runtask` command allows you to execute a PDM task on a specific file or via search in the PDM vault. 

## Syntax

```text
runtask -taskName -filePath -search -recursive
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-taskName` | Yes | Task name. This can be found in under Tasks in the Administration tool. |
| `-filePath` | Yes | Path to the affected file. |
| `-search` | No | Optional. Search query to find files to run the task on. |
| `-recursive` | No | Optional. If set, search will include subfolders. |

### Parameter Details

The command requires the following parameters:


- `taskName`: Task name. This can be found in under Tasks in the Administration tool.
- `filePath`: Path to the affected file.
- `search`: (Optional) Search query to find files to run the task on.
- `recursive`: (Optional) If set, search will include subfolders.

## Examples
```bash
# runtask
 taskrun -TaskName "PrintPDF" -filePath "Assembly.sldasm"  
 ```

## Availability
Available since PDMShell 2.0.33.
