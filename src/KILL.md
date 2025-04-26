---
description: Kills a process.
title: KILL Command Documentation | PDMShell | SOLIDWORKS PDM
---
# KILL Command Documentation

## DESCRIPTION:
Kills a process.

## SYNTAX:
```bash
kill -process 
```
## PARAMETERS:
- `process`: The process to terminate (with extension)

## EXAMPLES:
```bash
kill sldworks.exe
# terminates all open SOLIDWORKS sessions.
```
## REMARKS:
- This command uses `taskkill` from the command line.
- **This command requires PDM to be run as an administrator**. 
- PDMShell adds a note called `ADMIN` in the top-right area of its window when it is open as admin.