---
description: Stops a running process by name.
title: kill Command | PDMShell | SOLIDWORKS PDM
---
# kill
## Description
Kills a process.

## Syntax

```text
kill -process
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-process` | Yes | See parameter details below. |
| `-programName` | No | The process to terminate (with extension). |

### Parameter Details

- `programName`: The process to terminate (with extension).

## Examples
```bash
kill sldworks.exe
# kill
```
## Remarks
- This command uses `taskkill` from the command line.
- **This command requires PDM to be run as an administrator**. 
- PDMShell adds a note called `ADMIN` in the top-right area of its window when it is open as admin.

## Availability
Available since PDMShell 2.0.0.
