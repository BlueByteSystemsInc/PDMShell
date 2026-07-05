---
description: Use the local PDMShell machine license for add-in automation on a workstation.
title: Machine License
---
# Machine License

Use a machine license when the PDMShell add-in should use the local PDMShell license already installed on a workstation.

Machine license mode is selected from `Manage PDMShell Licenses` with `Use this machine's license`.

## When To Use A Machine License

Use `Use this machine's license` when:

- One administrator runs PDMShell add-in automation from a licensed workstation.
- Each workstation already has its own activated PDMShell license.
- You do not want the vault to manage pooled license keys.
- You do not need to review active pool borrows from the vault.

## How Activation Works

Machine license mode uses the license stored on the current computer. Activate or deactivate that license from PDMShell settings on the workstation.

If the workstation has internet access, use [License Activation](license-activation.md). If the workstation is air-gapped or cannot reach the license server, use [Offline Activation](offline-activation.md).

## Difference From License Pool

Machine license mode does not borrow from vault-managed license keys. The add-in checks the local workstation license instead.

For shared vault access across multiple users or machines, use a [License Pool](license-pool.md).

## Related Articles

- [License Pool](license-pool.md)
- [Manage PDMShell add-in licenses](addin/license-manager.md)
- [License Activation](license-activation.md)
- [Offline Activation](offline-activation.md)
