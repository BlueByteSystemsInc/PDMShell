---
description: Moves files or folders from one vault location to another.
title: move Command | PDMShell | SOLIDWORKS PDM
---
# move
## Description
The `move` command moves file(s) from one folder in the vault to another.

You can move:
- A single file
- A folder
- Files returned from a search query

When a file is moved:
- All references are automatically updated by SOLIDWORKS PDM.
- Any parent files referencing the moved file are updated.
- File history and versions are preserved.

---

## Syntax

```text
move (-source file_or_folder | -search search_query) -directory target_vault_folder [-recursive]
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-source` | No | File or folder to move. Use either `-source` or `-search`. |
| `-directory` | Yes | See parameter details below. |
| `-search` | No | Search query scoped to the current PDMShell directory. Use either `-source` or `-search`. |
| `-recursive` | No | Includes subfolders when used with `-search`. |

### Parameter Details

- `source`  
  The complete file path of the file to move.  
  You can also specify a folder path. This will move the actual folder.
  This parameter is ignored when `-search` is specified.

- `directory`  
  Target directory where to move the file(s) to. Must exist in the vault.

- `search`  
  Search query. PDMShell searches from the current directory, moves matching files to `-directory`, and does not use `-source` as a search scope. This does not support moving folders from search results.

- `recursive`  
  Affects the search parameter. Specify `-recursive` to make the search recursive.  
  The start location is the current directory.

---

## Examples
### Example 1: Move a Single File
```bash
move -source "C:\Vault\Parts\Bracket.SLDPRT" -directory "\Released"
## Moves a single file to the Released folder.
```
---

### Example 2: Move a Folder
```bash
move -source "\Projects\OldProject" -directory "\Archive"
## Moves the OldProject folder to Archive.
```
---

### Example 3: Move Search Results
```bash
move -search "Name=%.sldprt%" -recursive -directory "\Archive"
## Moves all part files found in the current directory, including subfolders, to the Archive folder.
```
---

## Notes
- You must have permission to move the file(s).
- If the file is referenced by other files, referencing paths are updated automatically.
- If the file has references, those reference paths are updated automatically.
- Target directory must already exist in the vault.
- Search mode always starts from the current PDMShell directory. Use [`cd`](CD.md) to change the search scope before running `move -search`.
- Move operations preserve version history.

## Availability
Available since PDMShell 3.0.28.
