---
description: Sets variable values for files listed in a CSV source.
title: setvarsfromsource Command | PDMShell | SOLIDWORKS PDM
---
# setvarsfromsource
## Description
Sets variables for multiple files using a CSV file as the source.

## Syntax
```bash
setvarsfromsource -source -evaluatealias
```

## Parameters
- `filePath`: The CSV file containing the file IDs and variable values.

## CSV File Format
The CSV file should have the following format:

```
FileID,Variable1,Variable2,... 
XXXX,Value1,Value2,... 
XXXX,Value1,Value2,...
```
## Examples
```bash
setvarsfromsource -source variables.csv # the source file must be exist in the current directory
```

## Remarks
- The CSV file should have the first column as the file ID and the subsequent columns as the variable names.
- You need to include the extension in the filename. This file can be outside the vault.
- The best way to generate a source CSV is to use the [`dir`](DIR.md) command or the [`search`](SEARCH.md) command on a folder with the `-csv` parameter and the `columns`, like:
```bash
dir -columns Description,"Part Number" -csv data.csv
search -search %.sldprt -recursive -columns Description,"Part Number" -csv data.csv #this will save all parts from all levels in the current directory with the columns Description and Part Number
```

## Tutorial
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/setvarsfromsource.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>

## Availability
Available since PDMShell 2.0.1.
