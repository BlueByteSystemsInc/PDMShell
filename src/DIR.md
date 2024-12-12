# DIR Command Documentation

## DESCRIPTION:
Displays a list of files and subdirectories in a directory.

## SYNTAX:
dir [-d directory] [-sort sort] [-cols columns] [-csv CSV] [-refresh]

## PARAMETERS:
-d directory - The directory to display files from.

-sort sort - The sorting order for the displayed files.

-cols columns - The columns to display, separated by commas.

-csv CSV - Export the directory listing to a CSV file.

-refresh - Refresh the session to load the current files and sub-folders in the active directory.

## EXAMPLES:
dir -d "C:\Vault\Documents"
dir -d "C:\Vault\Documents" -sort "name" -cols "name,size,date" -csv "output.csv" -refresh

## REMARKS:
- Use the `-refresh` parameter to force the session to load the current files and sub-folders in the active directory. Do not use this when the current folder has many items.
- The CSV file will be checked into the current directory.