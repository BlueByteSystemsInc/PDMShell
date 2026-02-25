---
description: The ADDTOVAULT command is used to add files or directories to the PDM vault. It supports adding from a single file, folder, or CSV mapping list, and includes options such as batch processing, ignoring existing files, updating references, recursion, and exporting results to CSV.
title: ADDTOVAULT Command Documentation | PDMShell | SOLIDWORKS PDM
---

# ADDTOVAULT Command Documentation

## DESCRIPTION:
The `addtovault` command is used to add files and/or directories to the SOLIDWORKS PDM vault. It supports multiple input methods including direct file paths, folders, and CSV mapping lists. Additional options allow batch processing, filtering, ignoring existing files, updating references, and exporting results.

> [!NOTE]
> It is highly recommended that you run PDMShell as **Administrator** before using this command.

---

## SYNTAX:
```bash
addtovault [-source <path> | -list <csvPath>] [-directory <vaultFolder>] [-search <pattern>] [-recursive] [-batch <size>] [-ignoreex] [-updaterefs] [-csv <outputPath>]
```
---

## PARAMETERS:

- `source`:
Specifies the source file or directory to be added to the vault.

Supports:

• Single file  
• Folder  

If a folder is specified, files can be filtered using `-search` and `-recursive`.

If not specified, the current working directory is used.

---

- `list`:

Specifies a CSV file containing file mapping information.

The CSV must contain **two columns** (First row is header):

Column 1: Full source file path  
Column 2: Destination folder path relative to the target vault directory  

Example CSV:
```bash
FilePath,Target
C:\Data\Part1.sldprt,ProjectA\Mechanical  
C:\Data\Part2.sldprt,ProjectB\Mechanical  
```
This parameter overrides `-source`.

>[!Important]
>Please make sure you don't have duplicates copies to the **same** target directory. 

---

- `directory`:

Specifies the destination folder in the PDM vault.

If not specified, the current vault directory is used.

Example:
```bash
-directory "Projects"
```
---

- `search`:

(Optional)

File Explorer search pattern used to filter files when `-source` is a folder.

Supports:

• Wildcards (`*`)  
• Multiple extensions  
• Separators: `,` `;` `|`

Examples:
```bash
-search "*.sldprt"  
-search "*.sldprt;*.sldasm"  
```
---

- `recursive`:

(Optional)

Includes all subfolders when the source is a folder.

If not specified, only the top-level folder is processed.

---

- `batch`:

(Optional)

Specifies the number of files to add per batch.

This improves performance and stability when adding large numbers of files.

Examples:
```bash
-batch 50  
-batch 100  
```
If not specified, all files are added in a single batch. 
>[!Important]
>**Please use a batch size when processing large directory +1000 files. We recommend a batch size of 100**.

---

- `ignoreex`:

(Optional)

Ignores files that already exist in the vault.

Prevents duplicate additions and overwriting.

---

- `updaterefs`:

(Optional)

Updates file references after files are added.

This is recommended when migrating SOLIDWORKS assemblies to ensure references point to the correct vault locations.

---

- `csv`:

(Optional)

Exports the results of the add operation to a CSV file.

Example:
```bash
-csv "C:\Reports\add_results.csv"
```
---

## EXAMPLES:

Adds a single file to the current vault directory:
```bash
addtovault -source "C:\Projects\file.txt"
```
---

Adds all parts and assemblies recursively:
```bash
addtovault -source "C:\Projects" -recursive -search "*.sldprt;*.sldasm"
```
---

Adds files using a CSV mapping file in batches of 50:
```bash
addtovault -list "C:\Projects\mapping.csv" -batch 50
```
---

Adds files and exports results:
```bash
addtovault -source "C:\Projects" -recursive -csv "C:\Reports\results.csv"
```
---

Adds files and updates references:
```bash
addtovault -source "C:\Migration" -recursive -updaterefs
```
---

Adds files to a specific vault folder:
```bash
addtovault -source "C:\Projects" -directory "Projects"
```
---

## REMARKS:

• Files are left **checked out** after being added.
• Use `checkin` command to check in files after adding.

Example:
```bash
checkin -search % -recursive
```
---

• Batch processing is strongly recommended for large migrations.

• The `ignoreex` parameter prevents duplicate files from being added.

• The `updaterefs` parameter should be used when adding SOLIDWORKS assemblies.

• Ensure you have sufficient vault permissions before running this command.

• The `list` parameter overrides `source` if both are specified.

---

> [!NOTE]
> It is recommended to perform large add operations in stages and verify results using the exported CSV report.
