---
description: Prints file information for paths listed in a CSV source.
title: PRINTFROMSOURCE Command | PDMShell | SOLIDWORKS PDM
---
# PRINTFROMSOURCE Command
## Description
The `printfromsource` command prints file information for paths listed in a CSV source. The CSV file must contain a header and a list of complete file paths in the first column.

---

## Syntax
```bash
printfromsource -filePath -csv 
```

## Parameters
- `filePath`: (Required) The source file path. This must be a CSV file with one column:
 - file Path: Complete file path.
- `csv`: Specifies the output csv. This will contains information about files from the source parameter.

## Examples
Rename files using a source CSV file:
```bash
printfromsource -filePath "source.csv" -csv "output.csv" 
```

## Remarks
- The `filePath` parameter is mandatory and must point to a valid CSV file.
- The `csv` is the output from the verification process `printfromsource` performs:

| ID | Complete File Path | Folder ID | Checked Out | Where Used ID |
|----|---------------------|------------|--------------|----------------|
| 1  | C:\Vault\ProjectA\Part1.SLDPRT | 105 | FALSE | 5021 |
| 2  | C:\Vault\ProjectB\Drawing1.SLDDRW | 106 | TRUE | 5022 |
| 3  | C:\Vault\ProjectC\Assembly1.SLDASM | 107 | FALSE | 5023 |

## Availability
Available since PDMShell 2.0.0.
