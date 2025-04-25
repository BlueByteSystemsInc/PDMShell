---
description: The AddTOVAULT command is used to add files or directories to the PDM vault. It supports various parameters to specify the source files or directories, search queries, and additional options such as ignoring existing files, updating references, and recursive operations.
title: ADDTOVAULT Command Documentation | PDMShell
---

# ADDTOVAULT Command Documentation

## DESCRIPTION:
The `addtovault` command is used to add files or directories to the PDM vault. It supports various parameters to specify the source files or directories, search queries, and additional options such as ignoring existing files, updating references, and recursive operations.
## SYNTAX:
```bash
addtovault -csv  -dir  -search  -source -ignoreex -updaterefs -recursive
```

## PARAMETERS:

- `csv`:
(Optional) Specifies the path to a CSV file containing a list of files or directories to be added to the vault.

- `dir`:
(**Required**)
Specifies the target directory. If not specified current directory is used. If using the current directory, use "".

- `search`:
(Optional) A search query to filter files or directories to be added to the vault. This is **File Explorer** search query. Use * as a wildcard.

- `source`:
(Required) Specifies the source file or directory to be added to the vault.

- `ignoreex`:
(Optional) Ignores files that already exist in the vault. This prevents overwriting existing files.

- `updaterefs`:
(Optional) Updates references for the files being added to the vault.

- `recursive`:
(Optional) Adds all files and subdirectories within the specified directory. This parameter is only applicable when adding directories.

## EXAMPLES:
```bash
addtovault -source "C:\Projects\file.txt" -directory ""
# adds text file to the current directory
```

## REMARKS:

- Use the `recursive` parameter with caution, as it will add all contents within the specified directory.
- The `ignoreex` parameter prevents overwriting files that already exist in the vault.
- Ensure you have the necessary permissions to add files or directories to the PDM vault.
- Files are left **checked out** after command completes.

>[!NOTE]
> Use `checkin -search % -recursive` to check in all added files after calling `addtovault`.

## TUTORIAL:
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/addtovault.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>