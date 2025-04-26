---
description: Retrieves a specified version of a file or files (via search).
title: Get Command Documentation  | PDMShell | SOLIDWORKS PDM
---
# GET Command Documentation

## DESCRIPTION:
Retrieves a specified version of a file or files (via search).

## SYNTAX:
```bash
get -search -filePath -version
```
## PARAMETERS:
- `search`: The search operation to use.

- `filePath`: The file(s) to retrieve. This is the default parameter.

-`version`: The version of the file to retrieve.

## EXAMPLES:
```bash
get -filePath "file1.sldprt" -Version 2
```
## REMARKS:
- The `search` parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.