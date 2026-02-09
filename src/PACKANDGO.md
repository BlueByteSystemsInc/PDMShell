---
description: The PACKG command performs a SOLIDWORKS Pack and Go on a specified assembly or multiple assemblies discovered via search.
title: PACKG Command Documentation | PDMShell | SOLIDWORKS PDM
---

# PACKG Command Documentation

## DESCRIPTION:
The `packg` command performs a SOLIDWORKS Pack and Go operation on:

- A single assembly file  
- Multiple assemblies discovered via directory search  
- A CSV file containing a list of assembly paths  

This command launches SOLIDWORKS, executes Pack and Go for each assembly, and saves the results into a specified output directory.

By default, only `.sldasm` files are processed.

---

## SYNTAX:

packg -source -directory [-search] [-includedrawings] [-recursive] [-prefix] [-suffix] [-timeout]

---

## PARAMETERS:

- source  
  Single assembly file, directory of assemblies, or CSV file containing assembly paths.

- directory  
  Destination folder where Pack and Go results will be saved.  
  Supports dynamic placeholders:
  - $filename
  - $nameWithoutExtension
  - $directory
  - $date
  - $year

- search  
  Search pattern applied when source is a directory.  
  Default value is *.sldasm.  
  Supports regular expressions.

- includedrawings  
  Includes associated drawing files (.slddrw) in the Pack and Go operation.

- recursive  
  Searches subdirectories when source is a directory.

- prefix  
  Adds a prefix to all generated file names.

- suffix  
  Adds a suffix to all generated file names.

- timeout  
  SOLIDWORKS startup timeout in seconds. Default is 30.

---

## EXAMPLES:

### Example 1: Pack a Single Assembly
```bash
## Packs a single assembly and saves results to D:\Packages
packg -source "C:\Projects\Top.sldasm" -directory "D:\Packages"
```
---

### Example 2: Pack All Assemblies in a Directory
```bash
## Packs all assemblies (*.sldasm) in the specified folder
packg -source "C:\Projects" -directory "D:\Packages"
```
---

### Example 3: Recursive Directory Search
```bash
## Searches subfolders and packs all assemblies found
packg -source "C:\Projects" -directory "D:\Packages" -recursive
```
---

### Example 4: Use Regex Search
```bash
## Packs only assemblies that start with TOP_
packg -source "C:\Projects" -search "^TOP_.*\.sldasm$" -directory "D:\Packages"
```
---

### Example 5: Pack Assemblies from CSV

## Reads assembly paths from a CSV file and packs each one
```bash
packg -source "C:\Batch\assemblies.csv" -directory "D:\Packages"
```
---

### Example 6: Include Drawings
```bash
## Includes associated drawing files in Pack and Go
packg -source "C:\Projects\Top.sldasm" -directory "D:\Packages" -includedrawings
```
---

### Example 7: Prefix and Suffix
```bash
## Adds prefix and suffix to all packed files
packg -source "C:\Projects\Top.sldasm" -directory "D:\Packages" -prefix "SW_" -suffix "_Release"
```
---

### Example 8: Increase SOLIDWORKS Timeout
```bash
## Allows more time for SOLIDWORKS to launch
packg -source "C:\Projects" -directory "D:\Packages" -timeout 60
```