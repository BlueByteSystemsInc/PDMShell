---
description: Updates file references inside the SOLIDWORKS PDM vault using the Raw Reference Manager.
title: UPDATEREFERENCES Command Documentation | PDMShell | SOLIDWORKS PDM
---

# UPDATEREFERENCES Command Documentation

## DESCRIPTION
Updates file references inside the SOLIDWORKS PDM vault.

The `updatereferences` command modifies references stored **inside files**, without opening SOLIDWORKS, and allows you to:

- Update references for a **single file**
- Update references for **multiple files using a search**
- Resolve references by locating matching files inside a specified directory
- Control which references are updated using a **scope** parameter

This command is especially useful for fixing broken references, updating references after migrations, or correcting references that point outside the vault.

## SYNTAX
```bash
updatereferences -filepath -search -directory -scope -recursive
```

## PARAMETERS

- `filepath`  
  Optional. Updates references for a single file.  
  - If a relative path is provided, it is resolved against the current directory.
  - When specified, the `search` parameter is ignored.

- `search`  
  Optional. Search query used to find files whose references should be updated.  
  - The search is scoped to the current directory.
  - Supports `%` wildcards.
  - Can be combined with `recursive`.

- `directory`  
  Optional. Defines where replacement references are searched.  
  Only files found under this directory will be used when resolving and updating references.

- `scope`  
  Optional. Controls which references are updated.  
  Valid values:
  - `UpdateOutsideVaultReferenceOnly` – Updates references that point outside the vault
  - `UpdateBrokenReferences` – Updates references that are missing or broken
  - `UpdateAllReferences` – Updates all references found in the file

- `recursive`  
  Optional. When used with `search`, includes subfolders of the current directory when locating files whose references should be updated.

## BEHAVIOR

- Operates directly on file reference data
- Does not open SOLIDWORKS
- **Requires files to be checked out**
- Uses vault searches to locate replacement references
- Updates references by matching file names inside the specified directory scope
- Commits changes directly back into the file

## EXAMPLES



###  Update only references that point outside the vault
```bash
updatereferences -filepath speaker.sldasm -directory Libraries -scope UpdateOutsideVaultReferenceOnly
```

### Update broken references for all assemblies in the current folder
```bash
updatereferences -search %.sldasm -scope UpdateBrokenReferences
```
 
## REMARKS

- Either `filepath` or `search` must be specified.
- If both are provided, `filepath` takes precedence.
- The `search` parameter only searches within the current directory unless `recursive` is specified.
- Reference resolution is based on matching file names within the directory scope.
- The first matching file found is used to update the reference.
- This command modifies files directly; use with care in controlled workflows.

 