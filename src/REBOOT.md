---
description: Restarts the PDMShell session.
title: REBOOT Command Documentation | PDMShell | SOLIDWORKS PDM
---
# REBOOT Command Documentation

## DESCRIPTION:
The `reboot` command restarts the PDMShell session.

## SYNTAX:
```bash
reboot -pdmaddins
```
## PARAMETERS:
- `pdmaddins`: Targets SOLIDWORKS PDM add-ins during the reboot operation.

## EXAMPLES:
```bash
reboot
```
## REMARKS:
- This command uses `taskkill` from the command prompt to kill `explorer.exe` and `edmserver.exe` then restart `explorer.exe`.
- It requires PDM to be run as an administrator.
