---
description: The MOVEFROMSOURCE command moves file(s) based on file IDs and target directories provided in a CSV file.
title: MOVEFROMSOURCE Command Documentation | PDMShell | SOLIDWORKS PDM
---

# MOVEFROMSOURCE Command Documentation

## DESCRIPTION:
The `movefromsource` command moves file(s) in the vault using a CSV file as input.

Each row in the CSV specifies:
- The File ID
- The Target Directory

This command is designed for bulk relocation of files.

When a file is moved:
- All references are automatically updated by SOLIDWORKS PDM.
- Parent references are updated automatically.
- File history and versions are preserved.

---

## SYNTAX:
```bash
movefromsource -source
```
---

## PARAMETERS:

- `source`  
  Path to a CSV file containing file IDs and target directories.  
  The CSV must contain at least two columns:
  
  - `FileID`
  - `TargetDirectory`

---

## CSV FORMAT:

### With Header:

FileID,TargetDirectory  
1234,\Released  
5678,\Archive\2026  

### Without Header:

1234,\Released  
5678,\Archive\2026  

---

## EXAMPLES:

### Example 1: Basic CSV Move
```bash
movefromsource -source "C:\temp\movefiles.csv"
## Moves all files listed in the CSV to their respective target folders.
```
---

## NOTES:

- Target directories must already exist in the vault.
- You must have permission to move the specified files.
- If a FileID does not exist, that row will be skipped and logged.
- If a move fails due to permission or state restrictions, it will be reported.
- Reference updates are handled automatically by SOLIDWORKS PDM.
- CSV rows with invalid format will be skipped and logged.
