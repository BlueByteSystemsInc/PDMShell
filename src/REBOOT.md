---
description: Hard PDM reboot.
title: REBOOT Command Documentation | PDMShell | SOLIDWORKS PDM
---
# REBOOT Command Documentation

## DESCRIPTION:
Hard PDM reboot.

## SYNTAX:
```bash
reboot
```
## PARAMETERS:
This command has no parameters.

## EXAMPLES:
```bash
reboot
```
## REMARKS:
- This command uses `taskkill` from the command prompt to kill `explorer.exe` and `edmserver.exe` then restart `explorer.exe`.
- It requires PDM to be run as an administrator.