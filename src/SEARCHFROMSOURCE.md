---
description: The searchfromsource command reads a CSV file containing file names or search tokens, searches for each item in the SOLIDWORKS PDM vault, and optionally exports results to a CSV file.
title: SEARCHFROMSOURCE Command Documentation | PDMShell | SOLIDWORKS PDM
---

# SEARCHFROMSOURCE Command Documentation

## DESCRIPTION
The `searchfromsource` command reads a **CSV source file** and uses the **first column** (ignoring the header) as input items to search for in the vault. 

For every row in the source CSV, PDMShell performs a vault search and returns information such as:

- File ID  
- Full vault path  
- Parent folder ID  
- Checked-out status  
- Where Used parent file IDs  

Optionally, the command can write the results to a CSV file and add/update that CSV in the vault.

---

## SYNTAX
searchfromsource -filePath -recursive -csv

---

## PARAMETERS

### `filePath`
Path to the **source CSV file** to read input values.

- If the path is **absolute**, PDMShell uses it directly.
- If the path is **relative**, PDMShell combines it with the current directory.

> [!IMPORTANT]
> The source file must exist in the vault (so it can be downloaded locally and read).

---

### `recursive`
If specified, the search will recursively search through all subfolders.

- When omitted: search is performed in the current directory scope (non-recursive).
- When included: recursive search is enabled.

---

### `csv`
Optional output CSV file name/path.

If provided, the command will write the search results to a CSV file containing one row per input item.

Supported behaviors:
- If the CSV file already exists in the vault, PDMShell will attempt to overwrite/update it.
- If the CSV file does not exist, PDMShell will create it and add it to the vault.

---

## INPUT CSV FORMAT

The command reads:

- Comma-delimited CSV
- First row is treated as a header and ignored
- Only the **first column** is used

Example:

FileName  
part1.sldprt  
asm_top.sldasm  
drawing1.slddrw  

Notes:
- **THE VALUES CAN BE A SEARCH QUERY. PLEASE SEE** [ADVANCED SEARCH ARTICLE FOR MORE INFORMATION](advancedsearch.md).
- Empty rows are ignored
- Values are trimmed
- Each value becomes the search input token

---

### Input Example 1: Plain file names (most common)

This is the simplest format where the first column contains exact file names:

FileName  
bracket.sldprt  
frame.sldasm  
cover.sldprt  
motor_mount.sldprt  

How it behaves:
- Each row is searched individually
- PDMShell tries to locate the file in the vault (based on your current folder and `-recursive` flag)

---

### Input Example 2: File names with extensions mixed (multi-document types)

You can mix parts, assemblies, drawings, PDFs, etc.

FileName  
100023.sldprt  
100023.slddrw  
Datasheet_100023.pdf  
SpecSheet.docx  

How it behaves:
- Each row is treated as a separate lookup item
- Results are returned only if PDM finds a matching file

---

### Input Example 3: Using wildcards (`%`) in the input

If your source file contains wildcard patterns, each row can be used as a search token:

Query  
%.sldprt  
%.sldasm  
%.slddrw  

How it behaves:
- Each row becomes its own search query
- Useful for generating bulk reports from common patterns

---

### Input Example 4: Advanced Search expressions in the input

You can pass more powerful search values in the first column (same idea as `-search` in the `search` command).

Query  
"Name=%.slddrw"  
"Name=%.sldprt;Locked=true" // All parts that are checked out   

How it behaves:
- Each row is passed directly into the search engine
- Results depend on your Advanced Search capabilities and syntax rules

> [!NOTE]
> For full syntax and supported fields/operators, see: [advancedsearch.md](advancedsearch.md)


---



## OUTPUT CSV FORMAT
When `-csv` is used, PDMShell generates the following columns:

ID,FileName,Path,ParentFolderID,ParentFolder,IsCheckedOut,WhereUsedIds

### Column Definitions
- **ID**: PDM file ID returned by search  
- **FileName**: The original value read from the source CSV first column  
- **Path**: Full vault path returned by the search result  
- **ParentFolderID**: Folder ID containing the file  
- **ParentFolder**: Folder path (derived from the result path)  
- **IsCheckedOut**: `True/False` based on PDM lock status  
- **WhereUsedIds**: Comma-separated list of parent file IDs (from the reference tree)

---

## EXAMPLES

### Example 1: Run search from a source CSV
searchfromsource -filePath "input.csv"

Reads `input.csv` and searches each row item.

---

### Example 2: Recursive search
searchfromsource -filePath "input.csv" -recursive

Searches for each item recursively through subfolders.

---

### Example 3: Export results to a CSV file
searchfromsource -filePath "input.csv" -recursive -csv "results.csv"

Writes results into `results.csv`.  
If `results.csv` exists in the vault, the command attempts to update it.  
If it does not exist, the command creates it and adds it to the vault.

---

## NOTES
- This command requires the user to be logged in to a vault.
- The input CSV must be accessible locally (PDM will download the file when needed).
- If the vault search yields no result for a row, the command prints a warning and continues.
- Output CSV values are CSV-escaped (commas, quotes, newlines).
- Where Used results are generated using the reference tree lookup.

---

## LIMITATIONS
- Only the first search result is used (`GetFirstResult()`).
- Only file results are processed (folder results are ignored).
- The input file is interpreted as comma-delimited CSV only.
