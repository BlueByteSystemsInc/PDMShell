---
description: Reference for PDMShell advanced search tokens.
title: Search Tokens | PDMShell | SOLIDWORKS PDM
---

# Search Tokens

Search tokens are key-value fields used inside the `-search` query. They map to SOLIDWORKS PDM search options or PDMShell result-shaping options.

```bash
search -search "Name=%.pdf;Recursive=true;StateName=Released"
```

## PDM Search Tokens

These tokens control which raw results PDM returns.

| Token | Description |
|-------|-------------|
| Name | File or folder name filter |
| AllVersions | Search all versions |
| ContentText | Full-text content search string |
| ContentTextExact | Exact match of content |
| ContentTextInBody | Search inside file body |
| ContentTextInProperties | Search in custom properties |
| ContentTextOr | Match any word |
| FindFiles | Include files in results |
| FindFolders | Include folders in results |
| FindItems | Include items in results |
| FolderID | Starting folder ID |
| HistoryAfter | Search history after date |
| HistoryBefore | Search history before date |
| HistoryString | History string search |
| HistoryStringConfiguration | Search configuration names |
| HistoryStringFileName | Search file names in history |
| HistoryStringLabels | Search labels in history |
| HistoryStringRevisionComment | Search revision comments |
| HistoryStringStateComment | Search state change comments |
| HistoryStringVariableValues | Search variable changes |
| HistoryStringVersionComment | Search version comments |
| Label | Search label text |
| LabelAfter | Labels after date |
| LabelBefore | Labels before date |
| LabelByUser | Labels created by user |
| LabelComment | Search label comment |
| Locked | Return checked-out files |
| LockedBy | Return files locked by user |
| Recursive | Include subfolders |
| StateAfter | State changes after date |
| StateBefore | State changes before date |
| StateByUser | User who changed state |
| StateHistoric | Search historic states |
| StateID | Workflow state ID |
| StateName | Workflow state name |
| Unlocked | Return checked-in files |
| VersionComment | Search version comment |
| VersionsAfter | Versions after date |
| VersionsBefore | Versions before date |
| VersionsByUser | Versions created by user |
| WorkflowName | Search by workflow name |

## PDMShell Search Tokens

These tokens are handled by PDMShell after the raw PDM results are collected.

| Token | Description |
|-------|-------------|
| Favorite | Uses a PDM search favorite |
| DuplicatedBy | Groups duplicate results by a field or PDM variable |
| GroupBy | Alias for `DuplicatedBy` |
| SortBy | Sorts all results, or each group when `GroupBy` is used |
| SortOrder | Optional sort direction: `Asc`, `Ascending`, `Desc`, or `Descending` |
| SortDirection | Alias for `SortOrder` |
| Strategy | Selects which sorted results are processed |
| DuplicatesStrategy | Alias for `Strategy` |
| Edit | Performs checkout and check-in on matching results for supported commands |

>[!Important]
> `SortBy`, `GroupBy`, `DuplicatedBy`, and `Strategy` require PDMShell to collect the full matching result set before it can return the final results. Use narrow filters when searching large folders or recursive folder trees.

## Default Behavior

`FolderID` defaults to the active directory.

`Recursive` defaults to the command's recursive flag.

`FindFolders` defaults to the command's include-folders flag.

`FindFiles` is always enabled for file searches.

## Dates

Date tokens use `yyyyMMdd`.

```bash
Name=%.sldprt;VersionsBefore=20200101
```

## Related Articles

- [Advanced search overview](advancedsearch.md)
- [Variable search](search-variables.md)
- [Result shaping](search-result-shaping.md)
- [Search favorites](search-favorites.md)
