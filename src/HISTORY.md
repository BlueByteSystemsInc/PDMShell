---
description: Prints the history of a file.
title: HISTORY Command Documentation | PDMShell | SOLIDWORKS PDM
---
# HISTORY Command Documentation

## DESCRIPTION:
Prints the history of a file.

## SYNTAX:
```bash
history [-search|-filePath] 
```
## PARAMETERS:
- `search`:  The search operation to use.

- `filePath`: The file to get the history for.

## EXAMPLES:
```bash
history -f "file1.sldprt"
# lists the history of file1
```
## REMARKS:
- The search parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.


## PREVIEW:
![History Command](../images/history.png)