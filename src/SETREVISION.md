---
description: Sets the revision for one file or for files found by search.
title: SETREVISION Command | PDMShell | SOLIDWORKS PDM
---
# SETREVISION Command
## Description
The `SetRevisionCommand` allows you to set the PDM-managed revision of a file inside the vault.  
This command updates the official PDM Revision (the value shown on the version tab), *not* the datacard one.

You may set the revision using:
- **%nextrevision%** â€” moves the revision forward  
- **%previousrevision%** â€” moves the revision backward  
- **%initial%** â€” resets to the first revision in the revision scheme  

You can also use PDM variables by enclosing them in brackets:  
Example: `[Revision]`  
This evaluates the variable on the file and applies its value as the new revision.

The command resolves all bracketed variables before applying the revision.

## Syntax
```bash
setrevision -filePath|-search -recursive -value -csv
```
## Parameters
- `filePath`  
  Path to the file whose revision you want to update.  
  Only a single file is affected by this command.

- `search`  
  Search query in the current folder

- `recursive`  
  When used with [`search`](SEARCH.md), includes files in subfolders.

- `value`  
  The revision value to apply.  
  This can be:
  
  - `%nextrevision%` â†’ increments the PDM revision counter  
  - `%previousrevision%` â†’ decrements the PDM revision counter  
  - `%initial%` â†’ resets revision to the schemeâ€™s first value  
  - `[VariableName]` â†’ evaluates the PDM variable and uses its value  
  - A literal revision string supported by the vaultâ€™s revision scheme  

- `csv` (only valid with [`search`](SEARCH.md))
  Save results to a csv file


## Notes

- This command affects only the PDM Revision, not custom properties or configuration-specific metadata.  
- When using `[VariableName]`, ensure the variable is present on the file card.  
- `%previousrevision%` will adjust the counter only if the revision scheme allows backward movement.  
- `%nextrevision%` respects all revision scheme rules defined in the PDM Administration tool.

## Availability
Available since PDMShell 3.0.11.
