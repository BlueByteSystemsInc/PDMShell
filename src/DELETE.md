---
description: The DELETE command is used to delete files or directories from the PDM system. It supports various parameters to specify the target files or directories, including file paths, directory paths, search queries, and IDs. The command also supports recursive deletion for directories.
title: DELETE Command Documentation | PDMShell | SOLIDWORKS PDM
---

 # DELETE Command Documentation

## DESCRIPTION:
The `delete` command is used to delete files or directories from the PDM system. It supports various parameters to specify the target files or directories, including file paths, directory paths, search queries, and IDs. The command also supports recursive deletion for directories.

## SYNTAX:
```bash
delete [-filePath|-id] -directory -search -recursive -list -csv
```
## PARAMETERS:

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

- `destroy`: If specified, the deleted file will be also destroyed. 

>[!NOTE]
> Use the exported csv from -csv with the [recover](RECOVER.html) command.

## EXAMPLES:
Delete files matching a search query:
```bash
delete -search "%.sldprt"
# delete all parts in the current directory
```
## REMARKS:
- The delete command requires at least one of the following parameters: `filePath`, `dir`, `search`, or `id`.
- Use the `recursive` parameter with caution, as it will delete all contents within the specified directory.
- Ensure you have the necessary permissions to delete files or directories in the PDM system.

## TUTORIAL:
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/delete.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>