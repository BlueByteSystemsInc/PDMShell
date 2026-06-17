---
description: Configure PDMShell add-in conditions with placeholders, variables, and nested groups.
title: Conditions | PDMShell add-in
---
# Conditions

The **Conditions** section controls whether a script should run for the current file, folder, or command context.

Conditions use the same expression style as the PDMShell [until](../UNTIL.md) command.

## Supported condition features

- `and` and `or`
- nested groups with parentheses
- file, folder, and process exists checks
- text comparisons such as equals, contains, starts with, ends with, and regex matches
- numeric comparisons
- PDMShell placeholders such as `$fileName`, `$localPath`, and `$folderPath`
- PDM variables such as `$(Description.@)` or `$(Revision.@)`

## Examples

```pdmshell
$localPath exists
"$(Description.@)" contains "ECO"
($folderPath\ready.pdf exists or $folderPath\ready.dxf exists) and "$(State.@)" equals "Released"
```

## Condition test message

Enable **Always show condition test message** while building a script. This displays the condition expression and resolved values so you can confirm what PDM is passing into the script context.

## Related articles

- [Placeholders and command context](placeholders.md)
- [Testing and troubleshooting](troubleshooting.md)
