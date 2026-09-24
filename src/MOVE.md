---
description: Moves files or folders between vault locations, or moves external filesystem files into a destination folder.
title: move Command | PDMShell | SOLIDWORKS PDM
---
# move
## Description
The `move` command moves file(s) from one folder in the vault to another, or moves external filesystem files into a destination folder.

You can move:
- A single file
- A folder
- Files returned from a search query
- External filesystem files returned from a filename search

When a vault file is moved:
- All references are automatically updated by SOLIDWORKS PDM.
- Any parent files referencing the moved file are updated.
- File history and versions are preserved.

---

## Syntax

```text
move (-source file_or_folder | -search search_query | -fsSearch filename_pattern -fsSearchDir external_folder) -directory existing_destination [-recursive]
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-source` | No | File or folder to move. Use one source mode: `-source`, `-search`, or `-fsSearch` with `-fsSearchDir`. |
| `-directory` | Yes | See parameter details below. |
| `-search` | No | Search query scoped to the current PDMShell directory. Use one source mode only. |
| `-fsSearch` | No | Filename pattern for external filesystem files, such as `*.pdf`. Requires `-fsSearchDir`. |
| `-fsSearchDir` | No | External filesystem folder to search. Requires `-fsSearch`. |
| `-recursive` | No | Includes subfolders when used with `-search` or `-fsSearch`. |

### Parameter Details

- `source`  
  The complete file path of the file to move.  
  You can also specify a folder path. This will move the actual folder.
  This parameter is ignored when `-search` is specified.

- `directory`  
  Target directory where to move the file(s) to. Must already exist. For vault moves, this must be a vault folder. For external filesystem moves, this must be an external filesystem folder.

- `search`  
  Search query. PDMShell searches from the current directory, moves matching files to `-directory`, and does not use `-source` as a search scope. This does not support moving folders from search results.

- `fsSearch`  
  Filename pattern for external filesystem files. Use this with `-fsSearchDir` when moving files that are outside the vault, for example `*.pdf` or `Report*.xlsx`.

- `fsSearchDir`  
  External filesystem folder to search when `-fsSearch` is used. This mode does not move files from vault views, does not overwrite destination files, and does not move through linked or reparse paths.

- `recursive`  
  Affects the `-search` and `-fsSearch` parameters. Specify `-recursive` to make the search recursive.  
  For `-search`, the start location is the current PDMShell directory. For `-fsSearch`, the start location is `-fsSearchDir`.

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

### Example 4: Move External Files by Filename Pattern
```bash
move -fsSearch "*.pdf" -fsSearchDir "C:\Exports" -recursive -directory "D:\Released PDFs"
## Moves matching external PDF files from C:\Exports and its subfolders into D:\Released PDFs.
```
---

## Notes
- You must have permission to move the file(s).
- If the file is referenced by other files, referencing paths are updated automatically.
- If the file has references, those reference paths are updated automatically.
- Target directory must already exist.
- Search mode always starts from the current PDMShell directory. Use [`cd`](CD.md) to change the search scope before running `move -search`.
- External filesystem mode uses `-fsSearch` and `-fsSearchDir` together, cannot be combined with `-source` or `-search`, and keeps the source and destination outside vault views.
- Move operations preserve version history.

## Availability
Available since PDMShell 3.0.28.

## Video

<div class="ratio ratio-16x9">
  <iframe src="https://www.youtube.com/embed/hn5dfAiYp9g" title="Move files with PDMShell" allowfullscreen></iframe>
</div>

[Watch on YouTube](https://www.youtube.com/watch?v=hn5dfAiYp9g&feature=youtu.be)
