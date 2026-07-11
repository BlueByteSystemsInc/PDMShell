---
description: Choose the right PDMShell license workflow for online activation, offline activation, license pools, and machine licenses.
title: Licensing
---
# Licensing

Use this section to choose how PDMShell should be activated and how PDMShell add-in access should be managed.

## One License, Two Activation Workflows

PDMShell Premium licensing is seat-based. Where you activate the license depends on how you want to use it.

| Workflow | Where The License Is Activated | Best For |
| --- | --- | --- |
| Single machine | Activate the license in the standalone PDMShell application installed on that workstation. | One workstation or one administrator using PDMShell locally. |
| Pooled add-in access | Add and activate the license from the PDMShell add-in license manager in the SOLIDWORKS PDM Administration Tool. | A shared PDM vault where multiple users need access to PDMShell add-in automation. |

Use the standalone installed application when the license belongs to one machine. Use the add-in license manager when the license should be pooled and borrowed by users from the vault.

## Choose A Licensing Workflow

| Need | Start here |
| --- | --- |
| Activate PDMShell on one workstation with internet access | [License Activation](license-activation.md) |
| Activate PDMShell on an air-gapped or restricted computer | [Offline Activation](offline-activation.md) |
| Let a PDM vault manage shared add-in seats | [License Pool](license-pool.md) |
| Use the local workstation license for add-in automation | [Machine License](machine-license.md) |
| Add keys, activate pool keys, or review active borrows in the Administration Tool | [Manage PDMShell add-in licenses](addin/license-manager.md) |

## Common Flow

1. Install PDMShell.
2. If the license is for one workstation, activate it in the standalone PDMShell application with [License Activation](license-activation.md) or [Offline Activation](offline-activation.md).
3. If the license should be pooled for the PDM add-in, install the add-in and manage the keys from [Manage PDMShell add-in licenses](addin/license-manager.md).
4. If you use the add-in, choose either [License Pool](license-pool.md) or [Machine License](machine-license.md) mode.

## Related Articles

- [PDMShell standalone installation](howtoinstall.md)
- [PDMShell add-in installation](addin/installation.md)
- [Free vs Premium](FREEVSPREMIUM.md)
- [PDMShell add-in](TASKSCRIPT.md)
