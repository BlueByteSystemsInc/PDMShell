---
description: Add SOLIDWORKS PDM command menu entries that run PDMShell scripts.
title: Command menu scripts | PDMShell add-in
---
# Command menu scripts

Enable **Menu** when a script should appear as a right-click PDM command.

Enter the menu text exactly as it should appear in the menu. Use backslashes to group commands:

```text
PDMShell\Script 1
PDMShell\Rename Files
PDMShell\Engineering\Create PDF
```

When the user clicks the command, the add-in checks permissions, evaluates conditions, and runs the script against the selected file or folder context.

## Notes

- The command menu text is the user-facing label.
- The script name is the administrator-facing identifier in the Script Editor.
- If the menu command does not appear, reload the add-in after saving configuration changes.

## Related articles

- [Permissions](permissions.md)
- [Conditions](conditions.md)
- [Runtime execution](runtime-execution.md)
