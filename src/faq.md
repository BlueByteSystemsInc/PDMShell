---
description: Frequently asked questions about PDMShell licensing, installation, automation, the PDMShell add-in, and support.
title: FAQ | PDMShell | SOLIDWORKS PDM
---
# FAQ

## What Is PDMShell?

PDMShell is a command-line and scripting tool for SOLIDWORKS PDM Professional. It helps administrators, engineers, and migration teams automate vault work such as searching, variable updates, file operations, workflow transitions, script execution, and add-in automation.

Start with [Introduction](introduction.md) if you are new to PDMShell.

## What Is The Difference Between Free And Premium?

The Free edition is intended for evaluation, quick validation, and small command-line jobs. The Premium edition is intended for production automation.

Main differences:

- Free `search` results are limited to 5 items.
- Free `runscript` execution is limited to 5 script lines.
- Premium removes those limits.
- Premium includes the PDMShell add-in.
- Premium supports production automation, workflow integration, and larger batch workflows.

See [PDMShell Free vs Premium](FREEVSPREMIUM.md) for the full comparison and pricing.

## What Is The Difference Between A Single License And A License Pool?

A single license is activated on one workstation and is best for one administrator or one machine.

A license pool is managed from a SOLIDWORKS PDM vault and is best when multiple users need access to PDMShell add-in automation. Users borrow available seats from the pool when they run add-in automation.

See [Machine License](machine-license.md) and [License Pool](license-pool.md).

## How Do I Activate PDMShell?

If the computer has internet access, use [License Activation](license-activation.md).

If the computer is air-gapped or cannot reach the license server, use [Offline Activation](offline-activation.md).

## How Do I Install Or Update PDMShell?

Use [PDMShell standalone installation](howtoinstall.md). For updates, uninstall the existing version first, then install the latest version.

Do not install a new version over the installed version unless the installation article specifically says that workflow is supported.

## Where Do I Download The PDMShell Add-in?

The PDMShell add-in is available with Premium. After your order is complete, download it from your Blue Byte Systems Inc [account page](https://bluebyte.biz/account), from the order confirmation email, or ask technical support after the order is made.

See [PDMShell add-in installation](addin/installation.md).

## How Do I Manage Add-in Licenses?

Open the SOLIDWORKS PDM Administration Tool, expand the vault, open the add-ins list, locate the PDMShell add-in, right-click it, and select `Manage PDMShell Licenses`.

From there, administrators can choose license pool mode or machine license mode, add license keys, activate pool keys, enable or disable keys, and review active borrows.

See [Manage PDMShell add-in licenses](addin/license-manager.md).

## Can I Use PDMShell For Customer Projects?

Resellers, VARs, consultants, and service partners may not use PDMShell to perform customer migrations, vault cleanup, batch automation, or paid customer services unless their license agreement explicitly allows it.

Contact Blue Byte Systems Inc for special licensing permission or service-provider licensing.

## What Are The System Requirements?

PDMShell requires Windows and SOLIDWORKS PDM Professional.

SOLIDWORKS is required only for commands and scripts that open or automate SOLIDWORKS documents, such as macro-based workflows.

## Why Are Commands Missing Or Showing Old Descriptions After An Update?

This usually means the installed files were not refreshed correctly.

Use the clean update workflow:

1. Uninstall the current PDMShell version.
2. Download the latest installer.
3. Install the latest version.

See [PDMShell standalone installation](howtoinstall.md).

## How Do I Get Help?

For technical support, contact `support@bluebytesystemsinc.zohodesk.com`.

When reporting an issue, include:

- PDMShell version.
- Command or script being run.
- Error message.
- Whether the issue happens in the command window, visual editor, or PDMShell add-in.

For teams that want help planning, developing, or deploying automation, Blue Byte Systems offers [Enterprise Support Services](https://bluebyte.biz/product/enterprise-support-services/).
