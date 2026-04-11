---
description: Lists file references inside the SOLIDWORKS PDM vault using the Raw Reference Manager.
title: LISTREFERENCES Command Documentation | PDMShell | SOLIDWORKS PDM
---

# LISTREFERENCES Command Documentation

## DESCRIPTION
Lists file references inside the SOLIDWORKS PDM vault.

The `listreferences` command reads references stored inside files, without opening SOLIDWORKS, and allows you to:

- List references for a single file
- List references for multiple files using a search
- Export reference information to a CSV file
- Retrieve file IDs, folder IDs, full file paths, full reference paths, and reference IDs

This command is especially useful for auditing references, troubleshooting missing files, validating migrations, or identifying broken or external references.

## SYNTAX
```bash
listreferences -filepath -search -recursive -csv
```

## PARAMETERS
- `filepath` Optional. Lists references for a single file. If a relative path is provided, it is resolved against the current directory. When specified, the search parameter is ignored.
- `search` Optional. Search query used to find files whose references should be listed. The search is scoped to the current directory. Supports % wildcards. Can be combined with recursive.
- `recursive` Optional. When used with search, includes subfolders of the current directory when locating files whose references should be listed.
- `csv` Optional. Saves the reference listing results to a CSV file.

## CSV OUTPUT

The exported CSV contains the following columns:
```bash
FileID
FolderID
FilePath
ReferencePath
ReferenceID
ReferenceFileID
```

## EXAMPLES

```bash
# List references for a single assembly
listreferences -filepath speaker.sldasm
# List references for all assemblies in the current folder
listreferences -search %.sldasm
# List references recursively and export results to CSV
listreferences -search %.sldasm -recursive true -csv references.csv
```
## REMARKS
- Either filepath or search must be specified.
- If both are provided, filepath takes precedence.
- The search parameter only searches within the current directory unless recursive is specified.
- Files that do not contain references are still included in the CSV output.
- Reference paths may be blank for broken or unresolved references.
- ReferenceFileID will be blank if the referenced file cannot be found in the vault.
- This command is intended for reporting and auditing only and does not modify files.