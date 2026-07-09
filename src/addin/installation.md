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

## Restricted or air-gapped systems

Some vault environments cannot reach Blue Byte Systems servers directly, or only allow Microsoft-hosted locations such as SharePoint and OneDrive. For these systems, use the PDMShell Download Center folder:

<a class="bbs-download-button" href="https://bluebytebiz-my.sharepoint.com/:f:/g/personal/amen_bluebyte_biz/IgC-eoPU0Z9XQpufSHG6IW0GAaCnMSVhuaZoUifopAZr6b0?e=0gMaF4">Open PDMShell Download Center</a>

The folder contains PDMShell `.cex` files that can be downloaded through Microsoft-hosted infrastructure and installed manually in the SOLIDWORKS PDM Administration tool.

After PDMShell TaskScript is installed, administrators can open the same folder from the PDM add-in menu:

1. Open the SOLIDWORKS PDM Administration tool.
2. Log in to the vault.
3. Expand `Add-ins`.
4. Right-click `PDMShell`.
5. Select `PDMShell Download Center...`.

To install a downloaded `.cex` file, open it with `File > Open...` in the Administration tool, then drag the add-in from the CEX window onto the vault's `Add-ins` node.

Use the SharePoint Download Center for installer files. Use [Offline Activation](../offline-activation.md) or [Manage PDMShell add-in licenses](license-manager.md) for license activation in restricted environments.

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
