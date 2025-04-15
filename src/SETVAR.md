# SETVAR Command Documentation

## DESCRIPTION:
Sets the value of a variable for a specified checked out file or many checked out files.

## SYNTAX:
```bash
setvar [-filePath|-search]  -variableName -value [-configNames] [-stringformat] 
```
## PARAMETERS:
-`filePath`: The file to set the variable for.

-`variableName`: The variable to set.

-`value`: The value to assign to the variable.

-`configNames`: The configuration names to set the variable for, separated by commas.

-`search`: The search operation to use.

-`stringformat`: string format. See remarks section. 

## EXAMPLES:
```bash
setvar -filePath file1.sldprt -variableName Description -value $value -stringformat UpperCase # Upper case the current value.
```
## EVALUATION:
The `value` parameter gets evaluated by PDMShell. This feature allows you to use placeholders in the new value, which will be replaced with actual values from the file or folder. This can be useful to dynamically generate new values based on file or folder properties or other variables. The following placeholders are supported:

### For Files:
  - `$value`: Existing value of the variable.
  - `$name`: The file name with extension.
  - `$nameWithoutExtension`: The file name without extension.
  - `$username`: The name of the logged-in user.
  - `$vaultName`: The name of the vault.
  - `$yyyy`: The current year.
  - `$mm`: The current month (two digits).
  - `$hh`: The current hour (two digits).
  - `$mi`: The current minute (two digits).
  - `$ss`: The current second (two digits).
  - `$id`: The file ID.
  - `$revision`: The current revision of the file (PDM revision, not the PDM variable).
  - `$date`: The current date.
  - `$time`: The current time in the current locale.
  - `$version`: The current version of the file.
  - `$extension`: The file extension.
  - `$fullyQualifiedName`: The full local path of the file.
  - `$fullyQualifiedFolderName`: The full local path of the folder containing the file.
  - `$folderName`: The name of the folder containing the file.

### For Folders:
  - `$value`: Existing value of the variable.
  - `$name`: The folder name.
  - `$folderName`: The name of the parent folder.
  - `$id`: The folder ID.
  - `$fullyQualifiedName`: The full local path of the folder.
  - `$username`: The name of the logged-in user.
  - `$vaultName`: The name of the vault.
  - `$yyyy`: The current year.
  - `$mm`: The current month (two digits).
  - `$hh`: The current hour (two digits).
  - `$mi`: The current minute (two digits).
  - `$ss`: The current second (two digits).
  - `$date`: The current date.
  - `$time`: The current time in the current locale.


Additionally, you can use variables enclosed in square brackets (e.g., `[VariableName]`) to include values from other variables. These variables are dynamically resolved based on the context of the file or folder.

## REMARKS
- The `configNames` parameter should be separated by commas. If omitted, PDMShell uses `@` for configuration-supported documents.
- The `search` parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.
- The `stringformat` parameter allows you to format the value of the variable using predefined string formatting options. The following formats are supported:
  - **UpperCase**: Converts the entire string to uppercase.
  - **LowerCase**: Converts the entire string to lowercase.
  - **CamelCase**: Converts the string to camel case, where the first word is lowercase, and subsequent words are capitalized (e.g., `exampleString`).
  - **FirstLetterCase**: Capitalizes the first letter of the string and converts the rest to lowercase (e.g., `Example`).

## TUTORIAL:
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/setvar.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>