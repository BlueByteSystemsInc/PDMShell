---
description: Activate, deactivate, or remove a PDMShell license from the Settings window.
title: License Activation
---
# License Activation

Use the License page in PDMShell settings to activate, deactivate, or remove the license stored on this computer.

> [!NOTE]
> Regular activation requires an internet connection. If the computer is air-gapped or cannot reach the license server, use [Offline Activation](offline-activation.md).

## Open License Settings

1. Open PDMShell.
2. Select `Settings` on the toolbar or press `Ctrl + O`.
3. Select `License`.

<div align="center">
  <img src="/images/pdmshell-open-settings-button.png" alt="PDMShell Settings toolbar button" style="max-width:420px;width:100%;height:auto;">
</div>

## Activate A License

1. Enter your PDMShell license key.
2. Select `Activate`.
3. Wait for PDMShell to verify the license.

When activation succeeds, the status changes to `Activated` and the expiration date is shown on the License page.

<div align="center">
  <img src="/images/pdmshell-license-settings.png" alt="PDMShell License settings page" style="max-width:760px;width:100%;height:auto;">
</div>

## Deactivate A License

Use deactivation before moving a license to another computer.

1. Open `Settings`.
2. Select `License`.
3. Select `Deactivate`.

PDMShell contacts the license server and releases the license from the current computer.

## Delete A License From This Computer

Use `Delete From Machine` only when you need to remove the saved license information from the current Windows user profile.

This does not contact the license server. If you plan to move the license to another computer, deactivate the license first.

## Troubleshooting

- Make sure the computer has internet access.
- Confirm that the license key was entered correctly.
- If the license is already active on another computer, deactivate it from that computer first.
- If activation still fails, contact Blue Byte Systems support and include the message shown on the License page.
