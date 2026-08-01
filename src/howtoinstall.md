---
description: Install or update the standalone PDMShell desktop application from the Blue Byte Systems server or Microsoft Store.
title: PDMShell standalone installation | PDMShell
---
# PDMShell standalone installation

PDMShell can be installed as a standalone desktop application from the Blue Byte Systems server or from the Microsoft Store. Starting with version 4.0.50, the Blue Byte Systems download uses a signed per-user VeloPack installer and does not require administrator privileges.

For the SOLIDWORKS PDM add-in installer, see [PDMShell add-in installation](addin/installation.md).

> [!NOTE]
> The VeloPack installer and non-elevated update workflow are available in PDMShell 4.0.50 and newer.

---

## Install From The Blue Byte Systems Server

Download `pdmcli_installer.zip` from the Blue Byte Systems server:

<div align="center">
  <a href="https://bluebyte.biz/wp-json/slm_custom/downloadpdmshell" style="display:inline-flex;align-items:center;justify-content:center;padding:12px 22px;border-radius:6px;background:#0078D4;color:#ffffff;text-decoration:none;font-weight:600;border:1px solid #106EBE;">Download PDMShell latest version</a>
</div>

The ZIP contains the signed executable `pdmcli_installer.exe`.

<div align="center">
  <img src="/images/image.png" alt="Safe Browsing Warning" style="max-width:480px;width:100%;height:auto;">
</div>

After downloading:

1. Extract `pdmcli_installer.zip`.
2. Double-click `pdmcli_installer.exe`.
3. Wait for the installation to complete and PDMShell to open.

The installer registers PDMShell in Windows Installed apps and creates Desktop and Start menu shortcuts. It installs the application for the current user under:

```text
%LOCALAPPDATA%\Blue Byte Systems\PDMShell
```

VeloPack stores the active application files in the `current` subfolder. Future versions replace the active version without requiring a manual uninstall.

---

## Install From The Microsoft Store

1. Open the Microsoft Store on your Windows device.
2. Search for PDMShell.
3. Select the PDMShell app from the search results.
4. Select `Get` or `Install`.
5. Wait for the installation to complete.
6. Launch PDMShell from the Start menu.

The Microsoft Store does not automatically update PDMShell. If you installed PDMShell from the Microsoft Store, you may need to uninstall it and reinstall the latest version manually.

---

## Update From Inside PDMShell

PDMShell can show an Update available dialog when a newer version is detected. The dialog shows the release notes for the latest version.

<div align="center">
  <img src="../images/pdmshell-update-available.png" alt="PDMShell update available dialog" style="max-width:620px;width:100%;height:auto;">
</div>

Select `Yes, update right now` to launch PDMShell Updater as the current Windows user. The updater does not require a User Account Control prompt or administrator privileges. It also shows the local PDMShell version when an installed version is detected.

Selecting `Start` will:

1. Download `pdmcli_installer.zip` to a unique temporary folder.
2. Extract the signed `pdmcli_installer.exe`.
3. Run the VeloPack installer silently for the current user.
4. Replace the installed version while keeping the PDMShell application identity and shortcuts.
5. Start `%LOCALAPPDATA%\Blue Byte Systems\PDMShell\current\pdmcli.exe`.

Use `Download Manually` if you prefer to download the installer yourself. Use `Request Help` to open this updater help section.

---

## Common Update Issues

If an update is interrupted, close PDMShell and run the updater again. VeloPack keeps a consistent installed application identity and replaces the active `current` folder during a successful update. Use Windows Installed apps to uninstall PDMShell only when you want to remove it completely.

---

## System Requirements

To ensure PDMShell runs smoothly, your system must meet the following requirements:

- Operating System: Windows 10/11
- SOLIDWORKS PDM Professional: Version 2014 or newer
- SOLIDWORKS desktop application: Version 2017 or newer for commands that use SOLIDWORKS

---

## Support

For further assistance, visit our [Support Page](https://bluebyte.biz/contact) or contact us at `support@bluebytesystemsinc.zohodesk.com`.
