---
description: Configure PDMShell add-in conditions with placeholders, variables, and nested groups.
title: Conditions | PDMShell add-in
---
# Conditions

The Conditions section controls whether a script should run for the current file, folder, or command context.

Conditions use the shared PDMShell condition syntax. See [Conditions](../conditions.md) for the full reference.

Use the Conditions editor to add condition rows, combine them with `and` or `or`, group expressions, and review the generated condition expression before saving the add-in script.

<p>
  <img src="../../images/pdmshell-addin-conditions-editor.png" alt="PDMShell add-in Conditions editor with condition rows and generated condition expression" style="max-width:920px;width:100%;height:auto;">
</p>

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

Enable Always show condition test message while building a script. This displays the condition expression and resolved values so you can confirm what PDM is passing into the script context.

## Related articles

- [Placeholders and command context](placeholders.md)
- [Conditions](../conditions.md)
- [Testing and troubleshooting](troubleshooting.md)
