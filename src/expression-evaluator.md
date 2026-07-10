---
description: Use the PDMShell Expression Evaluator to preview placeholders, PDM variables, and string functions before running commands or scripts.
title: Expression Evaluator | PDMShell | SOLIDWORKS PDM
---

# Expression Evaluator

The Expression Evaluator lets you test dynamic values before you run a command, script, task, or rename rule.

Use it when you want to confirm what a placeholder, PDM variable, or string function will become at runtime.

## How Evaluation Works

The evaluator combines three things:

| Input | What It Controls | Examples |
| --- | --- | --- |
| Context path | The selected PDM file or folder used by placeholders and variables. | `$fileName`, `$folderPath`, `$id`, `$(Description)`, `${revision()}` |
| `$value` source | Where `$value` comes from. | Sample text, or a selected PDM variable |
| Expression | The placeholder or function you want to test. | `${before(...)}`, `${regex(...)}`, `${add(...)}` |

The evaluator does not write anything back to PDM. It is only a preview tool.

## Context Path

Use the context path when the expression needs a selected PDM object.

| Context | Use It For | Examples |
| --- | --- | --- |
| PDM file | File name placeholders, file data card variables, revision functions, file ID/version/revision values. | `$fileNameWithoutExtension`, `$filePath`, `$extension`, `$id`, `$(Description.@)`, `${revision()}` |
| PDM folder | Folder placeholders, folder data card variables, folder ID values. | `$folderPath`, `$folderName`, `$directory`, `$folderID`, `$id`, `$(Project)` |
| No file or folder | Sample text, date/time placeholders, vault/user placeholders, and functions that do not need a file or folder. | `$date`, `$vaultName`, `${inc("032")}`, `${regex($value, "...", 1)}` |

Revision functions require a file context unless you pass a full file path into the function.

## `$value` Source

`$value` is the test input used by expressions such as `${replace($value, ...)}` or `${regex($value, ...)}`.

Choose one source:

| Source | What It Does | When To Use It |
| --- | --- | --- |
| Sample text | Uses the text you type in the evaluator. | Testing regex, arithmetic, and string functions against an example value. |
| PDM variable | Reads the current value of a selected data card variable from the selected file or folder. | Testing the same expression a command like [`setvar`](SETVAR.md) will use. |

When **PDM variable** is selected, the configuration box applies to file variables. Folder variables do not use configurations.

## Basic Workflow

1. Open the Expression Evaluator from the PDMShell toolbar.
2. Choose a context path when the expression needs a PDM file or folder.
3. Choose the `$value` source: **Sample text** or **PDM variable**.
4. Type the expression.
5. Click **Evaluate**.
6. Review the result before using the expression in a command or script.

<div align="center">
  <img src="/images/pdmshell-expression-evaluator-toolbar.png" alt="Expression Evaluator toolbar button in PDMShell" style="max-width:360px;width:100%;height:auto;">
</div>

The evaluator window shows the selected file or folder context, the selected `$value` source, the expression being tested, and the evaluated result.

<div align="center">
  <img src="/images/pdmshell-expression-evaluator-dialog.png" alt="PDMShell Expression Evaluator dialog showing the sample text value source" style="max-width:900px;width:100%;height:auto;">
</div>

## File Context Examples

### Preview A File Placeholder
Choose a PDM file when you want to test file placeholders.

```text
$fileNameWithoutExtension
```

For a selected file named `Bracket-001.SLDPRT`, this returns:

```text
Bracket-001
```

### Preview A File Data Card Variable
Use `$()` expressions when you want to read a file data card variable.

```text
$(Description)
```

Use a configuration name when the variable is configuration-specific:

```text
$(Description.@)
```

### Keep Text Before A Separator
Use `${before(...)}` when a file name has a predictable separator and you want the left side.

```text
${before($fileNameWithoutExtension, "-")}
```

For `Bracket-001`, this returns:

```text
Bracket
```

## Folder Context Examples

### Preview Folder Path Or Name
Choose a PDM folder when you want to test folder placeholders.

```text
$folderPath
```

This returns the selected folder path.

```text
$folderName
```

This returns the selected folder name.

### Preview Folder ID
`$id` resolves to the selected folder ID when the context path is a folder.

