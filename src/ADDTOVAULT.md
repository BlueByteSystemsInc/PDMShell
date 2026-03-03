---
description: The ADDTOVAULT command is used to add files or directories to the PDM vault. It supports adding from a single file, folder, or CSV mapping map, and includes options such as batch processing, ignoring existing files, updating references, recursion, and exporting results to CSV.
title: ADDTOVAULT Command Documentation | PDMShell | SOLIDWORKS PDM
---

# ADDTOVAULT Command Documentation

## DESCRIPTION:
The `addtovault` command is used to add files and/or directories to the SOLIDWORKS PDM vault. It supports multiple input methods including direct file paths, folders, and CSV mapping maps. Additional options allow batch processing, filtering, ignoring existing files, updating references, and exporting results.

> [!NOTE]
> It is highly recommended that you run PDMShell as **Administrator** before using this command.

---

## SYNTAX:
```bash
addtovault [-source <path> | -map <csvPath>]  [-skip] [-count] | [-directory <Vault or outside directory>] [-search <pattern>] [-recursive] [-batch <size>] [-ignoreexisting] [-updaterefs] [-csv <outputPath>] [-propertymap] [-clear] [-label]
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

- `map`:

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

With `-map`, you skip a specified number of items using `-skip` to start from a starting index in your map file. You can limit the number of items to process using the `-count`. 

```bash 
#uses a map file and starts from the index 5234 only processing 540 mappings
addtovault -map "C:\Users\hawkridge\Downloads\map\map.csv" -batch 50 -propertymap "C:\Users\hawkridge\Downloads\map\property.csv" -skip 5243 -count 540 -clear -ignoreexisting -csv "result.csv"
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

- `ignoreexisting`:

(Optional)

Ignores files that already exist in the vault.
Prevents duplicate additions and overwriting.

---

- `updaterefs`:

(Optional)

Updates file references after files are added.

This is recommended when migrating SOLIDWORKS assemblies to ensure references point to the correct vault locations.

---

- `label`:

(Optional)

Adds a label to the migrated files. This is a great option to mark the added files immediately. 

```bash
#Add files from a map (skip first 10 and only process 3) and add a label migration name and value 
addtovault -map "C:\export\map.csv" -skip 10 -count 3 -label "Migration;Migration"
# finds the added files (parts)
search -search "Name=%.sldprt;Label=Migration;Recursive=true"
```
![label](/images/label.png)
---

- `csv`:

(Optional)

Exports the results of the add operation to a CSV file.

Example:
```bash
-csv "C:\Reports\add_results.csv"
```
---

- `propertymap`: 
A csv file path containing a list of files and their properties. Use [DocManProps](DOCMANPROPS.md) to generate a list and edit in excel. 
```bash
-csv "C:\Reports\propertymap.csv"
```
You only need the columns that marked in red:

![Example of property map file](/images/propertymap.png)

>[!IMPORTANT]
> If you specify the word "DELETE" as the value, PDMShell will delete that property from in the migrated file during the add operation. **The original file will not be affected**.

If you specify `-clear`, PDMShell will clear all the properties from the file before adding it to the vault and prior to apply the property map. 

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
addtovault -map "C:\Projects\mapping.csv" -batch 50
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
Add files from a map CSV (50 at a time) and save the results to ret.csv, while ensuring properties are updated using a property map CSV file. This also performs a search and ignores files that already exist in the vault.
```bash
addtovault -map "c:\export\map.csv" -ignoreexisting -csv "ret.csv" -batch 10 -propertymap "c:\export\propertymap.csv"
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

• The `ignoreexisting` parameter prevents duplicate files from being added.

• The `updaterefs` parameter should be used when adding SOLIDWORKS assemblies.

• Ensure you have sufficient vault permissions before running this command.

• The `map` parameter overrides `source` if both are specified.

---

> [!NOTE]
> It is recommended to perform large add operations in stages and verify results using the exported CSV report.
