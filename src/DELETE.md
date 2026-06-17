---
description: Deletes one file, one folder, or multiple files found by search.
title: DELETE Command | PDMShell | SOLIDWORKS PDM
---
# DELETE Command
## Description
The `delete` command deletes one file, one folder, or multiple files found by search. It supports target selection by file path, directory path, search query, or ID.

## Syntax
```bash
delete [-filePath|-id] -directory -search -recursive -list -csv -destroy
```
## Parameters
- `filePath`:
(Optional) Specifies the file path of the file to be deleted.

- `directory`: 
(Optional) Specifies the directory to be deleted. If used with the -recursive parameter, all files and subdirectories within the directory will also be deleted.

- `search`:
(Optional) A search query to filter files or directories to be deleted.

- `id`:
(Optional) Specifies the ID of the file to be deleted.

- `recursive`:
(Optional) Deletes all files and subdirectories within the specified directory. This parameter is only applicable when deleting directories.

- `list`:
(Optional) Lists all the deleted files. Specifying `recursive` with this parameter will do a drill down search and fetch all deleted files.

- `csv`: Exports a list of deleted files to a csv. This only works if `list is specified`. 

- `destroy`: If specified, the deleted file will be also destroyed. `-destroy` only affects results from the `search` parameter.

>[!NOTE]
> Use the exported csv from -csv with the [recover](RECOVER.html) command.

>[!NOTE]
>  `-destroy` only affects results from the `search` parameter. 

## Examples
Delete files matching a search query:
```bash
delete -search "%.sldprt"
# delete all parts in the current directory
```
## Remarks
- The delete command requires at least one of the following parameters: `filePath`, `dir`, `search`, or `id`.
- Use the `recursive` parameter with caution, as it will delete all contents within the specified directory.
- Ensure you have the necessary permissions to delete files or directories in the PDM system.

## Tutorial
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/delete.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>

## Availability
Available since PDMShell 2.0.0 or earlier.
