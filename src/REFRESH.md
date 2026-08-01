---
title: refresh Command | PDMShell
description: Refresh current SOLIDWORKS PDM file metadata and state without downloading or modifying files.
keywords: PDMShell refresh command, refresh PDM metadata, SOLIDWORKS PDM file state
---

# `refresh` command

Refreshes the current SOLIDWORKS PDM metadata and state for one file or files found by search. It does not download, rebuild, or modify files.

Use `refresh` when another user or process may have changed a file's version, variables, workflow state, or checkout information during the current PDMShell session.

## Syntax

```text
refresh (-filePath file_path | -search search_expression) [-recursive]
```

## Parameters

| Parameter | Short name | Description |
| --- | --- | --- |
| `-filePath` | `-f` | Refreshes one file. Absolute and relative paths are supported. |
| `-search` | `-s` | Refreshes files matching a search in the current directory. |
| `-recursive` | `-r` | Includes matching files in subfolders when used with `-search`. |

Specify either `-filePath` or `-search`, but not both.

## Examples

Refresh one file:

```text
refresh -filePath "Part.sldprt"
```

Refresh all SOLIDWORKS part files in the current directory:

```text
refresh -search "Name=%.sldprt"
```

Refresh checked-out files in the current directory and its subfolders:

```text
refresh -search "Locked=true" -recursive
```

## Refresh compared with other commands

- `refresh` reloads PDM information without downloading or changing files.
- [`get`](GET.md) downloads a selected file version to the local vault view.
- [`clearcache`](CLEARCACHE.md) removes locally cached file content.
- [`rebuild`](REBUILD.md) opens and rebuilds supported SOLIDWORKS documents.

The `refresh` command is available in the Free and Premium editions of PDMShell.
