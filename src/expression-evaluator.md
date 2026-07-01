---
description: Use the PDMShell Expression Evaluator to preview placeholders, PDM variables, and string functions before running commands or scripts.
title: Expression Evaluator | PDMShell | SOLIDWORKS PDM
---

# Expression Evaluator

The Expression Evaluator lets you test dynamic values before you run a command, script, task, or rename rule.

Use it when you want to confirm what a placeholder, PDM variable, or string function will become at runtime.

## What It Helps With

The evaluator is useful for previewing:

- File and folder placeholders such as `$fileName`, `$filePath`, and `$folderPath`.
- Vault and user placeholders such as `$vaultName`, `$username`, and `$username.email`.
- Date and time placeholders such as `$date`, `$time`, `$yyyy`, and `$timestamp`.
- PDM variables such as `[Description]` or `$(Description.@)`.
- String functions such as `${before(...)}`, `${replace(...)}`, and `${regex(...)}`.
- Expressions that will later be used in commands like [`rename`](RENAME.md), [`setvar`](SETVAR.md), [`bom`](BOM.md), [`export`](export.md), [`msgbox`](MSGBOX.md), or [`until`](UNTIL.md).

## Why Use It

The evaluator previews the result without changing files, setting variables, checking files in, renaming anything, or writing back to the vault.

This makes it a safe place to test expressions before using them in production automation.

## How To Use It

1. Open the Expression Evaluator from the PDMShell toolbar.
2. Choose a PDM file or folder when the expression depends on file or folder context.
3. Choose a configuration when the expression depends on configuration-specific variables.
4. Choose a variable when you want `$value` to use the current value of that variable.
5. Type or choose the expression to test.
6. Review the evaluated result.

## Examples

```text
$fileNameWithoutExtension
[Description]
${before($fileNameWithoutExtension, "-")}
${replace($value, "DRAFT", "RELEASED")}
${regex($fileNameWithoutExtension, "^([^-]+)-", 1)}
```

## File Context

Some expressions need a selected PDM file or folder to return a meaningful result.

Examples:

| Expression | Needs file or folder context |
| --- | --- |
| `$fileName` | Yes |
| `$filePath` | Yes |
| `$folderPath` | Yes |
| `[Description]` | Yes |
| `$vaultName` | No, if logged in |
| `$date` | No |
| `$guid` | No |
| `$tempFolder` | No |

## Related Articles

- [Placeholders](EVAL.md)
- [Conditions](conditions.md)
- [IF Statements and Conditions](if-statements.md)
- [`msgbox`](MSGBOX.md)
