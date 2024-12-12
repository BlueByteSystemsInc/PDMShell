# KILL Command Documentation

## DESCRIPTION:
Kills a process.

## SYNTAX:
kill [-p process_name]

## PARAMETERS:
-p process_name - The process to terminate (with extension)

## EXAMPLES:
kill sldworks.exe

## REMARKS:
- This command uses `taskkill` from the command line.
- It requires PDM to be run as an administrator.