```text
$id
```

### Add To A Folder ID
Arithmetic functions can use numeric placeholders. For example, `${add($id, 5)}` adds `5` to the selected folder ID.

```text
${add($id, 5)}
```

<div align="center">
  <img src="/images/pdmshell-expression-evaluator-add-id.png" alt="Expression Evaluator showing add function used with the selected folder ID" style="max-width:900px;width:100%;height:auto;">
</div>

### Preview A Folder Data Card Variable
Choose **PDM variable** as the `$value` source, select a folder data card variable, and evaluate `$value` directly:

```text
$value
```

You can also transform the folder variable value:

```text
${replace($value, "DRAFT", "RELEASED")}
```

## `$value` Examples

### Replace Text In The Current Value
Choose **PDM variable** as the `$value` source when you want `$value` to come from the selected variable. Then use `${replace(...)}` to test how a command such as [`setvar`](SETVAR.md) would transform it.

```text
${replace($value, "DRAFT", "RELEASED")}
```

If `$value` is `FOR DRAFT REVIEW`, this returns:

```text
FOR RELEASED REVIEW
```

### Preserve Zero Padding
Integer arithmetic preserves leading zero padding from the first argument.

```text
${inc("032")}
```

This returns:

```text
033
```

## Regex Examples

### Extract A Value With Regex
Use `${regex(...)}` when simple functions like `${before(...)}` and `${after(...)}` are not enough.

```text
${regex($fileNameWithoutExtension, "^([^-]+)-", 1)}
```

This pattern means:

- `^` starts at the beginning of the text.
- `([^-]+)` captures one or more characters that are not `-`.
- `-` requires the captured text to be followed by a dash.
- `1` returns the first capture group.

For `Bracket-001`, this returns:

```text
Bracket
```

### Increment Counters Inside Sample Text
Choose **Sample text** as the `$value` source and type:

```text
vA4-32(74)
```

Then evaluate:

```text
${regex($value, "^([^-]+)-(\d+)\((\d+)\)$", 1)}-${inc(${regex($value, "^([^-]+)-(\d+)\((\d+)\)$", 2)})}(${inc(${regex($value, "^([^-]+)-(\d+)\((\d+)\)$", 3)})})
```

This expression:

- keeps the prefix before the dash with the first regex group;
- extracts `32` with the second regex group and increments it;
- extracts `74` with the third regex group and increments it;
- rebuilds the final value with the original punctuation.

The result is:

```text
vA4-33(75)
```

>[!Tip]
> Regex is powerful, but complex naming rules can become hard to read and maintain. If your team needs help designing, reviewing, or troubleshooting complex PDMShell expressions, Blue Byte Systems offers [Enterprise Support Services](https://bluebyte.biz/product/enterprise-support-services/).

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

## Context Reference

Use this table when you are not sure which context an expression needs.

| Expression Type | Best Context | Notes |
| --- | --- | --- |
| `$fileName`, `$filePath`, `$extension`, `$version` | PDM file | These depend on a selected file. |
| `$folderPath`, `$folderName`, `$directory`, `$folderID` | PDM folder | These depend on a selected folder. |
| `$id` | PDM file or folder | Returns the selected file ID for file context, or folder ID for folder context. |
| `$(Description)` | PDM file or folder | Reads the variable from the selected data card. |
| `$(Description.@)` | PDM file | Use a configuration when reading a file variable that supports configurations. |
| `$value` with **Sample text** | Any context or no context | Uses the text typed in the evaluator. |
| `$value` with **PDM variable** | PDM file or folder | Reads the selected data card variable from the selected context. |
| `${revision()}` and `${nextRevision()}` | PDM file | Revision functions need file context because folders do not have file revisions. |
| `${revision("C:\Vault\File.pdf")}` | Any context if logged in | The function resolves the supplied file path directly. |
| `$vaultName`, `$vaultRootFolder` | Any context if logged in | These come from the logged-in vault. |
| `$date`, `$time`, `$guid`, `$tempFolder` | No context required | These values do not depend on a selected file or folder. |

## Related Articles

- [Placeholders](EVAL.md)
- [Conditions](conditions.md)
- [IF Statements and Conditions](if-statements.md)
- [`msgbox`](MSGBOX.md)
