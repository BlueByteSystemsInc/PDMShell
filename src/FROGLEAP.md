---
description: Promotes an older file version to become the latest version.
title: frogleap Command | PDMShell | SOLIDWORKS PDM
---
# frogleap
## Description
The `frogleap` command promotes an older file version to become the latest version.

## Syntax
```bash
frogleap -search -filePath -oldVersion
```
## Parameters
- `search`: The search operation to use.
- `filePath`: The file(s) to be frog leaped. This is the default parameter.
- `oldVersion`: The old version to leap. This is an integer.

## Examples
``` bash
frogleap -filePath "file1.sldprt" -oldVersion 2
```
## Remarks
- The [`search`](SEARCH.md) parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.

## Tutorial
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/frogleap.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>

## Availability
Available since PDMShell 2.0.0.
