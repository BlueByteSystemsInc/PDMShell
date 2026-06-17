---
description: Creates a new PDM variable.
title: MKVAR Command | PDMShell | SOLIDWORKS PDM
---
# MKVAR Command
## Description
Creates a new variable.

## Syntax
```bash
mkvar -name -varType -mkvarflags -mkvarattributes 
```
## Parameters
- `name`: The name of the variable to create.

- `varType`: The type of the variable.

- `mkvarflags`: The flags for the variable.

- `mkvarattributes`: The attributes for the variable. Seperated by `#`

## Examples
```bash
mkvar -name "NewVariable" -varType "Text" -mkvarflags "ReadOnly" -mkvarattributes "Attribute1#Attribute2"
```


## Variable Type Values
| Description                  |
|------------------------------|
| None                         |
| Text                         |
| Int                          |
| Float                        |
| Bool                         |
| Date                         |

## Mkvar Flag Values
| Value | Description                                                         |
|-----------------------------------------------------------------------------|
| Unique | Values of the variable must be unique; only used for files, ignored for folders |
| Mandatory | Missing values are not permitted; only used for files, ignored for folders |
| VerFreeUpdateAll | Every version and every revision, regardless access, workflow states etc., are affected by the variable update |
| VerFreeLatest | Only the latest version is affected by the variable update  |

## Availability
Available since PDMShell 2.0.0 or earlier.
