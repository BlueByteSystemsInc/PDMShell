---
description: Opens the SOLIDWORKS PDM data card for a file or folder.
title: showcard Command | PDMShell | SOLIDWORKS PDM
---
# showcard
## Description
The `showcard` command opens the SOLIDWORKS PDM data card for a selected file or folder.

Use this when a script needs to pause and let the user inspect or edit a data card directly. If the user changes a card value, the Save button becomes available in the PDMShell card window.

>[!Note]
> `showcard` is an interactive command. It is intended for desktop or add-in sessions where a user is present. Avoid using it in unattended task or headless automation.

## Syntax

```text
showcard [-filePath path] [-directory path] [-id id]
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-filePath` | No | File whose PDM data card should be opened. Absolute and relative paths are supported. |
| `-directory` | No | Folder whose PDM data card should be opened. Absolute and relative paths are supported. |
| `-id` | No | PDM internal ID of the file or folder whose data card should be opened. |

If no parameter is provided, `showcard` opens the data card for the current PDMShell folder.

### Parameter Details

- `filePath`: Opens the data card for a file. Use this when the target is a known file in the vault.
- `directory`: Opens the data card for a folder. Use this when the target is a folder path.
- `id`: Opens the data card for a file or folder by PDM database ID. PDMShell tries the ID as a file first, then as a folder.

Only one target parameter should be supplied.

## Examples

Open the current folder card:

```bash
showcard
```

Open a file card relative to the current folder:

```bash
showcard -filePath "membrane.slddrw"
```

Open a folder card:

```bash
showcard -directory "Projects\Speaker_001"
```

Open a card by PDM ID:

```bash
showcard -id 1234
```

## Remarks

- The command waits while the data card window is open.
- If the user edits the card, click Save in the PDMShell card window to write the card values.
- Closing the window without saving cancels unsaved card edits.
- The user must have the required SOLIDWORKS PDM permissions to edit the selected file or folder card.

## Availability
Available since PDMShell 4.0.34.
