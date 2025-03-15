# CD Command Documentation

## DESCRIPTION:
Changes the current PDM directory.

## SYNTAX:
cd [-d directory]

## PARAMETERS:
-d directory - The directory to switch to. The directory parameter can be a relative or absolute path in PDM.

## EXAMPLES:
cd -directory 'C:\Vault\NewFolder' // Navigates its newFolder
cd.. // Navigates to the parent folder
cd\ // Navigates to the root of the vault

## REMARKS:
- If the user just created a new folder and wants to `cd` to it using autocomplete, they need to use the `dir` command with the `-refresh` parameter to force the session to load the current files and sub-folders in the active directory. Using `-refresh` might affect the performance of the session if the current folder has too many files and sub-folders.