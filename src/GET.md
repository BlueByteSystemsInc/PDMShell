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

-`version`:  (Optional) The version of the file to retrieve

-`directory`: Folder where to deposit the file. Can be outside vault. Do not end with \\.

-`getoptions`: (Optional). Allows you to cache references as well:

| Option Name (CLI)        | Description |
|--------------------------|-------------|
| Simple                   | Retrieves the file with no additional options applied. |
| MakeReadOnly             | Marks the retrieved file as read-only in the local cache. |
| DisableRefresh           | Does not refresh File Explorer after the file is retrieved. |
| RefsOnlyMissing          | Retrieves only referenced files that are not already present on the local hard disk. |
| RefsVerLatest            | Retrieves the latest versions of referenced files that the user has permission to see, instead of the attached (as-built) versions used when the file was checked in. |
| RefsOverwriteLocked      | Retrieves referenced files even if they are checked out and overwrites local changes; **warning:** any previous modifications to checked-out files will be lost. |
| ForPreview               | Retrieves only referenced files required for SOLIDWORKS PDM preview when retrieving the referencing file. |


## EXAMPLES:
```bash
get -filePath "file1.sldprt" -Version 2
```
## REMARKS:
- The `search` parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.