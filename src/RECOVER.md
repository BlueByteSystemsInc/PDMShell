---
description: Recovers deleted files from a folder or CSV source.
title: recover Command | PDMShell | SOLIDWORKS PDM
---
# recover
## Description
The `recover` command recovers deleted files from a folder or CSV source. It supports optional parameters for search queries and recursive operations.

## Syntax
```bash
recover -directory -search -recursive -source 
```

## Parameters
- `directory`: Specifies the directory to recover files from. This parameter is optional.
- `search`: A search query to filter the files to recover. This parameter is optional. Supports % and * as wildcards.
- `recursive`: Enables recursive recovery of files within subdirectories. This parameter is optional.
- `source`: Specifies the source to recover files from. This parameter is optional.

>[!NOTE]
> - To generate a source csv file, use the command `delete -list -csv deletedfiles.csv` to generate a list of all deleted files in the current directory.
> - You can include `recursive` to get all files from the subdirectories.
> - To generate a source csv file for a particular directory, use `directory` in combination with `list` and `csv`. 

## Examples
```bash
recover -source "source.csv"
# recover
recover -directory ""
# recover
```

## Remarks
- Ensure that the specified directory or source exists and is accessible.

## Tutorial
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/recover.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>

## Availability
Available since PDMShell 2.0.74.
