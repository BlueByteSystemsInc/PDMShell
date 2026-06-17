---
description: Shows a Windows message box from a PDMShell command or script.
title: MSGBOX Command | PDMShell | SOLIDWORKS PDM
---
# MSGBOX Command
## Description
The `msgbox` command shows a Windows message box with the specified text.

Use `msgbox` in scripts when you need to display a simple notification or checkpoint message to the user.

## Syntax
```bash
msgbox -value message [-title title] [-icon icon]
```

## Parameters
- **`value`**:  
  *(Required)* Message text to display in the message box.

- **`title`**:  
  *(Optional)* Message box title. If omitted, PDMShell uses the current PDMShell version as the title.

- **`icon`**:  
  *(Optional)* Message box icon. Valid values are `None`, `Information`, `Warning`, `Error`, and `Question`. If omitted, PDMShell uses `Information`.

## Examples
```bash
msgbox -value "Hello from PDMShell"
```

```bash
msgbox -value "Script completed successfully." -title "Batch Complete" -icon Information
```

```bash
msgbox -value "The export failed." -title "Export Error" -icon Error
```

## Remarks
- The command displays an informational Windows message box.
- When `title` is not specified, the message box title defaults to the PDMShell version.
- When `icon` is not specified, the message box uses the `Information` icon.
- Wrap the value in quotes when the message contains spaces.
- Wrap the title in quotes when it contains spaces.
- The script continues after the user closes the message box.

## Availability
Unreleased after 4.0.7.
