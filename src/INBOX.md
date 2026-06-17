---
description: Opens the PDM inbox and sends a message as the logged-in user.
title: INBOX Command | PDMShell | SOLIDWORKS PDM
---
# INBOX Command
## Description
Opens the PDM inbox or sends a message as the logged-in user.

## Syntax
```bash
inbox -filePath -name -value
```
## Parameters
-`name`: Name of the user to send the message to. 
-`value`: Message: supports evaluation against the `filePath`.
-`filePath`: Associated file

## Examples
```bash
inbox -message 'File checked in successfully'
# sends the specified message to the logged-in user 
```

## Availability
Available since PDMShell 2.0.0 or earlier.
