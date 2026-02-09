---
description: The SEARCH command allows users to search for files and folders in the current directory. It supports recursive searches, filtering, and output customization.
title: SEARCH Command Documentation | PDMShell | SOLIDWORKS PDM
---
# SEARCH Command Documentation

## DESCRIPTION:
The `search` command allows users to search for files and folders in the current directory. It supports recursive searches, filtering, and output customization.

## SYNTAX:
```bash
search -search -recursive -includesubfolders -csv -columns
```

## PARAMETERS:
- `search`: Search keyword. This supports SQL wildcard %.

- `recursive`: Searches through all subdirectories recursively.

- `includesubfolders`: Includes subfolders in the search results.

- `csv`: Outputs the search results in CSV format.

- `columns`: Specifies the columns to include in the output seperated by a comma.

>[!NOTE]
> **Special columns**: You can use `@LastModified` and `@Hash` to list the last date the file was modified as well as the hash. The hash requires that the file be locally cached. Example:

```bash 
search -search "Name=%.sld%;Recursive=true;DuplicatedBy=Name" -columns "@LastModified,@Hash,Revision"
```


>[!NOTE]
> We have introduced Advanced Search capabilities that can be used in the `-search` parameter. Please see more information [here](advancedsearch.md).

## EXAMPLES:
### Example 1: Basic Search
```bash
search -search % # prints all the files in the current directory
```
Performs a basic search in the current directory.

### Example 2: Recursive Search with Subfolders
```bash
search -search -recursive -includesubfolders # prints all the files and folders in the current directory
```
Searches all files and folders, including subdirectories.

### Example 3: Export Results to CSV
```bash
search -search -csv -columns "Description,PartNumber" # Prints all the files in the current directory with their descriptions and part numbers
```
Exports the search results to a CSV file with specified columns.

## NOTES:
- Ensure the current directory is set correctly before running the command.
- Use the `-columns` parameter to customize the output format. Data is pulled from @ for configuration-supported documents.

## TUTORIAL:
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/search.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>
