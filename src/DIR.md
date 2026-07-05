---
description: Displays a list of files and subdirectories in a directory.
title: dir Command | PDMShell | SOLIDWORKS PDM
---
# dir
## Description
Displays a list of files and subdirectories in a directory.

## Syntax

```text
dir -sort -columns -csv -refresh
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-sort` | Yes | The column name to sort the list of files and folders with. |
| `-columns` | Yes | The columns to display, separated by commas. These are PDM variables drawn from the @ tab. |
| `-csv` | Yes | Export the directory listing to a CSV file. Must include the csv extension |
| `-refresh` | Yes | Refreshes the session to load the current files and sub-folders in the active directory in the autocomplete list. |
| `-recursive` | No | Lists all files and all folders in the current directory recursively. |

### Parameter Details

-`sort`: The column name to sort the list of files and folders with.

-`columns`: The columns to display, separated by commas. These are PDM variables drawn from the @ tab.

-`csv`: Export the directory listing to a CSV file. Must include the csv extension

-`refresh`: Refreshes the session to load the current files and sub-folders in the active directory in the autocomplete list.

-`recursive`: Lists all files and all folders in the current directory recursively.

## Examples
```bash
dir  #"C:\Vault\Documents"
dir  -sort "name" -cols "description,partnumber" -csv "output.csv" -refresh
```

## Remarks
- Use the `-refresh` parameter to force the session to load the current files and sub-folders in the active directory. Do not use this when the current folder has many items.
- The CSV file will be checked into the current directory.

## Tutorial
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/dir.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>

## Availability
Available since PDMShell 2.0.0.
