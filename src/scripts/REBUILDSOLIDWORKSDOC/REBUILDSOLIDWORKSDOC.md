---
name: Rebuild SOLIDWORKS Document
id: REBUILDSOLIDWORKSDOC
description: Rebuilds a SOLIDWORKS document through PDMShell.
icon: 🔄
requiresSolidWorks: true
requiresPDM: true
scriptFile: REBUILDSOLIDWORKSDOC.pdmshell
macroFile: REBUILDSOLIDWORKSDOC.swb
tags:
  - SOLIDWORKS
  - Rebuild
  - Macro
  - Checkout
  - Checkin
---

# Rebuild SOLIDWORKS Document

This script checks out the selected SOLIDWORKS document, changes the working directory to the file folder, runs a rebuild macro, and checks the file back into SOLIDWORKS PDM.

## Script

```pdmshell
checkout -filePath "$localPath"

cd -directory "$folderPath"

runswmacro -filePath "$tempFolder\RebuildMacro.swb" -search "Name=$fileName" -timeout 500

checkin -filePath "$localPath"
```

## What it does

- Checks out the selected file from SOLIDWORKS PDM.
- Changes the PDMShell working directory to the selected file folder.
- Runs a SOLIDWORKS macro against the selected file.
- Rebuilds the SOLIDWORKS document.
- Checks the file back into PDM.

## Requirements

- SOLIDWORKS must be installed on the machine running PDMShell.
- The user must have permission to check out and check in the file.
- The file should be a supported SOLIDWORKS document, such as `.sldprt`, `.sldasm`, or `.slddrw`.
- The swp needs to be called RebuildMacro.swb, downloaded to (`$tempFolder\RebuildMacro.swb`). 

## Macro code 
```vba

```

## Placeholders used

| Placeholder | Description |
|---|---|
| `$localPath` | Full local path of the selected file |
| `$localFolder` | Local folder path of the selected file |
| `$fileName` | File name of the selected file |
| `$tempFolder` | Temporary folder in your Windows session |