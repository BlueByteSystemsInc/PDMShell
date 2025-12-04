---
description: Sets the revision of SOLIDWORKS PDM files from a CSV source containing file IDs and revision values.
title: SETRECISIONFROMSOURCE Command Documentation | PDMShell | SOLIDWORKS PDM
---
# SETRECISIONFROMSOURCE Command Documentation

## DESCRIPTION

The `SetRecisionFromSourceCommand` allows you to batch-update the **PDM-managed revision** for multiple files by reading values from a CSV input source.

The **source CSV** must contain at minimum:

- **Id** → the PDM file ID  
- **Value** → the revision value to apply  

This command applies the revision exactly as supplied in the CSV just like in the [set revision command](SETREVISION.md).  
It does  **evaluate** `%nextrevision%`, `%previousrevision%`,`%initial%`, or bracketed variables—only literal revision values.

You may optionally output a **results CSV** that includes success/failure information for each processed row.

## SYNTAX
```bash
setrevisionfromsource -source -csv
```
## PARAMETERS

- `-source`  
  Path to the CSV file that contains the input dataset.  
  Required columns:  
  - `ID` — the file’s PDM ID inside the vault.  
  - `Revision` — the revision string supported by the revision scheme  

![setrevisionfromsource](/images/setrevisionfromsource.png)



>[!NOTE]
>  You can generate IDs and variables into a CSV by using the [search command](SEARCH.md).

- `-csv` *(optional)*  
  Path to an output CSV file where results will be written.  
  The results file contains:  
  - File ID  
  - Operation status  
  - Error message (if any)

## EXAMPLAES
```bash

setrevisionfromsource -source source.csv -csv results.csv

```

## NOTES

- This command updates the **PDM Revision** shown on the Version tab, not datacard variables.  
- All revisions must already exist in the active revision scheme.  
- If a file ID does not exist or cannot be updated, the error will be logged and processing continues for the remaining records.  
- Output CSV is optional; if omitted, results are printed to console only.

## AVAILABILITY
- 3.0.12