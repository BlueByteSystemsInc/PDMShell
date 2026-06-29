---
description: Activate or deactivate PDMShell on an air-gapped computer by sending an encrypted request file to Blue Byte Systems.
title: Offline Activation
---
# Offline Activation

Use offline activation when the computer running PDMShell cannot connect to the internet. PDMShell creates an encrypted request file that you email to Blue Byte Systems. Blue Byte Systems processes the request and sends back an encrypted response file that you import on the same computer.

> [!NOTE]
> Offline activation is intended for air-gapped or restricted systems. If the computer has internet access, use the regular [License Activation](license-activation.md) workflow.

## Open Offline Activation

1. Open PDMShell.
2. Select `Settings` on the toolbar or press `Ctrl + O`.
3. Select `Offline Activation`.
4. Enter your PDMShell license key.

<div align="center">
  <img src="/images/pdmshell-open-settings-button.png" alt="PDMShell Settings toolbar button" style="max-width:420px;width:100%;height:auto;">
</div>

## Generate An Activation Request

1. Enter the license key on the `Offline Activation` page.
2. Select `Generate activation request`.
3. Save the generated `.pdmshellreq` file.
4. Email the `.pdmshellreq` file to `info@bluebyte.biz`.

You can use any email subject or message body. The important part is attaching the generated `.pdmshellreq` file.

<div align="center">
  <img src="/images/pdmshell-offline-activation-settings.png" alt="PDMShell Offline Activation settings page" style="max-width:760px;width:100%;height:auto;">
</div>

## Generate A Deactivation Request

Use this workflow when you need to release a license from an air-gapped computer.

1. Enter the license key on the `Offline Activation` page.
2. Select `Generate deactivation request`.
3. Save the generated `.pdmshellreq` file.
4. Email the `.pdmshellreq` file to `info@bluebyte.biz`.

## Receive The Response

Blue Byte Systems will process the request and email back an encrypted `.pdmshelllic` response file.

The reply will come from a Blue Byte Systems email address using one of these domains:

- `bluebyte.biz`
- `bluebytesystems.com`

The response email includes one attachment. Download the `.pdmshelllic` file and move it back to the air-gapped computer.

<div align="center">
  <img src="/images/pdmshell-offline-activation-email-response.png" alt="PDMShell offline activation response email with attachment" style="max-width:620px;width:100%;height:auto;">
</div>

## Import The Response

1. Return to the same computer that generated the request.
2. Open PDMShell.
3. Open `Settings`.
4. Select `Offline Activation`.
5. Select `Import response`.
6. Choose the `.pdmshelllic` file you received from Blue Byte Systems.

PDMShell imports the encrypted response and updates the local license status.

> [!IMPORTANT]
> After the response imports successfully, restart PDMShell so the activated license is fully applied to the current session.

## Important Notes

- Import the response on the same computer that generated the request.
- Do not edit the `.pdmshellreq` or `.pdmshelllic` files.
- The request and response files are encrypted.
- If the license is already active on another computer, the response may report that the license is already in use.
- If the response fails to import, contact Blue Byte Systems support and include the request file name and any message shown by PDMShell.
