---
description: Use a vault-managed PDMShell license pool for add-in automation in SOLIDWORKS PDM.
title: License Pool
---
# License Pool

Use a license pool when a SOLIDWORKS PDM vault should manage PDMShell add-in access centrally.

In pool mode, administrators add PDMShell license keys to the vault from `Manage PDMShell Licenses`. The vault can then borrow from enabled, activated licenses when users run PDMShell add-in automation.

## When To Use A License Pool

Use `Use license pool` when:

- Multiple PDM users need access to PDMShell add-in commands.
- A shared vault should control who can use add-in automation.
- You want license access managed from the Administration Tool instead of each workstation.
- You want to review active borrows by vault, machine, user, and borrowed time.

## How Pool Borrowing Works

When a user runs PDMShell automation from the add-in, the vault checks the enabled, activated licenses in the pool. If a seat is available, the add-in borrows a license for that user and machine.

The `Active borrows` table in `Manage PDMShell Licenses` shows the current pool usage.

## Manage Pool Keys

Open the SOLIDWORKS PDM Administration Tool, expand the vault, open the add-ins list, locate the PDMShell add-in, right-click it, and select `Manage PDMShell Licenses`.

From the license manager, administrators can:

- Add one or more PDMShell license keys.
- Enable or disable keys.
- Activate keys when activation is required.
- Delete keys from the vault license list.
- Review active pool borrows.

## When Not To Use A Pool

A pool may not be necessary when only one administrator runs PDMShell automation from a workstation that already has an activated local license. In that case, use a [Machine License](machine-license.md).

## Related Articles

- [Machine License](machine-license.md)
- [Manage PDMShell add-in licenses](addin/license-manager.md)
- [License Activation](license-activation.md)
- [Offline Activation](offline-activation.md)
