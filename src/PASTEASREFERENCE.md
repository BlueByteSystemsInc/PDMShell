---
description: Clears and replaces a file's custom references with a file or search result.
title: PASTEASREFERENCE Command Documentation | PDMShell | SOLIDWORKS PDM
---

# PASTEASREFERENCE Command Documentation

## DESCRIPTION

Clears and replaces a file's custom references in SOLIDWORKS PDM.

The `pasteasreference` command removes the existing custom references from the source file, then adds one or more files as custom references. References can be supplied as a single file path or found with a search query.

This command is useful when rebuilding custom references from a controlled source, such as a selected file, a search result, or a scripted workflow.

## SYNTAX

```bash
pasteasreference -source original_file [-filePath reference_file | -search search_query] [-recursive]
```

## PARAMETERS

- `source` Required. Original file that will receive the custom references.
- `filePath` Optional. Single file to paste as a custom reference.
- `search` Optional. Search query used to find files to paste as custom references.
- `recursive` Optional. When used with `search`, includes matching files in subfolders.

## VALIDATION

- `source` is required.
- Specify either `filePath` or `search`, but not both.
- `recursive` is only valid when used with `search`.

## BEHAVIOR

- Clears all existing custom references from the source file.
- Adds each selected reference file as a custom reference.
- Uses a quantity of `1` for each added custom reference.
- Skips the source file if it appears in the reference results.
- Removes duplicate reference files from the operation.

## EXAMPLES

```bash
# Replace custom references with a single file
pasteasreference -source "Assembly.sldasm" -filePath "Part.sldprt"

# Replace custom references with all matching parts in the current folder
pasteasreference -source "Assembly.sldasm" -search "%.sldprt"

# Replace custom references with matching parts in the current folder and subfolders
pasteasreference -source "Assembly.sldasm" -search "%.sldprt" -recursive true
```

## REMARKS

- This command modifies custom references directly in SOLIDWORKS PDM.
- Existing custom references are removed before new references are added.
- Use this command carefully in production vaults because it replaces the current custom reference set.
