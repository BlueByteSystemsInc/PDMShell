---
description: Creates a new vault folder.
title: MKDIR Command | PDMShell | SOLIDWORKS PDM
---
# MKDIR Command
## Description
Creates a new folder.

## Syntax
```bash
mkdir -directory
```
## Parameters
- `directory`: The folder to create. Supports placeholders.

>[!NOTE]
> For more information about placeholders, refer to the [placeholders documentation](EVAL.md).

## Examples
```bash
mkdir -directory "NewFolder"
# Creates a new folder called NewFolder
```
## Remarks
- To get the new folder to show up in the auto-complete, please use the command `cd -refresh`.
- `directory` is the default parameter. You do not need to specify it.

## Availability
Available since PDMShell 2.0.0.
