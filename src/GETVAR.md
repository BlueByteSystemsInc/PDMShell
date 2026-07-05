---
description: Gets the value of a variable for a specified file or folder.
title: getvar Command | PDMShell | SOLIDWORKS PDM
---
# getvar
## Description
Gets the value of a variable for a specified file or folder.

## Syntax

```text
getvar -filePath -variableName -configNames -clear -version
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-filePath` | Yes | The file or folder to get the variable from. |
| `-variableName` | Yes | The variable name to retrieve. |
| `-configNames` | Yes | The configuration names to retrieve the variable from, separated by commas. |
| `-clear` | Yes | Clears the variable value. |
| `-version` | Yes | The version of the file to retrieve the variable from. |

### Parameter Details

- `filePath` :  
  The file or folder to get the variable from.

- `variableName` :  
  The variable name to retrieve.

- `configNames` :  
  The configuration names to retrieve the variable from, separated by commas.

- `clear` :  
  Clears the variable value.

- `version` :  
  The version of the file to retrieve the variable from.

## Examples
```bash
getvar -filePath "file1.sldprt" -variableName "CustomVar"
```
## Remarks
- The configuration names should be separated by commas.
- The variable must be in the data card.
- **This comand will return what's in the locale cache which may not be necessarily the latest version. For that, please use [`getvarfromdb`](GETVARFROMDB.md)**.

## Availability
Available since PDMShell 2.0.0.
