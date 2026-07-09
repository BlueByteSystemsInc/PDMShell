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
- Vault and user placeholders such as `$vaultName`, `$vaultRootFolder`, `$username`, and `$username.email`.
- Date and time placeholders such as `$date`, `$time`, `$yyyy`, and `$timestamp`.
- PDM variables such as `$(Description)` or `$(Description.@)`.
- String functions such as `${before(...)}`, `${replace(...)}`, and `${regex(...)}`.
- Revision functions such as `${revision()}`, `${nextRevision()}`, and `${revisionComponentValue("ComponentName")}`.
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

<div align="center">
  <img src="/images/pdmshell-expression-evaluator-toolbar.png" alt="Expression Evaluator toolbar button in PDMShell" style="max-width:360px;width:100%;height:auto;">
</div>

The evaluator window shows the selected file or folder context, the optional variable and configuration inputs, the expression being tested, and the evaluated result.

<div align="center">
  <img src="/images/pdmshell-expression-evaluator-dialog.png" alt="PDMShell Expression Evaluator dialog showing a folder placeholder result" style="max-width:820px;width:100%;height:auto;">
</div>

## Examples

```text
$fileNameWithoutExtension
$(Description)
${before($fileNameWithoutExtension, "-")}
${replace($value, "DRAFT", "RELEASED")}
${regex($fileNameWithoutExtension, "^([^-]+)-", 1)}
${revision()}
${nextRevision()}
${revision("$folderPath\\$fileNameWithoutExtension.pdf")}
```

## Revision Function Examples

Revision functions evaluate against the selected PDM file unless the function includes an explicit file path argument. The examples below use a drawing whose PDM Version tab shows the current revision as `T-016-W`.

<div align="center">
  <img src="/images/pdmshell-revision-current-pdm.png" alt="SOLIDWORKS PDM Version tab showing the current revision T-016-W" style="max-width:760px;width:100%;height:auto;">
</div>

Use `${revision()}` when you need the current full revision display value. PDMShell formats the result using the active PDM revision scheme, so formatted components such as letters and zero-padded numbers are preserved.

```text
${revision()}
```

<div align="center">
  <img src="/images/pdmshell-expression-evaluator-revision-current.png" alt="Expression Evaluator showing revision function returning T-016-W" style="max-width:760px;width:100%;height:auto;">
</div>

Use component functions when you need to rebuild or inspect only part of the revision. In this example, the revision scheme has `Letters` and `Numeric` components. The current component values evaluate to `T` and `016`, producing `T-016-W`.

```text
${revisionComponentValue("Letters")}-${revisionComponentValue("Numeric")}-W
```

<div align="center">
  <img src="/images/pdmshell-expression-evaluator-revision-components-current.png" alt="Expression Evaluator showing revision component values returning T-016-W" style="max-width:920px;width:100%;height:auto;">
</div>

Use `nextRevisionComponentValue` when you need to preview the next formatted component values without changing the file. In the same scheme, the next values evaluate to `U` and `017`, producing `U-017-W`.

```text
${nextRevisionComponentValue("Letters")}-${nextRevisionComponentValue("Numeric")}-W
```

<div align="center">
  <img src="/images/pdmshell-expression-evaluator-revision-components-next.png" alt="Expression Evaluator showing next revision component values returning U-017-W" style="max-width:920px;width:100%;height:auto;">
</div>

Revision function names are case-insensitive, but the documentation uses lowercase names for consistency.

## File Context

Some expressions need a selected PDM file or folder to return a meaningful result.

Examples:

| Expression | Needs file or folder context |
| --- | --- |
| `$fileName` | Yes |
| `$filePath` | Yes |
| `$folderPath` | Yes |
| `$(Description)` | Yes |
| `${revision()}` | Yes |
| `${nextRevision()}` | Yes |
| `${revisionComponentValue("ComponentName")}` | Yes |
| `${revision("C:\Vault\File.pdf")}` | No, if the path is complete and the vault is logged in |
| `$vaultName` | No, if logged in |
| `$vaultRootFolder` | No, if logged in |
| `$date` | No |
| `$guid` | No |
| `$tempFolder` | No |

## Related Articles

- [Placeholders](EVAL.md)
- [Conditions](conditions.md)
- [IF Statements and Conditions](if-statements.md)
- [`msgbox`](MSGBOX.md)
