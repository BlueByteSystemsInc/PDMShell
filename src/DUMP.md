---
description: Dumps all session text into a log file.
title: DELETEFROMSOURCE Command Documentation | PDMShell | SOLIDWORKS PDM
---
# DUMP Command Documentation

## DESCRIPTION:
Dumps all session text into a log file and check it back into the vault.

## SYNTAX:

```bash
dump filePath
```
## PARAMETERS:

- `filePath`: The log file to dump session details into.

## EXAMPLES:
```bash
dump -filePath "$release_script_$yyyy_$mm_$dd_$guid.txt"
```
## REMARKS:
- To make sure your logs are always unique, use `$guid` or the date/time place holders. You can get more information about these place holders [here](/src/EVAL.html).
