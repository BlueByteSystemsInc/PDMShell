---
description: Restrict PDMShell add-in scripts to selected PDM users and groups.
title: Permissions | PDMShell add-in
---
# Permissions

The Permissions section controls who can run a script.

- If no users or groups are selected, the script is available to all users who can access the add-in command.
- If users are selected, only those users are allowed to run the script.
- If groups are selected, members of those groups are allowed to run the script.
- User and group names are read from the active vault.

Permissions are checked before command menu scripts and event-triggered scripts are executed.

## Recommended practice

Start with a small administrator group while testing. After the script and conditions are validated, expand access to the production users or groups that should run the script.

## Related articles

- [Command menu scripts](command-menu.md)
- [Event trigger points](trigger-points.md)
- [Testing and troubleshooting](troubleshooting.md)
