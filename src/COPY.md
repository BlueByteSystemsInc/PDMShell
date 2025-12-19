---
description: Copies files inside the SOLIDWORKS PDM vault from a source file or folder to a target directory.
title: COPY Command Documentation | PDMShell | SOLIDWORKS PDM
---

# COPY Command Documentation

## DESCRIPTION
Performs a vault-to-vault copy operation in SOLIDWORKS PDM.

The `copy` command creates **new files with new File IDs** inside the vault by copying:
- A single file
- All files in a folder
- Files found using a search scoped to a source folder

This command does **not** add files from disk and does **not** modify the original files.

## SYNTAX
```bash
copy -source -directory -search -recursive -name -ignoreexisting
```

## PARAMETERS

- `source`  
  The source file or folder inside the vault.  
  - If a file path is provided (ends with an extension), only that file is copied.
  - If a folder path is provided, all matching files in that folder are copied.
  - Relative paths are resolved against the current folder.

- `directory`  
  The destination folder inside the vault where files will be copied.

- `search`  
  Optional PDM search keyword used to filter files in the source folder.  
  The search is scoped to the source folder and supports `%` wildcards.

- `recursive`  
  Optional. When used with `search`, includes subfolders of the source folder.

- `name`  
  Required. Specifies the destination file name.  
  [Alias expressions are evaluated **only for the destination name**](EVAL.md). Extension required.

- `ignoreexisting`  
  Not implemented

## EXAMPLES

### Copy a single file to another folder
```bash
copy -source part1.sldprt -directory /Vault/Projects/Released -name part2.sldprt
```

### Copy a file and rename it
```bash
copy -source part1.sldprt -directory /Vault/Projects/Released -name part1_revA.sldprt
```

### Copy all files from a folder
```bash
copy -source Vault/Projects/WIP -directory /Vault/Projects/Released -name "$namewithouextension-new$extension"
```

### Copy files using a search filter
```bash
copy -source Vault/Projects/WIP -search %.slddrw -directory Vault/Projects/Released -name "$namewithouextension-new$extension"
```

### Copy files and append new to the old name
```bash
copy -source Vault/Projects/WIP -search %.sldprt -directory Vault/Projects/Released -name "$namewithouextension-new$extension"
```

## REMARKS

- If `source` is a file, `search` and `recursive` are ignored.
- If `source` is a folder and `search` is not provided, all files in that folder are copied.
- The `search` parameter does not search the entire vault, only the source folder
