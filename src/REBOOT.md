# REBOOT Command Documentation

## DESCRIPTION:
Hard PDM reboot.

## SYNTAX:
reboot

## PARAMETERS:
None

## EXAMPLES:
reboot

## REMARKS:
- This command uses `taskkill` from the command prompt to kill `explorer.exe` and `edmserver.exe` then restart `explorer.exe`.
- It requires PDM to be run as an administrator.