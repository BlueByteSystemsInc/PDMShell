---
description: Creates a new variable.
title: MKVAR Command Documentation | PDMShell | SOLIDWORKS PDM
---
# MKVAR Command Documentation

## DESCRIPTION:
Creates a new variable.

## SYNTAX:
```bash
mkvar -name -varType -mkvarflags -mkvarattributes 
```
## PARAMETERS:
- `name`: The name of the variable to create.

- `varType`: The type of the variable.

- `mkvarflags`: The flags for the variable.

- `mkvarattributes`: The attributes for the variable. Seperated by `#`

## EXAMPLES:
```bash
mkvar -name "NewVariable" -varType "Text" -mkvarflags "ReadOnly" -mkvarattributes "Attribute1#Attribute2"
```


## VAR TYPE VALUES:

| Description                  |
|------------------------------|
| None                         |
| Text                         |
| Int                          |
| Float                        |
| Bool                         |
| Date                         |

## MKVAR FLAGS VALUES:

| Value | Description                                                         |
|-----------------------------------------------------------------------------|
| Unique | Values of the variable must be unique; only used for files, ignored for folders |
| Mandatory | Missing values are not permitted; only used for files, ignored for folders |
| VerFreeUpdateAll | Every version and every revision, regardless access, workflow states etc., are affected by the variable update |
| VerFreeLatest | Only the latest version is affected by the variable update  |