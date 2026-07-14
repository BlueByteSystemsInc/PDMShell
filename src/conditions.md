---
description: Learn the condition expression syntax used by PDMShell visual IF statements, until, and add-in conditions.
title: Conditions | PDMShell | SOLIDWORKS PDM
---

# Conditions

Conditions let PDMShell decide whether something is true before continuing. The same condition style is used by:

- [IF statements and conditions](if-statements.md) in the Visual Code Editor.
- The [`until`](UNTIL.md) command.
- [PDMShell add-in conditions](addin/conditions.md).

Use conditions when a script needs to check file names, folder paths, PDM variables, placeholder values, process state, generated output files, or simple numeric comparisons.

## Basic Shape

A condition usually has three parts:

| Part | Example |
| --- | --- |
| Left value | `$fileName` |
| Operator | `contains` |
| Right value | `"ECO"` |

Example:

```text
$fileName contains "ECO"
```

PDMShell evaluates the expression at runtime. If the condition is true, the waiting command, IF branch, or add-in script rule can continue.

## Supported Operators

| Operator | Example |
| --- | --- |
| `exists` | `$localPath exists` |
| `equals`, `equal`, `is`, `=`, `==` | `$revision equals "A"` |
| `not equals`, `!=`, `<>` | `$fileName not equals "test.pdf"` |
| `contains` | `$fileName contains "ECO"` |
| `starts with` | `$fileName starts with "PRJ"` |
| `ends with` | `$fileName ends with ".pdf"` |
| `matches`, `regex` | `$fileName matches ".*\\.pdf"` |
| `less than`, `<` | `$version less than 5` |
| `less than or equal`, `<=` | `$version less than or equal 5` |
| `greater than`, `>` | `$version greater than 1` |
| `greater than or equal`, `>=` | `$version greater than or equal 1` |

## Exists Checks

Use `exists` to check files, folders, or processes.

```text
$localPath exists
$folderPath\ready.pdf exists
file exists "$folderPath\ready.pdf"
folder exists "$folderPath"
process exists "notepad"
```

When the left side is not explicitly `file`, `folder`, or `process`, PDMShell treats it as a file check unless the value looks like a folder path.

## PDM Variables

Use `$(VariableName.ConfigurationName)` to read a PDM variable from the current file context. Use `.@` for the file `@` tab. Folder variables can use `$(VariableName)` because folders do not use file configurations.

```text
"$(Description.@)" contains "ECO"
"$(Revision.@)" equals "A"
```

For file data card variables, the `.@` suffix is required when reading the file `@` tab, for example `$(Description.@)`. Bracketed text is literal and is not evaluated as a PDM variable.

## Placeholders

Conditions can use [PDMShell placeholders](EVAL.md).

Common examples:

| Placeholder | Meaning |
| --- | --- |
| `$fileName` | Current file name. |
| `$filePath` | Current file path. |
| `$folderName` | Current folder name. |
| `$folderPath` | Current folder path. |
| `$vaultName` | Current vault name. |
| `$revision` | Current file revision when available. |
| `$version` | Current file version when available. |

>[!NOTE]
> File-specific placeholders need file or folder context. In the Visual Code Editor, use a run option that provides selected items when the condition depends on a selected file or folder.

## Combining Conditions

Use `and`, `or`, and parentheses to combine checks.

```text
$folderPath\ready.pdf exists and $folderPath\ready.dxf exists

($folderPath\ready.pdf exists or $folderPath\ready.dxf exists) and "$(Description.@)" contains "Released"
```

## Numeric Comparisons

Numeric expressions can be used on either side of a comparison.

```text
1 + 3 greater than 3
2 * 5 equals 10
"$(Quantity.@)" greater than 0
```

## Where Conditions Are Used

| Feature | How conditions are used |
| --- | --- |
| [IF statements and conditions](if-statements.md) | Choose between `Conditions Met` and `Else` paths. |
| [`until`](UNTIL.md) | Wait until a condition becomes true or timeout is reached. |
| [PDMShell add-in conditions](addin/conditions.md) | Decide whether a configured add-in script should run. |

## Tips

- Quote PDM variable expressions when they appear inside a larger condition.
- Use [Expression Evaluator](expression-evaluator.md) to test placeholder values before relying on them in a condition.
- Keep conditions small and readable when possible.
