---
description: Displays the biographical information about the specified file.
title: PRINT Command Documentation | PDMShell | SOLIDWORKS PDM
---
# PRINT Command Documentation

## DESCRIPTION:
Displays the biographical information about the specified file.

## SYNTAX:
```bash
print [-filePath|-id]
```
## PARAMETERS:
-filePath: The file to print biographical information for.

## EXAMPLES:
```bash
print -filePath "C:\SOLIDWORKSPDM\Bluebyte\API\Sandbox\fidget spinner\___108545.SLDPRT"
```
The print command will print an output like the following: 
```bash

File Name     : ___108545.SLDPRT
Local Path    : C:\SOLIDWORKSPDM\Bluebyte\API\Sandbox\fidget spinner\___108545.SLDPRT
Folder Path   : \API\Sandbox\fidget spinner

File ID       : 115310
Folder ID     : 457

HEXID         : 1C26E
Archive Path  : E\0001C26E

Checked out?  : False

State ID      : 158
State Name    : New State
Current state : New State [Workflow: Vaulted]
Current Ver   : 7
Current Rev   : 

Transitions   :
Return Engineering [193] From New State [158] To In Design [9]

```
