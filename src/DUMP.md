---
description: Writes the current session output to a log file.
title: DELETEFROMSOURCE Command | PDMShell | SOLIDWORKS PDM
---
# DUMP Command
## Description
Dumps all session text into a log file and check it back into the vault.

## Syntax
```bash
dump filePath
```
## Parameters
- `filePath`: The log file to dump session details into.

## Examples
```bash
dump -filePath "$release_script_$yyyy_$mm_$dd_$guid.txt"
```
## Remarks
- To make sure your logs are always unique, use `$guid` or the date/time place holders. You can get more information about these place holders [here](/src/EVAL.html).

- If you start PDMShell as a Windows administrator with the `-winlog` or `/winlog` parameter, PDMShell will create logs in the Windows event viewer.

## Availability
Available since PDMShell 2.0.0 or earlier.
