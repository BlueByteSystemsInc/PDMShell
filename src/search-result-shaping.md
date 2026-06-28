---
description: Sort, group, and select PDMShell search results with SortBy, GroupBy, DuplicatedBy, and Strategy.
title: Search Result Shaping | PDMShell | SOLIDWORKS PDM
---

# Search Result Shaping

Result shaping is the part of PDMShell search that runs after SOLIDWORKS PDM returns matching files and folders.

Use result shaping when you need to sort search results, find duplicate groups, keep only one item from each group, or exclude one item from each group.

```text
PDM search
  -> raw matching results
  -> SortBy
  -> GroupBy or DuplicatedBy
  -> Strategy
  -> final results passed to the command
```

>[!Important]
> `SortBy`, `GroupBy`, `DuplicatedBy`, and `Strategy` require PDMShell to collect all matching PDM search results before sorting, grouping, and applying the strategy. Be mindful when using these options with broad recursive searches that may return hundreds or thousands of results. Narrow the search first with `Name`, variables, folder scope, state, dates, or other filters.

## Tokens

| Token | Description |
|-------|-------------|
| DuplicatedBy | Groups results by a field or variable. Only groups with more than one item are processed. |
| GroupBy | Alias for `DuplicatedBy` |
| SortBy | Sorts all results before applying the strategy. If `GroupBy` is specified, each group is sorted separately. |
| SortOrder | Optional sort direction: `Asc`, `Ascending`, `Desc`, or `Descending` |
| SortDirection | Alias for `SortOrder` |
| Strategy | Selects which sorted results are processed |
| DuplicatesStrategy | Alias for `Strategy` |

Without `GroupBy`, `SortBy` and `Strategy` are applied once to all matching results.

With `GroupBy` or `DuplicatedBy`, PDMShell processes only duplicate groups. `SortBy` and `Strategy` are applied separately inside each group.

## Supported Fields

Supported `DuplicatedBy`, `GroupBy`, and `SortBy` values include:

- `Name`
- `FileDate`
- `Hash`
- `State`
- `Version`
- `CurrentVersion`
- `Revision`
- `FileSize`
- `ID`
- `Path`
- `FolderID`
- PDM variables such as `@Revision` or `@PartNumber`

To use `Hash`, files must be locally cached.

## Default Sort Order

When `SortOrder` is not specified:

- Date, version, revision, and size fields sort descending by default.
- Name, path, state, and ID fields sort ascending by default.

## Strategies

| Strategy | Description |
|----------|-------------|
| KeepFirst | Keeps only the first item after sorting. |
| ExcludeFirst | Keeps every item except the first after sorting. |
| KeepLast | Keeps only the last item after sorting. |
| ExcludeLast | Keeps every item except the last after sorting. |
| KeepNewest | Keeps the newest item. |
| ExcludeNewest | Keeps every item except the newest. |
| KeepOldest | Keeps the oldest item. |
| ExcludeOldest | Keeps every item except the oldest. |
| KeepHighestVersion | Keeps the item with the highest PDM version. |
| ExcludeHighestVersion | Keeps every item except the one with the highest PDM version. |
| KeepLowestVersion | Keeps the item with the lowest PDM version. |
| ExcludeLowestVersion | Keeps every item except the one with the lowest PDM version. |
| KeepLatestRevision | Keeps the item with the latest revision value. |
| ExcludeLatestRevision | Keeps every item except the one with the latest revision value. |
| KeepLargest | Keeps the largest file. |
| ExcludeLargest | Keeps every item except the largest file. |
| KeepSmallest | Keeps the smallest file. |
| ExcludeSmallest | Keeps every item except the smallest file. |

## Examples

List duplicate SOLIDWORKS files by name:

```bash
search -search "Name=%.sld%;Recursive=true;DuplicatedBy=Name" -columns "FileDate,Hash,Revision"
```

List duplicate SOLIDWORKS files by revision:

```bash
search -search "Name=%.sld%;Recursive=true;DuplicatedBy=@Revision" -columns "FileDate,Hash,Revision"
```

List all PDFs except the oldest one after sorting the full result set by file date:

```bash
search -search "Name=%.pdf;SortBy=FileDate;Recursive=true;Strategy=ExcludeFirst" -columns FileDate
```

List the newest PDF in each duplicate-name group:

```bash
search -search "Name=%.pdf;Recursive=true;GroupBy=Name;SortBy=FileDate;SortOrder=Desc;Strategy=KeepFirst"
```

Delete every PDF except the newest file in each duplicate-name group:

```bash
delete -search "Name=%.pdf;Recursive=true;GroupBy=Name;SortBy=FileDate;SortOrder=Desc;Strategy=ExcludeFirst"
```

## Related Articles

- [Advanced search overview](advancedsearch.md)
- [Search tokens](search-tokens.md)
- [Variable search](search-variables.md)
