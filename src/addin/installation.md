---
description: Install and open the PDMShell add-in for SOLIDWORKS PDM.
title: PDMShell add-in installation and access | PDMShell
---
# Installation and access

Install the PDMShell add-in in the SOLIDWORKS PDM vault where the automation should run. The add-in is available with the premium version of PDMShell and can be deployed from your Blue Byte Systems Inc account or with PDMDeploy.

After the add-in is loaded in the vault, open the Script Editor command from the PDMShell add-in menu.

## Get the add-in installer

After your order is complete, download the PDMShell add-in from your Blue Byte Systems Inc [account page](https://bluebyte.biz/account) or from the order confirmation email.

If you cannot find the add-in installer after ordering, contact Blue Byte Systems technical support.

## Administrator access

Only administrators should configure add-in scripts. A script can run PDMShell commands against vault files and folders, so test every script before making it available to general users.

## License management

After the add-in is loaded, open the Administration Tool, expand the vault, open the add-ins list, locate the PDMShell add-in, right-click it, and select `Manage PDMShell Licenses`.

## Updating scripts

The add-in reads script configuration from its settings when it initializes. If you change command menu items or event trigger points, reload the add-in in PDM so the command list and event hooks are registered again.

## Related articles

- [Script Editor](script-editor.md)
- [Manage PDMShell add-in licenses](license-manager.md)
- [License Pool](../license-pool.md)
- [Machine License](../machine-license.md)
- [Command menu scripts](command-menu.md)
- [Event trigger points](trigger-points.md)
