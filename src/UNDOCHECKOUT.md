---
description: Undoes a checkout operation.
title: UNDOCHECKOUT Command Documentation | PDMShell | SOLIDWORKS PDM
---
# UNDOCHECKOUT Command Documentation

## DESCRIPTION:
Undoes a checkout operation.

## SYNTAX:
```bash
undocheckout [-filePath | -search]
```
## PARAMETERS:
- `filePath`: The file to undo the checkout for.

- `search`: The search operation to use.


## EXAMPLES:
```bash
undocheckout -f "file1.sldprt"
```
## REMARKS:
- The search parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.