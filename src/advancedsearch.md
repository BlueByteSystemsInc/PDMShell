---
description: Learn how PDMShell advanced search works and how to build reliable search queries.
title: Advanced Search Overview | PDMShell | SOLIDWORKS PDM
---

# Advanced Search Overview

PDMShell advanced search extends SOLIDWORKS PDM search so the same `-search` query can be used by commands such as [`search`](SEARCH.md), [`delete`](DELETE.md), [`checkout`](CHECKOUT.md), [`get`](GET.md), [`setvar`](SETVAR.md), and [`transition`](TRANSITION.md).

Use this page for the search mental model. Use the focused articles for details:

- [Search tokens](search-tokens.md)
- [Variable search](search-variables.md)
- [Result shaping](search-result-shaping.md)
- [Search favorites](search-favorites.md)

## How Search Is Processed

PDMShell search has two stages:

1. SOLIDWORKS PDM returns the raw matching files and folders.
2. PDMShell optionally shapes those results by sorting, grouping, and applying a result-selection strategy.

Simple filter-only searches can be served as PDM returns results. Result-shaping searches must first collect the full matching result set.

```text
PDM search
  -> raw matching results
  -> optional SortBy
  -> optional GroupBy or DuplicatedBy
  -> optional Strategy
  -> final results passed to the command
```

>[!Important]
> `SortBy`, `GroupBy`, `DuplicatedBy`, and `Strategy` are result-shaping operations. PDMShell must first collect all matching PDM search results, then sort, group, and apply the strategy. Be careful using these options with broad recursive searches that may return hundreds or thousands of files. Narrow the search with `Name`, variables, folder scope, state, date, or other filters before applying result selection.

## Simple Searches

If no operators are present, the entire input is treated as a `Name` filter.

```bash
pump.sldprt
assembly_1001
%.sldasm
```

These are equivalent to:

```bash
Name=pump.sldprt
Name=assembly_1001
Name=%.sldasm
```

## Advanced Syntax

Multiple conditions are separated with semicolons.

```bash
Name=%Pump%;Recursive=true;VersionsBefore=20200101
```

Escaping rules:

```bash
\; inserts a semicolon
\= inserts an equals sign
\\ inserts a literal backslash
```

Example:

```bash
Name=Valve\=A;Label=Released\;Approved
```

## Wildcards

PDMShell supports the same SQL-style wildcard patterns used by SOLIDWORKS PDM.

| Wildcard | Meaning | Example | Result |
|----------|---------|---------|--------|
| `%` | Matches zero or more characters | `%.sldprt` | Returns all part files |
| `_` | Matches exactly one character | `pump_.sldprt` | Matches `pump1.sldprt` and `pumpA.sldprt`, but not `pump10.sldprt` |

## Common Examples

Search by name:

```bash
Name=%Valve%
```

Search recursively:

```bash
Name=%.pdf;Recursive=true
```

Combine file name, workflow state, and a PDM variable:

```bash
Name=%Pump%;StateName=Released;@Revision!=A
```

Sort all PDFs by file date and exclude the first sorted result:

```bash
search -search "Name=%.pdf;SortBy=FileDate;Recursive=true;Strategy=ExcludeFirst" -columns FileDate
```

Keep the newest PDF in each duplicate-name group:

```bash
search -search "Name=%.pdf;Recursive=true;GroupBy=Name;SortBy=FileDate;SortOrder=Desc;Strategy=KeepFirst"
```

## Related Articles

- [Search command reference](SEARCH.md)
- [Search tokens](search-tokens.md)
- [Variable search](search-variables.md)
- [Result shaping](search-result-shaping.md)
- [Search favorites](search-favorites.md)

## Technical Support

Please reach out to us if you have a premium license or are considering getting one from our contact [page](https://bluebyte.biz/contact) on our main website.
