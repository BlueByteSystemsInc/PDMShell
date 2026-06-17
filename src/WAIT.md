---
description: Waits for a specific number of seconds before continuing the script.
title: WAIT Command | PDMShell | SOLIDWORKS PDM
---
# WAIT Command
## Description
Waits for the specified number of seconds, then continues to the next command.

Use `wait` when a script needs a fixed pause between commands.

## Syntax
```bash
wait -timeout seconds
```

## Parameters
- `timeout`: Required. Number of seconds to wait. The value must be greater than zero.

## Examples
```bash
wait -timeout 5

wait -timeout 30
```

## Remarks
- `wait` does not evaluate file, folder, process, variable, or search conditions.
- Use [`until`](UNTIL.md) when a script needs to wait until a condition becomes true.

## Availability
Available since PDMShell 4.0.4.
