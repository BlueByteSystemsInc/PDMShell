---
description: Lists the direct parent files that reference a file.
title: WHEREUSED Command Documentation | PDMShell | SOLIDWORKS PDM
---

# WHEREUSED Command Documentation

## DESCRIPTION:
The `whereused` command lists all parent files that reference a specified file.

This command helps identify assemblies or drawings that use a particular part or subassembly.

The output columns are:

- ChildID  
- ChildName  
- ParentName  
- ParentID  
- FolderPath  

---

## SYNTAX:

```bash
whereused -filePath|-search -csv
```
---

## PARAMETERS:

- `filePath`  
  Full or relative path of the file to evaluate.

- `search`  
  Optional filter applied to parent results. Supports SQL wildcard `%`.

- `csv` csv file name to put the results in CSV format.

---

## EXAMPLES:

### Example 1: Basic Where Used

```bash
## Lists all parent files that reference `Bracket.SLDPRT`.
whereused -filePath "C:\Vault\Parts\Bracket.SLDPRT"
```
---

### Example 2: Filter Parent Results

```bash
whereused -search "%.SLDASM"
## Finds the parents of all the assemblies in the current directory.
```
---

### Example 3: Export to CSV

```bash
whereused -filePath "C:\Vault\Parts\Bracket.SLDPRT" -csv parents.csv
## Exports results to CSV with columns:
## ChildID,ChildName,ParentName,ParentID,FolderPath
```
