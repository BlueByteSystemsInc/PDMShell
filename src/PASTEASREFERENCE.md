---
description: Appends one custom reference file to a source file or to files found by search.
title: pasteasreference Command | PDMShell | SOLIDWORKS PDM
---
# pasteasreference
## Description
Appends one custom reference file to a source file or to files found by search in SOLIDWORKS PDM.

The `pasteasreference` command uses `filePath` as the reference file to append. Use `source` to append that reference to one file, or use [`search`](SEARCH.md) to append that reference to multiple matching files.

This command is useful when a workflow creates or finds a supporting file and then needs to append it as a custom reference to one or more target files.

## Syntax

```text
pasteasreference -filePath reference_file (-source source_file | -search search_query) [-recursive]
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-filePath` | Mode-dependent | See parameter details below. |
| `-source` | Mode-dependent | See parameter details below. |
| `-search` | Mode-dependent | See parameter details below. |
| `-recursive` | No | See parameter details below. |

### Parameter Details

- `filePath` Required. Reference file to append.
- `source` Optional. Single file that will receive the appended reference. Use either `source` or [`search`](SEARCH.md).
- [`search`](SEARCH.md) Optional. Search query used to find files that will receive the appended reference. Use either `source` or [`search`](SEARCH.md).
- `recursive` Optional. When used with [`search`](SEARCH.md), includes matching files in subfolders.

## Validation
- `filePath` is required.
- Specify either `source` or [`search`](SEARCH.md), but not both.
- `recursive` is only valid when used with [`search`](SEARCH.md).

## Behavior
- Appends the `filePath` reference to each selected target file.
- Does not clear existing custom references.
- Uses a quantity of `1` for the appended custom reference.
- Skips a target file if it is the same file as `filePath`.
- Skips duplicates.

## Examples
```bash
# pasteasreference
pasteasreference -filePath "Part.sldprt" -source "Assembly.sldasm"

# pasteasreference
pasteasreference -filePath "Part.sldprt" -search "Name=%.sldasm"

# pasteasreference
pasteasreference -filePath "Part.sldprt" -search "Name=%.sldasm" -recursive
```

## Remarks
- This command modifies custom references directly in SOLIDWORKS PDM.
- Existing custom references are preserved.
- If the selected target already has the reference, PDMShell reports it and does not add a duplicate.

## Availability
Available since PDMShell 4.0.0.
