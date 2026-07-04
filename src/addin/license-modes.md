---
description: Choose between PDMShell add-in license pool mode and machine license mode.
title: PDMShell add-in license pool and machine licenses | PDMShell
---
# License pool and machine licenses

The PDMShell add-in can use either a vault license pool or the local PDMShell license installed on a workstation. Choose the mode that matches how users run PDMShell automation in the vault.

## License pool

Use `Use license pool` when the vault should manage PDMShell add-in access centrally.

In pool mode, administrators add license keys in `Manage PDMShell Licenses`. The vault can then borrow from the enabled, activated licenses when users run add-in automation.

Pool mode is useful when:

- Multiple users need access to PDMShell add-in commands.
- You want license access controlled from the vault.
- You want to see active borrows by vault, machine, and user.
- You do not want every workstation to manage its own local PDMShell license.

The `Active borrows` table in the license manager shows current pool usage.

## Machine license

Use `Use this machine's license` when the add-in should use the local PDMShell license installed on the workstation.

Machine license mode is useful when:

- A small number of administrators run PDMShell add-in automation.
- The workstation already has an activated PDMShell license.
- You do not want the vault to manage pooled license keys.

In this mode, license activation is handled on the workstation through the normal PDMShell license settings.

## Which mode should I use?

| Scenario | Recommended mode |
| --- | --- |
| Many PDM users need add-in scripts | License pool |
| A shared vault should control add-in license access | License pool |
| One administrator runs scripts from a licensed workstation | Machine license |
| You already activate PDMShell on each workstation | Machine license |

## Related articles

- [Manage PDMShell add-in licenses](license-manager.md)
- [License Activation](../license-activation.md)
- [Offline Activation](../offline-activation.md)
