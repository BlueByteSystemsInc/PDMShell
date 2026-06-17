---
description: Waits for a specific number of seconds before continuing the script.
title: WAIT Command Documentation | PDMShell | SOLIDWORKS PDM
---
# WAIT Command Documentation

## DESCRIPTION:
Waits for the specified number of seconds, then continues to the next command.

Use `wait` when a script needs a fixed pause between commands.

## SYNTAX:
```bash
wait -timeout seconds
```

## PARAMETERS:
- `timeout`: Required. Number of seconds to wait. The value must be greater than zero.

## EXAMPLES:
```bash
wait -timeout 5

wait -timeout 30
```

## REMARKS:
- `wait` does not evaluate file, folder, process, variable, or search conditions.
- Use [`until`](UNTIL.md) when a script needs to wait until a condition becomes true.
