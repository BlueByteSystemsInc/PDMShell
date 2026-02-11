---
description: The MOVE command moves file(s) from one location in the vault to another.
title: MOVE Command Documentation | PDMShell | SOLIDWORKS PDM
---

# MOVE Command Documentation

## DESCRIPTION:
The `move` command moves file(s) from one folder in the vault to another.

You can move:
- A single file
- All files inside a folder
- Files returned from a search query

When a file is moved:
- All references are automatically updated by SOLIDWORKS PDM.
- Any parent files referencing the moved file are updated.
- File history and versions are preserved.

---

## SYNTAX:
```bash
move -source -directory -search -recursive
```
---

## PARAMETERS:

- `source`  
  The complete file path of the file to move.  
  You can also specify a folder path. This will move the files in that folder.  
  Temporary files starting with `~` are ignored.

- `directory`  
  Target directory where to move the file(s) to. Must exist in the vault.

- `search`  
  Search query. Use this to move all search results from the source folder.

- `recursive`  
  Affects the search parameter. Specify `-recursive` to make the search recursive.  
  The start location is the current directory.

---

## EXAMPLES:

### Example 1: Move a Single File
```bash
move -source "C:\Vault\Parts\Bracket.SLDPRT" -directory "\Released"
## Moves a single file to the Released folder.
```
---

### Example 2: Move All Files in a Folder
```bash
move -source "\Projects\OldProject" -directory "\Archive"
## Moves all files inside the specified folder.
```
---

### Example 3: Move Search Results
```bash
move -source "\Projects" -search "Name=%.sldprt%" -recursive -directory "\Archive"
## Moves all part files found in the Projects folder (including subfolders) to the Archive folder.
```
---

## NOTES:

- You must have permission to move the file(s).
- If the file is referenced by other files, referencing paths are updated automatically.
- If the file has references, those reference paths are updated automatically.
- Target directory must already exist in the vault.
- Move operations preserve version history.
