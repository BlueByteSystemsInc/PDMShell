---
description: Restarts the PDMShell session.
title: REBOOT Command | PDMShell | SOLIDWORKS PDM
---
# REBOOT Command
## Description
The `reboot` command restarts the PDMShell session.

## Syntax
```bash
reboot -pdmaddins
```
## Parameters
- `pdmaddins`: Targets SOLIDWORKS PDM add-ins during the reboot operation.

## Examples
```bash
reboot
```
## Remarks
- This command uses `taskkill` from the command prompt to kill `explorer.exe` and `edmserver.exe` then restart `explorer.exe`.
- It requires PDM to be run as an administrator.

## Availability
Available since PDMShell 2.0.1.
