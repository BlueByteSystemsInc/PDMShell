# DIR Command Documentation

## DESCRIPTION:
Displays a list of files and subdirectories in a directory.

## SYNTAX:

```bash
dir -sort -columns -csv -refresh
```

## PARAMETERS:

-sort: The column name to sort the list of files and folders with.

-columns: The columns to display, separated by commas. These are PDM variables drawn from the @ tab.

-csv: Export the directory listing to a CSV file. Must include the csv extension

-refresh: Refreshes the session to load the current files and sub-folders in the active directory in the autocomplete list.

-recursive: Lists all files and all folders in the current directory recursively. 

## EXAMPLES:
```bash
dir  #"C:\Vault\Documents"
dir  -sort "name" -cols "description,partnumber" -csv "output.csv" -refresh
```

## REMARKS:

- Use the `-refresh` parameter to force the session to load the current files and sub-folders in the active directory. Do not use this when the current folder has many items.
- The CSV file will be checked into the current directory.