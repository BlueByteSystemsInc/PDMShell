---
description: Install and open the PDMShell add-in for SOLIDWORKS PDM.
title: PDMShell add-in installation and access | PDMShell
---
# Installation and access

Install the PDMShell add-in in the SOLIDWORKS PDM vault where the automation should run. The add-in is available with the premium version of PDMShell and can be deployed from your Blue Byte Systems Inc account or with PDMDeploy.

After the add-in is loaded in the vault, open the **Script Editor** command from the PDMShell add-in menu.

## Administrator access

Only administrators should configure add-in scripts. A script can run PDMShell commands against vault files and folders, so test every script before making it available to general users.

## Updating scripts

The add-in reads script configuration from its settings when it initializes. If you change command menu items or event trigger points, reload the add-in in PDM so the command list and event hooks are registered again.

## Related articles

- [Script Editor](script-editor.md)
- [Command menu scripts](command-menu.md)
- [Event trigger points](trigger-points.md)
