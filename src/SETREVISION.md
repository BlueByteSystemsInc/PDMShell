---
description: Sets the revision of a SOLIDWORKS PDM file using built-in revision keywords or evaluated variables.
title: SETREVISION Command Documentation | PDMShell | SOLIDWORKS PDM
---
# SETREVISION Command Documentation

## DESCRIPTION:

The `SetRevisionCommand` allows you to set the **PDM-managed revision** of a file inside the vault.  
This command updates the official **PDM Revision** (the value shown on the version tab), *not* the datacard one.

You may set the revision using:
- **%nextrevision%** — moves the revision forward  
- **%previousrevision%** — moves the revision backward  
- **%initial%** — resets to the first revision in the revision scheme  

You can also use **PDM variables** by enclosing them in brackets:  
Example: `[Revision]`  
This evaluates the variable on the file and applies its value as the new revision.

The command resolves all bracketed variables before applying the revision.

## SYNTAX:
```bash
setrevision -filePath|-search -value 
```
## PARAMETERS:

- `filePath`  
  Path to the file whose revision you want to update.  
  Only a single file is affected by this command.

- `search`  
  Search query in the current folder

- `value`  
  The revision value to apply.  
  This can be:
  
  - `%nextrevision%` → increments the PDM revision counter  
  - `%previousrevision%` → decrements the PDM revision counter  
  - `%initial%` → resets revision to the scheme’s first value  
  - `[VariableName]` → evaluates the PDM variable and uses its value  
  - A literal revision string supported by the vault’s revision scheme  

### NOTES:

- This command affects **only the PDM Revision**, not custom properties or configuration-specific metadata.  
- When using `[VariableName]`, ensure the variable is present on the file card.  
- `%previousrevision%` will adjust the counter only if the revision scheme allows backward movement.  
- `%nextrevision%` respects all revision scheme rules defined in the PDM Administration tool.


# AVAILABILITY 
- 3.0.11