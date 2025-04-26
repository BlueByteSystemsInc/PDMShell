---
description: Sets variables for multiple files using a CSV file as the source.
title: SETVARSFROMSOURCE Command Documentation | PDMShell | SOLIDWORKS PDM
---
# SETVARSFROMSOURCE Command Documentation

## DESCRIPTION:
Sets variables for multiple files using a CSV file as the source.

## SYNTAX:
```bash
setvarsfromsource -source
```

## PARAMETERS:
-`source`: The CSV file containing the file IDs and variable values.

## CSV FILE FORMAT:
The CSV file should have the following format:

```
FileID,Variable1,Variable2,... 
XXXX,Value1,Value2,... 
XXXX,Value1,Value2,...
```
## EXAMPLES:
```bash
setvarsfromsource -source variables.csv # the source file must be exist in the current directory
```

## REMARKS:
- The CSV file should have the first column as the file ID and the subsequent columns as the variable names.
- You need to include the extension in the filename. This file can be outside the vault.
- The best way to generate a source CSV is to use the `dir` command or the `search` command on a folder with the `-csv` parameter and the `columns`, like:
```bash
dir -columns Description,"Part Number" -csv data.csv
search -search %.sldprt -recursive -columns Description,"Part Number" -csv data.csv #this will save all parts from all levels in the current directory with the columns Description and Part Number
```

## TUTORIAL:
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/setvarsfromsource.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>