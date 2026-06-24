---
description: How the PDMShell add-in runs scripts through pdmcli.exe and runscript.
title: Runtime execution | PDMShell add-in
---
# Runtime execution

When a configured script runs, the add-in writes the script to a temporary `.pdmshell` file and launches PDMShell in automation mode.

For selected files and folders, the add-in uses the `-items` path:

```powershell
pdmcli.exe -headless "C:\Temp\Script.pdmshell" -items "123,45;678,90"
```

Each item is passed as an ID pair:

| Item type | Format | Meaning |
| --- | --- | --- |
| File | `fileId,folderId` | File ID and containing folder ID |
| Folder | `folderId,parentFolderId` | Folder ID and parent folder ID |

## Headless mode

Headless mode starts a lighter execution shell for add-in automation. Use it for unattended runs from command menus, trigger points, tasks, or other automated launches.

## Script editing

Use `-edit` when opening a script in the visual editor without executing it:

```powershell
pdmcli.exe -edit "C:\Vault\Scripts\CreateECO.pdmshell"
```

For more details about script execution, see [RunScript](../RUNSCRIPT.md).

## Related articles

- [Script Editor](script-editor.md)
- [Command menu scripts](command-menu.md)
- [PDM Tasks](tasks.md)
- [Event trigger points](trigger-points.md)
