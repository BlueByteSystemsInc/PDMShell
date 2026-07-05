---
description: Opens the PDM inbox and sends a message as the logged-in user.
title: inbox Command | PDMShell | SOLIDWORKS PDM
---
# inbox
## Description
Opens the PDM inbox or sends a message as the logged-in user.

## Syntax

```text
inbox -filePath -name -value
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-filePath` | Yes | Associated file |
| `-name` | Yes | Name of the user to send the message to. |
| `-value` | Yes | Message: supports evaluation against the `filePath`. |

### Parameter Details

-`name`: Name of the user to send the message to. 
-`value`: Message: supports evaluation against the `filePath`.
-`filePath`: Associated file

## Examples
```bash
inbox -message 'File checked in successfully'
# inbox
```

## Availability
Available since PDMShell 2.0.0.
