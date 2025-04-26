---
description: Creates a new folder.
title: MKDIR Command Documentation | PDMShell | SOLIDWORKS PDM
---
# MKDIR Command Documentation

## DESCRIPTION:
Creates a new folder.

## SYNTAX:
```bash
mkdir -directory
```
## PARAMETERS:
- `directory`: The folder to create. Supports placeholders.

>[!NOTE]
> For more information about placeholders, refer to the [placeholders documentation](src/EVAL.html).

## EXAMPLES:
```bash
mkdir -directory "NewFolder"
# Creates a new folder called NewFolder
```
## REMARKS:
- To get the new folder to show up in the auto-complete, please use the command `cd -refresh`.
- `directory` is the default parameter. You do not need to specify it.