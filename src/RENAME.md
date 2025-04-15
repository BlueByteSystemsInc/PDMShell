# RENAME Command Documentation

## DESCRIPTION:
Renames a specified file.

## SYNTAX:
rename [-filePath filePath] [-val value] [-search search]

## PARAMETERS:
-filePath filePath - The filerename.
-val value - The new name for the file.
-search search - The search operation to use.

## EXAMPLES:
rename -filePath "oldname.sldprt" -val "newname.sldprt"

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

## EXAMPLES:
If you use the value `"$filename_$date_$version"`, it will be replaced with the file name, current date, and version, resulting in something like `"oldname_10-12-2023_3"`.