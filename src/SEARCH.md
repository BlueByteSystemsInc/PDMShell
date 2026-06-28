---
description: Searches for files and folders in the current vault directory.
title: SEARCH Command | PDMShell | SOLIDWORKS PDM
---
# SEARCH Command
## Description
The `search` command allows users to search for files and folders in the current directory. It supports recursive searches, filtering, and output customization.

## Syntax
```bash
search -search -recursive -includesubfolders -csv -columns -duplicatesstrategy
```

## Parameters
- `search`: Search keyword. This supports SQL wildcard %.

- `recursive`: Searches through all subdirectories recursively.

- `includesubfolders`: Includes subfolders in the search results.

- `csv`: Outputs the search results in CSV format.

- `columns`: Specifies the columns to include in the output seperated by a comma.

- `duplicatesstrategy`: Defines how duplicate results are resolved when `DuplicatedBy` or `GroupBy` is specified in the search query. This parameter is supported for backward compatibility; you can also put `Strategy` or `DuplicatesStrategy` directly inside the `search` query.

>[!NOTE]
> **Special columns**: You can use `FileDate`, [`version`](VERSION.md), `State` and `Hash` to list information that is not captured in the datacard. This is useful when searching for duplicates. The hash requires that the file be locally cached. Example:

```bash 
## lists all duplicates in the current directory by name and prints their file date, hash and revision
search -search "Name=%.sld%;Recursive=true;DuplicatedBy=Name" -columns "FileDate,Hash,Revision"
```

>[!NOTE]
> Advanced search capabilities can be used in the `-search` parameter. See [Advanced Search](advancedsearch.md), [Search Tokens](search-tokens.md), [Variable Search](search-variables.md), [Result Shaping](search-result-shaping.md), and [Search Favorites](search-favorites.md).


## Examples
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


## Result Selection and Duplicate Strategy Options
Result selection is handled by the shared search engine. This means the same query options can be used by any command that accepts `-search`, such as `search`, `delete`, `checkout`, `get`, `setvar`, and `transition`.

Use these query tokens to sort and select search results. For the full reference, see [Search Result Shaping](search-result-shaping.md).

>[!Important]
> `SortBy`, `GroupBy`, `DuplicatedBy`, and `Strategy` require PDMShell to collect all matching PDM search results before sorting, grouping, and applying the strategy. Be mindful when using these options with broad recursive searches that may return hundreds or thousands of files.

| Token | Description |
|-----------|-------------|
| DuplicatedBy or GroupBy | Optional. Groups results by a field or variable. When specified, only groups with more than one item are processed. |
| SortBy | Sorts the matching results before applying the strategy. If `GroupBy` is specified, each group is sorted separately. |
| SortOrder or SortDirection | Optional. Use `Asc`, `Ascending`, `Desc`, or `Descending`. |
| Strategy or DuplicatesStrategy | Selects which results in each sorted group are processed. |

Supported `DuplicatedBy`, `GroupBy`, and `SortBy` values include `Name`, `FileDate`, `Hash`, `State`, `Version`, `CurrentVersion`, `Revision`, `FileSize`, `ID`, `Path`, `FolderID`, and PDM variables such as `@Revision` or `@PartNumber`.

Without `GroupBy`, `SortBy` and `Strategy` are applied once to all matching results. With `GroupBy`, they are applied separately inside each duplicate group.

When `SortOrder` is not specified, date/version/revision/size fields sort descending by default, while name/path/state/ID fields sort ascending by default.

The following strategies are supported for `Strategy`, `DuplicatesStrategy`, and the legacy `-duplicatesstrategy` parameter:

| Strategy | Description |
|-----------|-------------|
| KeepFirst | Keeps the first file in the sorted result set or each sorted group. |
| ExcludeFirst | Excludes the first file and keeps the remaining results. |
| KeepLast | Keeps the last file in the sorted result set or each sorted group. |
| ExcludeLast | Excludes the last file and keeps the remaining results. |
| KeepNewest | Keeps the newest file. |
| ExcludeNewest | Excludes the newest file and keeps the remaining results. |
| KeepOldest | Keeps the oldest file. |
| ExcludeOldest | Excludes the oldest file and keeps the remaining results. |
| KeepHighestVersion | Keeps the file with the highest PDM version. |
| ExcludeHighestVersion | Excludes the file with the highest PDM version. |
| KeepLowestVersion | Keeps the file with the lowest PDM version. |
| ExcludeLowestVersion | Excludes the file with the lowest PDM version. |
| KeepLatestRevision | Keeps the file with the latest revision value. |
| ExcludeLatestRevision | Excludes the file with the latest revision value. |
| KeepLargest | Keeps the file with the largest file size. |
| ExcludeLargest | Excludes the file with the largest file size. |
| KeepSmallest | Keeps the file with the smallest file size. |
| ExcludeSmallest | Excludes the file with the smallest file size. |

```bash
## Lists all duplicates in the current directory by name and prints their file date, hash and revision
search -search "Name=%.sld%;Recursive=true;DuplicatedBy=Name" -duplicatesstrategy KeepNewest -columns "FileDate,Hash,Revision"
```

```bash
## Lists all PDFs except the oldest one after sorting the full result set by file date
search -search "Name=%.pdf;SortBy=FileDate;Recursive=true;Strategy=ExcludeFirst" -columns FileDate
```

```bash
## Lists the newest PDF in each duplicate-name group
search -search "Name=%.pdf;Recursive=true;GroupBy=Name;SortBy=FileDate;SortOrder=Desc;Strategy=KeepFirst"
```

```bash
## Deletes all but the newest PDF in each duplicate-name group
delete -search "Name=%.pdf;Recursive=true;GroupBy=Name;SortBy=FileDate;SortOrder=Desc;Strategy=ExcludeFirst"
```

More examples and strategy details are available in [Search Result Shaping](search-result-shaping.md).

## Notes
- Ensure the current directory is set correctly before running the command.
- Use the `-columns` parameter to customize the output format. Data is pulled from @ for configuration-supported documents.

## Tutorial
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/search.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>

## Availability
Available since PDMShell 2.0.5.

## Last Updated
Updated in PDMShell 4.0.12 to add result shaping with `SortBy`, `SortOrder`, `GroupBy`, `DuplicatedBy`, and `Strategy`.
