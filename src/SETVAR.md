# SETVAR Command Documentation

## DESCRIPTION:
Sets the value of a variable for a specified file.

## SYNTAX:
setvar [-filePath filePath|-search search] -var variableName -val value [-configs configNames] 

## PARAMETERS:
-filePath filePath - The file to set the variable for.

-var variableName - The variable to set.

-val value - The value to assign to the variable.

-configs configNames - The configuration names to set the variable for, separated by commas.

-search search - The search operation to use.

## EXAMPLES:
setvar -filePath "file1.sldprt" -var "CustomVar" -value "NewValue"

## REMARKS:
- The `val` parameter gets evaluated by the `EvaluateAliases` function. This function allows you to use placeholders in the new value, which will be replaced with actual values from the file. This can be useful to dynamically generate new values based on file properties or other variables. The following placeholders are supported:

  - `$filename` - The file name without extension.
  - `$id` - The file ID.
  - `$revision` - The current revision of the file.
  - `$date` - The current date.
  - `$time` - The current time.
  - `$version` - The current version of the file.
  - `$extension` - The file extension.

  Additionally, you can use variables enclosed in square brackets (e.g., `[VariableName]`) to include values from other variables.

- The configuration names should be separated by commas.
- The search parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.

### Example:
If you use the value `"$filename_$date_$version"`, it will be replaced with the file name, current date, and version, resulting in something like `"oldname_10-12-2023_3"`.