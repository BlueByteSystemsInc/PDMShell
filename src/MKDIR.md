---
description: Creates a new vault folder.
title: mkdir Command | PDMShell | SOLIDWORKS PDM
---
# mkdir
## Description
Creates a new folder.

## Syntax

```text
mkdir -directory
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-directory` | Yes | The folder to create. Supports placeholders. |

### Parameter Details

- `directory`: The folder to create. Supports placeholders.

>[!NOTE]
> For more information about placeholders, refer to the [placeholders documentation](EVAL.md).

## Examples
```bash
mkdir -directory "NewFolder"
# mkdir
```
## Remarks
- To get the new folder to show up in the auto-complete, please use the command `cd -refresh`.
- `directory` is the default parameter. You do not need to specify it.

## Availability
Available since PDMShell 2.0.0.
