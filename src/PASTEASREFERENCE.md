---
description: Appends one custom reference file to a source file or to files found by search.
title: PASTEASREFERENCE Command Documentation | PDMShell | SOLIDWORKS PDM
---

# PASTEASREFERENCE Command Documentation

## DESCRIPTION

Appends one custom reference file to a source file or to files found by search in SOLIDWORKS PDM.

The `pasteasreference` command uses `filePath` as the reference file to append. Use `source` to append that reference to one file, or use `search` to append that reference to multiple matching files.

This command is useful when a workflow creates or finds a supporting file and then needs to append it as a custom reference to one or more target files.

## SYNTAX

```bash
pasteasreference -filePath reference_file (-source source_file | -search search_query) [-recursive]
```

## PARAMETERS

- `filePath` Required. Reference file to append.
- `source` Optional. Single file that will receive the appended reference. Use either `source` or `search`.
- `search` Optional. Search query used to find files that will receive the appended reference. Use either `source` or `search`.
- `recursive` Optional. When used with `search`, includes matching files in subfolders.

## VALIDATION

- `filePath` is required.
- Specify either `source` or `search`, but not both.
- `recursive` is only valid when used with `search`.

## BEHAVIOR

- Appends the `filePath` reference to each selected target file.
- Does not clear existing custom references.
- Uses a quantity of `1` for the appended custom reference.
- Skips a target file if it is the same file as `filePath`.
- Skips duplicates.

## EXAMPLES

```bash
# Append Part.sldprt as a custom reference to one assembly
pasteasreference -filePath "Part.sldprt" -source "Assembly.sldasm"

# Append Part.sldprt as a custom reference to all matching assemblies in the current folder
pasteasreference -filePath "Part.sldprt" -search "Name=%.sldasm"

# Append Part.sldprt as a custom reference to matching assemblies in the current folder and subfolders
pasteasreference -filePath "Part.sldprt" -search "Name=%.sldasm" -recursive
```

## REMARKS

- This command modifies custom references directly in SOLIDWORKS PDM.
- Existing custom references are preserved.
- If the selected target already has the reference, PDMShell reports it and does not add a duplicate.
