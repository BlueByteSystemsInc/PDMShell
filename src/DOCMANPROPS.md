---
description: Edit files with the document manager.
title: DIR Command Documentation | PDMShell | SOLIDWORKS PDM
---

# DOCMANPROPS Command  

## DESCRIPTION

The `docmanprops` command is used to **export and refresh SOLIDWORKS file custom properties** without opening SOLIDWORKS.

This command supports two primary modes:

- **Export Mode (Default)** — Reads properties from SOLIDWORKS files and writes them to a CSV file
- **Refresh Mode** — Reads a CSV file and writes the properties back into the SOLIDWORKS files (Same CSV from Export mode)

This command is designed for:

- Bulk property extraction
- Bulk property updates
- Property migration
- Property synchronization
- Property correction and normalization

The command uses the **SOLIDWORKS Document Manager API**, making it significantly faster and more scalable than SOLIDWORKS automation.

Implementation reference: :contentReference[oaicite:0]{index=0}

---

# SYNTAX

```bash
docmanprops -directory <path> -csv <csvPath> [-recursive] [-configNames] [-refresh]
```
---

# PARAMETERS

## directory

Specifies the folder containing SOLIDWORKS files.

Supported file types:

- .sldprt
- .sldasm
- .slddrw

Example: `-directory "C:\Vault\Projects"`

---

## csv

Specifies the CSV file path.

Used for:

- Export destination
- Refresh source

Example: `-csv "C:\temp\props.csv"`

---

## refresh

When specified, the command runs in **Refresh Mode**.

Reads the CSV file and writes the properties back into the SOLIDWORKS files.

---

## recursive

When specified, searches subfolders.
---

## configNames

Specifies which configurations to include.

Default: All configurations

Example: `-configNames "Default,Config1"` Use space for custom property.

---

# CSV FORMAT

The CSV contains the following columns:
```bash
Folder  
FullPath  
FileName  
Extension  
Configuration  
Property  
Value  
EvaluatedValue  
Type  
Success  
Exception  
```
Example:

```bash
C:\Vault\Part, C:\Vault\Part\Part1.SLDPRT, Part1, .SLDPRT, Default, Description, Plate, Plate, Text, True,
```

---

# EXPORT MODE

## DESCRIPTION

Reads properties from files and writes them to CSV.

Properties include:

- File custom properties
- Configuration properties
- Evaluated values
- Property types

---

## EXAMPLE
```bash
docmanprops -directory "C:\Vault\Parts" -csv "C:\temp\props.csv" -recursive
```

## OUTPUT

![export mode](image-2.png)
---

# REFRESH MODE

## DESCRIPTION

Reads CSV file and writes properties back into files.

Features:

- Opens each file once
- Updates all properties
- Saves file
- Updates CSV Success and Exception columns
- Parallel processing

Implementation reference: :contentReference[oaicite:1]{index=1}

---

## EXAMPLE
```bash
docmanprops -csv "C:\temp\props.csv" -refresh
```

## CONSOLE OUTPUT

![refreshmode](image-1.png)


---

# SUCCESS AND ERROR TRACKING

The CSV is updated during refresh:

Success column:

True — Property updated successfully  
False — Property update failed  

Exception column:

Contains error message

Example:

```bash
Property,Success,Exception
Description,True,
PartNumber,False,Configuration Default not found
```

---

# PERFORMANCE

Typical performance:

| Files | Time |
|---|---|
| 1,000 | seconds |
| 10,000 | under 1 minute |
| 100,000 | few minutes |

---
