---
description: Renames a specified file.
title: RENAME Command Documentation | PDMShell | SOLIDWORKS PDM
---
# RENAME Command Documentation

## DESCRIPTION:
Renames a specified file.

## SYNTAX:
```bash
rename -filePath -value -search
```
## PARAMETERS:
- `filePath`: The filerename.
- `value`: The new name for the file. **YOU MUST INCLUDE THE EXTENSION**
- `search`: The search operation to use.



## EXAMPLES:
```bash
rename -filePath "oldname.sldprt" -val "newname.sldprt"
```
## REMARKS:
- The search parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.

## VALUE EVALUATION:
The `value` parameter gets evaluated by PDMShell. PDMShell allows you to use placeholders in the new name, which will be replaced with actual values from the file. This can be useful to dynamically generate new names based on file properties or other variables. The following placeholders are supported:

- `$filename` - The file name without extension.
- `$id` - The file ID.
- `$revision` - The current revision of the file.
- `$date` - The current date.
- `$time` - The current time.
- `$version` - The current version of the file.
- `$extension` - The file extension.

Additionally, you can use variables enclosed in square brackets (e.g., `[VariableName]`) to include values from other variables.

>[!Note]
> Please read more information about placeholder evaluation [here](EVAL.md).


## EXAMPLES:
If you use the value `"$filename_$date_$version$extension"`, it will be replaced with the file name, current date, and version, resulting in something like `"oldname_10-12-2023_3"`.