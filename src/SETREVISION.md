---
description: Sets the revision for one file or for files found by search.
title: setrevision Command | PDMShell | SOLIDWORKS PDM
---
# setrevision

## Description

The `setrevision` command allows you to set the PDM-managed revision of a file inside the vault.
This command updates the official PDM revision, which is the value shown on the Version tab, not a data card variable.

You may set the revision using:

- `%nextrevision%` - moves the revision forward.
- `%previousrevision%` - moves the revision backward.
- `%initial%` - resets to the first revision in the revision scheme.

You can also use PDM variable expressions:

```text
$(Revision.@)
```

This evaluates the variable on the file and applies its value as the new revision. For file variables, include the configuration suffix. Use `.@` for the file `@` tab.

Bracketed text is treated as literal text and is not evaluated.

## Syntax

```text
setrevision -filePath|-search -recursive -value -csv
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-filePath` | Mode-dependent | See parameter details below. |
| `-search` | Mode-dependent | See parameter details below. |
| `-recursive` | Mode-dependent | See parameter details below. |
| `-value` | Mode-dependent | See parameter details below. |
| `-csv` | Mode-dependent | See parameter details below. |

### Parameter Details

- `filePath`  
  Path to the file whose revision you want to update. Only a single file is affected by this command.

- `search`  
  Search query in the current folder.

- `recursive`  
  When used with [`search`](SEARCH.md), includes files in subfolders.

- `value`  
  The revision value to apply. This can be:

  - `%nextrevision%` - increments the PDM revision counter.
  - `%previousrevision%` - decrements the PDM revision counter.
  - `%initial%` - resets revision to the scheme's first value.
  - `$(VariableName.ConfigurationName)` - evaluates the PDM variable and uses its value.
  - A literal revision string supported by the vault's revision scheme.

- `csv`  
  When used with [`search`](SEARCH.md), saves results to a CSV file.

## Notes

- This command affects only the PDM revision, not custom properties or configuration-specific metadata.
- When using PDM variables from a file card, include the configuration suffix. Use `.@` for the file `@` tab, for example `$(Revision.@)`.
- `%previousrevision%` adjusts the counter only if the revision scheme allows backward movement.
- `%nextrevision%` respects all revision scheme rules defined in the PDM Administration tool.

## Availability

Available since PDMShell 3.0.11.
