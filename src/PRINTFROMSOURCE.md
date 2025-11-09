---
description: The PRINTFROMSOURCE command is used to validate a list filepaths the PDM system based on a source CSV file. This command supports alias evaluation for dynamic renaming.
title: PRINTFROMSOURCE Command Documentation | PDMShell | SOLIDWORKS PDM
---
# PRINTFROMSOURCE Command Documentation

## DESCRIPTION:
The `printfromsource` command is used to validate a list of filepaths in the PDM system based on a source CSV file. The CSV file must contain a header and a list of complete file paths in the first column.

---

## SYNTAX:
```bash
printfromsource -filePath -csv 
```

## PARAMETERS:
- `filePath`: (Required) The source file path. This must be a CSV file with one column:
 - file Path: Complete file path.
- `csv`: Specifies the output csv. This will contains information about files from the source parameter.

## EXAMPLES:
Rename files using a source CSV file:
```bash
printfromsource -filePath "source.csv" -csv "output.csv" 
```

## REMARKS:
- The `filePath` parameter is mandatory and must point to a valid CSV file.
- The `csv` is the output from the verification process `printfromsource` performs:

| ID | Complete File Path | Folder ID | Checked Out | Where Used ID |
|----|---------------------|------------|--------------|----------------|
| 1  | C:\Vault\ProjectA\Part1.SLDPRT | 105 | FALSE | 5021 |
| 2  | C:\Vault\ProjectB\Drawing1.SLDDRW | 106 | TRUE | 5022 |
| 3  | C:\Vault\ProjectC\Assembly1.SLDASM | 107 | FALSE | 5023 |

