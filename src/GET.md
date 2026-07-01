---
description: Gets a file version from the vault into the local cache.
title: get Command | PDMShell | SOLIDWORKS PDM
---
# get
## Description
Retrieves a specified version of a file or files (via search).

## Syntax
```bash
get -search -recursive -filePath -version -directory -getoptions
```
## Parameters
- `search`: The search operation to use.

- `filePath`: The file(s) to retrieve. This is the default parameter.


- `recursive`: When used with [`search`](SEARCH.md), includes files in subfolders.
- `version`:  (Optional) The version of the file to retrieve

- `directory`: (Optional) Folder where to deposit the file. Can be outside vault. Do not end with \\. If not specified, file is cached in its folder. 

- `getoptions`: (Optional). Allows you to cache references as well:

| Option Name (CLI)        | Description |
|--------------------------|-------------|
| Simple                   | Retrieves the file with no additional options applied. |
| MakeReadOnly             | Marks the retrieved file as read-only in the local cache. |
| DisableRefresh           | Does not refresh File Explorer after the file is retrieved. |
| RefsOnlyMissing          | Retrieves only referenced files that are not already present on the local hard disk. |
| RefsVerLatest            | Retrieves the latest versions of referenced files that the user has permission to see, instead of the attached (as-built) versions used when the file was checked in. |
| RefsOverwriteLocked      | Retrieves referenced files even if they are checked out and overwrites local changes; **warning:** any previous modifications to checked-out files will be lost. |
| ForPreview               | Retrieves only referenced files required for SOLIDWORKS PDM preview when retrieving the referencing file. |


## Examples
```bash
get -filePath "file1.sldprt" -Version 2
```
## Remarks
- The [`search`](SEARCH.md) parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.

## Availability
Available since PDMShell 2.0.0.
