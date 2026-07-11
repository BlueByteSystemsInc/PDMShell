---
description: Use the local PDMShell machine license for add-in automation on a workstation.
title: Machine License
---
# Machine License

A machine license is a PDMShell license activated in the standalone PDMShell application on one workstation.

Use a machine license when PDMShell is licensed for a single computer, or when the PDMShell add-in should use the local PDMShell license already activated on that workstation.

Machine license mode is selected from `Manage PDMShell Licenses` with `Use this machine's license`.

## When To Use A Machine License

Use `Use this machine's license` when:

- One administrator runs PDMShell add-in automation from a licensed workstation.
- Each workstation already has its own activated PDMShell license.
- You do not want the vault to manage pooled license keys.
- You do not need to review active pool borrows from the vault.

## How Activation Works

Machine license mode uses the license stored on the current computer. Activate or deactivate that license from the standalone PDMShell application settings on the workstation.

If the workstation has internet access, use [License Activation](license-activation.md). If the workstation is air-gapped or cannot reach the license server, use [Offline Activation](offline-activation.md).

## Activate The Local Machine License

1. Open PDMShell on the workstation that will run the add-in automation.
2. Select `Settings` on the toolbar or press `Ctrl + O`.
3. Select `License`.
4. Enter the PDMShell license key.
5. Select `Activate`.

<div align="center">
  <img src="/images/pdmshell-open-settings-button.png" alt="PDMShell Settings toolbar button" style="max-width:420px;width:100%;height:auto;">
</div>

When activation succeeds, the License page shows the active license status and expiration date. The add-in can then use `Use this machine's license` for that workstation.

<div align="center">
  <img src="/images/pdmshell-license-settings.png" alt="PDMShell License settings page with an activated machine license" style="max-width:760px;width:100%;height:auto;">
</div>

## Difference From License Pool

Machine license mode does not borrow from vault-managed license keys. The add-in checks the local workstation license instead.

For shared vault access across multiple users or machines, use a [License Pool](license-pool.md).

## Related Articles

- [License Pool](license-pool.md)
- [Manage PDMShell add-in licenses](addin/license-manager.md)
- [License Activation](license-activation.md)
- [Offline Activation](offline-activation.md)
