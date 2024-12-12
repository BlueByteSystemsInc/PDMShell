# CD Command Documentation

## DESCRIPTION:
Displays the name of, or changes, the current PDM directory.

## SYNTAX:
cd [-d directory] [-clipboardcd]

## PARAMETERS:
-d directory - The directory to switch to. The directory parameter can be a relative or absolute path in PDM.

-clipboardcd - Copies the path to your clipboard after switching to that directory.

## EXAMPLES:
cd -d 'C:\Vault\NewFolder'
cd -clipboardcd

## REMARKS:
- If the user just creates a new folder and wants to `cd` to it using autocomplete, they need to use the `dir` command with the `-refresh` parameter to force the session to load the current files and sub-folders in the active directory. Do not use this when the current folder has many items.