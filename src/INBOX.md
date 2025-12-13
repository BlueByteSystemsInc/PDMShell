---
description: Opens the PDM inbox and sends a message as the logged-in user.
title: INBOX Command Documentation | PDMShell | SOLIDWORKS PDM
---
# INBOX Command Documentation

## DESCRIPTION:
Opens the PDM inbox or sends a message as the logged-in user.

## SYNTAX:
```bash
inbox -filePath -name -value
```
## PARAMETERS:
-`name`: Name of the user to send the message to. 
-`value`: Message: supports evaluation against the `filePath`.
-`filePath`: Associated file

## EXAMPLES:
```bash
inbox -message 'File checked in successfully'
# sends the specified message to the logged-in user 
```