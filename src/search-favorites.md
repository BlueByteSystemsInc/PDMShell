---
description: Use SOLIDWORKS PDM search favorites from PDMShell search queries.
title: Search Favorites | PDMShell | SOLIDWORKS PDM
---

# Search Favorites

Use the `Favorite` token to run a SOLIDWORKS PDM search favorite from PDMShell.

```bash
search -search "Favorite=MY SEARCH FAVORITE NAME"
```

Search favorites are useful when the criteria are already configured in the PDM search tool and you want to reuse them from PDMShell commands or scripts.

## Examples

List results from a favorite:

```bash
search -search "Favorite=Released PDFs"
```

Use a favorite with a command that accepts `-search`:

```bash
delete -search "Favorite=Old Export PDFs"
```

## Result Shaping

When a favorite returns many results, you can combine it with result-shaping tokens when supported by your workflow.

```bash
search -search "Favorite=PDF Exports;SortBy=FileDate;Strategy=ExcludeFirst"
```

>[!Important]
> If a favorite returns a broad result set, adding `SortBy`, `GroupBy`, `DuplicatedBy`, or `Strategy` requires PDMShell to collect the full result set before returning final results. Keep favorites scoped when using result shaping.

## Related Articles

- [Advanced search overview](advancedsearch.md)
- [Search tokens](search-tokens.md)
- [Result shaping](search-result-shaping.md)
