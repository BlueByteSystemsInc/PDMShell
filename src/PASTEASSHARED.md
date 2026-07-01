---
description: Shares one SOLIDWORKS PDM file or files found by search into another vault folder.
title: pasteasshared Command | PDMShell | SOLIDWORKS PDM
---
# pasteasshared
## Description
Shares one SOLIDWORKS PDM file, or files found by search, into another vault folder.

The `pasteasshared` command uses `filePath` or [`search`](SEARCH.md) to select the source file or files. The `directory` parameter is the destination vault folder where the shared file entries are created.

This command uses the SOLIDWORKS PDM shared-file behavior. It does not create a copy of the file; it shares the same PDM file into another folder.

## Syntax
```bash
pasteasshared (-filePath file_path | -search search_query) -directory target_vault_folder [-recursive]
```

## Parameters
- `filePath` Optional. Single source file to share. Use either `filePath` or [`search`](SEARCH.md).
- `search` Optional. Search query used to find files to share. Use either `filePath` or `search`.
- `directory` Required. Destination vault folder where the shared file entries are created.
- `recursive` Optional. When used with `search`, includes matching files in subfolders.

## Validation
- `directory` is required.
- Specify either `filePath` or `search`, but not both.
- `recursive` applies only when using `search`.

## Behavior
- Shares each selected source file into the destination folder.
- Keeps the same PDM file ID because this is a shared file, not a copied file.
- Reports files that cannot be shared, for example when a file with the same name already exists in the destination folder or the user does not have permission.
- Skips duplicate search results before attempting to share.

## Examples
```bash
# pasteasshared
pasteasshared -filePath "Part.sldprt" -directory "Shared Parts"

# pasteasshared
pasteasshared -search "Name=%.sldprt" -directory "Shared Parts"

# pasteasshared
pasteasshared -search "Name=%.sldprt" -directory "Shared Parts" -recursive
```

## Remarks
- The destination `directory` must be a vault folder.
- If a file with the same name already exists in the destination folder, SOLIDWORKS PDM refuses the share.
- The user must have permission to share the selected files into the destination folder.

## Availability
Available since PDMShell 4.0.9.
