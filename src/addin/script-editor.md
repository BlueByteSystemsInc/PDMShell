---
description: Use the PDMShell add-in Script Editor to configure scripts.
title: Script Editor | PDMShell add-in
---
# Script Editor

The Script Editor stores the scripts that the add-in can run from PDM. Each script entry has its own enabled state, permissions, conditions, command menu settings, trigger points, and script code.

## Add or delete scripts

Use Add to create a new script entry. Use Delete to remove the selected entry.

The editor does not create dummy scripts. A new script entry is empty until you enter the script name, configuration, and code.

## Save or discard changes

The editor works on a copy of the saved configuration.

- Click OK to save the edited configuration.
- Click Cancel to discard changes made in the dialog.

## Script sections

Each script is organized into these sections:

| Section | Purpose |
| --- | --- |
| Overview | Script name and enabled state |
| Permissions | Users and groups allowed to run the script |
| Conditions | Expression that must pass before the script runs |
| Trigger Points | Command menu and PDM event trigger configuration |
| Code | The `.pdmshell` script body |

## Edit with PDMShell

Use Edit with PDMShell to open the script in the PDMShell visual editor. The add-in saves the script to a temporary `.pdmshell` file and opens:

```powershell
pdmcli.exe -edit "C:\Path\To\TempScript.pdmshell"
```

When the PDMShell editor closes, the add-in reloads the script text from the temporary file.

## Related articles

- [Permissions](permissions.md)
- [Conditions](conditions.md)
- [Runtime execution](runtime-execution.md)
