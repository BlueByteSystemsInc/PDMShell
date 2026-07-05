---
description: Gets the value of a variable for a specified file or folder directly from the database.
title: getvarfromdb Command | PDMShell | SOLIDWORKS PDM
---
# getvarfromdb
## Description
Gets the value of a variable for a specified file or folder directly from the database.

## Syntax

```text
getvarfromdb -filePath -variableName -configNames
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-filePath` | Yes | The file or folder to get the variable from. |
| `-variableName` | Yes | The variable name to retrieve from the database. |
| `-configNames` | Yes | The configuration names to retrieve the variable from, separated by commas. |

### Parameter Details

- `filePath` :  
  The file or folder to get the variable from.

- `variableName` :  
  The variable name to retrieve from the database.

- `configNames` :  
  The configuration names to retrieve the variable from, separated by commas.

## Examples
getvarfromdb -f "file1.sldprt" -variableName "CustomVar"

## Remarks
- The configuration names should be separated by commas.
- This command will always return the latest value.

## Availability
Available since PDMShell 2.0.0.
