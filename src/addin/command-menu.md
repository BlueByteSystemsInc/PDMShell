---
description: Run PDMShell add-in scripts on demand from SOLIDWORKS PDM command menus.
title: On-demand add-in scripts | PDMShell add-in
---
# On-demand add-in scripts

Enable **Menu** when a script should appear as a right-click PDM command.

Command menu scripts are on-demand add-in commands. They are not SOLIDWORKS PDM Tasks and they do not have to wait for a workflow transition or event trigger. Administrators configure the script once in the PDMShell add-in, then users launch it when needed from the PDM command menu against the selected file or folder. This is useful for repeatable operations such as file rename automation, metadata cleanup, export helpers, or any workflow where standard Dispatch actions are too limited for the required scripting logic.

Enter the menu text exactly as it should appear in the menu. Use backslashes to group commands:

```text
PDMShell\Script 1
PDMShell\Rename Files
PDMShell\Engineering\Create PDF
```

When the user clicks the command, the add-in checks permissions, evaluates conditions, and runs the script against the selected file or folder context.

## Video: run a script on demand

This demo shows how the PDMShell add-in can run a script on demand inside SOLIDWORKS PDM. The example uses file rename scripting to show how custom logic can be launched directly from the PDM environment without creating a PDM Task.

<div class="ratio ratio-16x9">
  <iframe src="https://www.youtube.com/embed/S7YZ04am8pI" title="Run PDMShell scripts on demand from SOLIDWORKS PDM" allowfullscreen></iframe>
</div>

[Watch on YouTube](https://www.youtube.com/watch?v=S7YZ04am8pI)

## Notes

- The command menu text is the user-facing label.
- The script name is the administrator-facing identifier in the Script Editor.
- If the menu command does not appear, reload the add-in after saving configuration changes.

## Related articles

- [Permissions](permissions.md)
- [Conditions](conditions.md)
- [Runtime execution](runtime-execution.md)
