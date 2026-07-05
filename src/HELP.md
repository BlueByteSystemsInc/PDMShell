---
description: Lists commands and opens command documentation.
title: help Command | PDMShell | SOLIDWORKS PDM
---
# help
## Description
The `help` command lists available commands grouped by category. It can also open the documentation page for a specific command.

## Syntax

```text
help [-command|-c]
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-command` | No | Optional command name to open documentation for. |
| `-c` | No | See parameter details below. |

### Parameter Details

- `command`: Optional command name to open documentation for.

## Examples
```bash
help -c cd #opens the help page about the change directory command
```

```bash
help #lists commands by category
```

## Availability
Available since PDMShell 2.0.0.
