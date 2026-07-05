---
description: Prints the history of a file.
title: history Command | PDMShell | SOLIDWORKS PDM
---
# history
## Description
Prints the history of a file.

## Syntax

```text
history [-search|-filePath]
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-search` | No | The search operation to use. |
| `-filePath` | No | The file to get the history for. |

### Parameter Details

- `search`:  The search operation to use.

- `filePath`: The file to get the history for.

## Examples
```bash
history -f "file1.sldprt"
# history
```
## Remarks
- The search parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.


## PREVIEW:
![history command](../images/history.png)

## Availability
Available since PDMShell 2.0.0.
