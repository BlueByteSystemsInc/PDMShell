---
description: Permanently destroys deleted files in a folder.
title: Destroy Command | PDMShell | SOLIDWORKS PDM
---
# DESTROY Command
## Description
The `destroy` command permanently deletes files that have already been marked as deleted in a specified directory. This command supports recursive deletion and filtering by date.

## Syntax
```bash
destroy -directory -recursive -date 
```

## Parameters
- `directory`: The directory to destroy.
- `recursive`: Enables recursive search (for files).
- `date`: (Optional) Specifies a date filter. Only files deleted on or before the specified date will be destroyed. The date format should be YYYY-MM-DD.

## Examples
```bash
destroy -directory "C:\Projects\Project"
# destroys all deleted files in project folder
```

## Remarks
- The `directory` parameter is mandatory and must specify a valid directory.
- Use the `recursive` parameter with caution, as it will process all subdirectories within the specified directory.
- The `date` parameter allows you to target files deleted on or before the specified date, providing more control over the destruction process.
- This action is irreversible. Ensure you have the necessary permissions and have reviewed the files before executing the command.

## Tutorial
<video src="https://bluebyte.biz/wp-content/pdmshellvideos/destroy.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>

## Availability
Available since PDMShell 2.0.5.
