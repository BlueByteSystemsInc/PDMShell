---
description: Undoes a checkout operation.
title: undocheckout Command | PDMShell | SOLIDWORKS PDM
---
# undocheckout
## Description
Undoes a checkout operation.

## Syntax

```text
undocheckout [-filePath | -search]
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-filePath` | No | The file to undo the checkout for. |
| `-search` | No | The search operation to use. |
| `-recursive` | No | When used with [`search`](SEARCH.md), includes files in subfolders. |

### Parameter Details

- `filePath`: The file to undo the checkout for.

- `search`: The search operation to use.



- `recursive`: When used with [`search`](SEARCH.md), includes files in subfolders.

## Examples
```bash
undocheckout -f "file1.sldprt"
```
## Remarks
- The search parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.

## Availability
Available since PDMShell 2.0.0.
