---
description: Test and troubleshoot PDMShell add-in scripts.
title: Testing and troubleshooting | PDMShell add-in
---
# Testing and troubleshooting

Test every add-in script with a small set of files before enabling it for production users.

## Recommended test workflow

1. Build and test the `.pdmshell` script outside the add-in.
2. Add the script in the Script Editor.
3. Enable Always show condition test message while validating conditions.
4. Configure permissions for a small administrator group.
5. Enable a command menu or trigger point.
6. Test against known files and folders.
7. Expand permissions after the automation behaves as expected.

## Common issues

| Symptom | What to check |
| --- | --- |
| Menu command does not appear | Confirm the script is enabled, Menu is enabled, command menu text is not empty, and the current user passes permissions. |
| Menu command or trigger change does not appear after saving | If the Script Editor showed the menu and hook changes prompt, restart Windows Explorer or log out and back in to the vault so PDM reloads the add-in menus and command hooks. |
| Script does not run from a trigger | Confirm the trigger point is selected and the add-in was reloaded after changing trigger configuration. |
| Conditions do not match | Enable the condition test message and verify the resolved placeholder and variable values. |
| Script runs against the wrong item | Check the PDM command context and whether the event supplies files, folders, or command-only data. |

## Related articles

- [Conditions](conditions.md)
- [Placeholders and command context](placeholders.md)
- [Script Editor](script-editor.md)
