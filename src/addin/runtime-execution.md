---
description: How the PDMShell add-in runs command-menu, event-hook, and task scripts.
title: Runtime execution | PDMShell add-in
---
# Runtime execution

When a configured script runs from a command menu, event hook, or PDM task, the add-in executes it directly through the shared PDMShell command runtime. It does not start a separate `pdmcli.exe` process for script execution.

The add-in resolves the affected PDM files and folders, evaluates the script conditions, and runs the script against the matching items. Command-menu and event-hook execution reuses the resolved items throughout the run to avoid unnecessary PDM lookups.

## Interactive progress

Command-menu and event-hook scripts can show a modeless progress dialog while they run. The progress line identifies the completion percentage, affected item, and current action:

```text
25% - membrane.SLDDRW: Setting data card variable
```

Commands that are not associated with a specific affected item show the percentage and action only. PDM task runs continue to report progress through the PDM task interface.

## Runtime behavior

Add-in execution does not initialize interactive editor autocomplete because suggestions are only needed while editing commands. This keeps background execution focused on loading the script context and running commands.

Commands still enforce PDMShell license limits at runtime using the configured machine license or a license borrowed from the add-in license pool.

## Script editing

The add-in can still start `pdmcli.exe` when opening a script in the visual editor. The `-edit` option opens the script without executing it:

```powershell
pdmcli.exe -edit "C:\Vault\Scripts\CreateECO.pdmshell"
```

For more details about script execution, see [RunScript](../RUNSCRIPT.md).

## Related articles

- [Script Editor](script-editor.md)
- [Command menu scripts](command-menu.md)
- [PDM Tasks](tasks.md)
- [Event trigger points](trigger-points.md)
