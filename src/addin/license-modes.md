---
description: Choose between PDMShell add-in license pool mode and machine license mode.
title: PDMShell add-in license modes | PDMShell
---
# License pool and machine licenses

The PDMShell add-in can use either a vault-managed license pool or the local PDMShell license activated in the standalone PDMShell application on a workstation.

Think of the choice this way:

| Mode | Where The License Is Activated | What The Add-in Uses |
| --- | --- | --- |
| License pool | PDMShell add-in license manager in the SOLIDWORKS PDM Administration Tool | A pooled seat borrowed from the vault. |
| Machine license | Standalone PDMShell application on the workstation | The local license already activated on that machine. |

Use the focused licensing articles for the full explanation:

- [License Pool](../license-pool.md)
- [Machine License](../machine-license.md)

## Which mode should I use?

| Scenario | Recommended mode |
| --- | --- |
| Many PDM users need add-in scripts | License pool |
| A shared vault should control add-in license access | License pool |
| One administrator runs scripts from a licensed workstation | Machine license |
| You already activate PDMShell on each workstation | Machine license |

## Related articles

- [Manage PDMShell add-in licenses](license-manager.md)
- [License Pool](../license-pool.md)
- [Machine License](../machine-license.md)
- [License Activation](../license-activation.md)
- [Offline Activation](../offline-activation.md)
