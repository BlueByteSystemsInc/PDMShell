---
description: Performs a check out operation on a specified file or many files.
title: CHECKOUT Command Documentation | PDMShell | SOLIDWORKS PDM
---
# CHECKOUT Command Documentation

## DESCRIPTION:
Performs a check out operation on a specified file or many files.

## SYNTAX:
```bash
checkout -search -recursive -filePath
```
## PARAMETERS:
-`search`: Search keyword

-`filePath`: The file(s) to be checked out. This is the default parameter

-`recursive`: Recursively check out all files in the current directory. Use in combination with search

## EXAMPLES:
```bash
checkout -filePath file1.sldprt
```
## REMARKS:
- The search parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.

## TUTORIAL:
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/checkout.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>