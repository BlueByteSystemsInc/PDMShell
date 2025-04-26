---
description: The DELETEFROMSOURCE command is used to delete files from a csv file.
title: DELETEFROMSOURCE Command Documentation | PDMShell | SOLIDWORKS PDM
---

# DELETEFROMSOURCE Command Documentation

## DESCRIPTION: 
The `deletefromsource` function is used to delete files from a csv file.

## SYNTAX:
```bash
deletefromsource -filePath
```
## PARAMETERS:

- `filePath` :  A string containing the IDs of the files and folders to be deleted. The IDs should be formatted appropriately for the function to process them.

## REMARKS:

- The source file should be a CSV file with a column header. This column must contain the IDs of the files to be deleted.
- The command will ignore any files that are **checked out**.


### EXAMPLES:

```bash
deletefromsource -filePath "files to delete.csv"
```