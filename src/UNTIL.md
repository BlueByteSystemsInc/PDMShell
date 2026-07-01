---
description: Waits until file, folder, process, variable, placeholder, or expression conditions become true.
title: until Command | PDMShell | SOLIDWORKS PDM
---
# until
## Description
Waits until the supplied condition expression evaluates to true, or until the timeout is reached.

Use `until` after commands such as [`runtask`](RUNTASK.md), [`runtemplate`](RUNTEMPLATE.md), [`export`](export.md), or any automation step that creates files asynchronously. This prevents the next command from running before the expected files, variables, or process state are ready.

## Syntax
```bash
until -conditions condition_expression [-timeout seconds] [-match all|any|one] [-filePath path | -search query]
```

## Parameters
- `conditions`: The condition expression to evaluate. Supports `and`, `or`, nested groups, file/folder/process exists checks, comparisons, PDM variables, placeholders, and simple arithmetic comparisons.
- `timeout`: Maximum number of seconds to wait before the command fails. If omitted, PDMShell uses the command default.
- `match`: When [`search`](SEARCH.md) returns multiple files, controls how many files must satisfy the conditions. Use `any` when one matching file is enough, `all` when every matching file must pass, or `one` when exactly one matching file must pass.
- `filePath`: Optional file context used to evaluate PDM variables and file placeholders.
- `search`: Optional search query. When supplied, PDMShell evaluates the condition against the files returned by the search.
- `directory`: Optional vault folder used as the search scope. Only valid with [`search`](SEARCH.md).
- `recursive`: Includes subfolders when used with [`search`](SEARCH.md).

## Examples
```bash
until -conditions "$localPath exists" -timeout 60

until -conditions "$folderPath\$fileNameWithoutExtension.pdf exists" -timeout 500

until -conditions "$folderPath\$fileNameWithoutExtension.pdf exists and $folderPath\$fileNameWithoutExtension.dxf exists" -timeout 500

until -conditions "$(Description.@) contains A" -filePath "C:\Vault\Parts\1001.sldprt" -timeout 30

until -conditions "1 + 3 greater than 3" -timeout 5

until -search "Name=%.sldprt;Locked=true" -conditions "$(Description.@) contains ECO" -match any -timeout 120
```

## Condition Format
The `until` command uses the shared PDMShell condition syntax. See [Conditions](conditions.md) for the full condition reference.

The visual editor builds conditions as three fields:

| Field | Meaning | Example |
| --- | --- | --- |
| Variable / placeholder | The left side of the condition. This can be a PDM variable, placeholder, path, text, or arithmetic expression. | `$localPath`, `$(Description.@)`, `1 + 3` |
| Operator | The operation to apply. | `Exists`, `Contains`, `Equal To`, `Greater Than` |
| Value | The right side of the condition. Hidden for `Exists`. | `A`, `3`, `$fileName` |

Examples of generated conditions:

```bash
$localPath exists
"$(Description.@)" contains "A"
"$(Revision.@)" equals "A"
1 + 3 greater than 3
```

>[!Note]
> PDM variables use `$(` and `)`, for example `$(Description.@)`. When writing conditions manually, quote PDM variable tokens if they appear inside a larger expression so the parser does not treat the parentheses as condition grouping.

## Supported Operators
- `exists` or `exist`
- `equals`, `equal`, `is`, `=`, `==`
- `not equals`, `!=`, `<>`
- `contains`
- `starts with`
- `ends with`
- `matches` or `regex`
- `less than`, `<`
- `less than or equal`, `<=`
- `greater than`, `>`
- `greater than or equal`, `>=`

## Exists Conditions
Use `exists` when the condition should wait for a file or folder path.

```bash
$localPath exists
$folderPath\ready.txt exists
file exists "$folderPath\ready.txt"
folder exists "$folderPath"
process exists "notepad"
```

When the left side is not explicitly `file`, `folder`, or `process`, PDMShell treats the condition as a file exists check by default. If the value looks like a folder path, PDMShell evaluates it as a folder check.

## Grouping Conditions
Use `and`, `or`, and parentheses to combine checks.

```bash
$folderPath\ready.pdf exists and $folderPath\ready.dxf exists

($folderPath\ready.pdf exists or $folderPath\ready.dxf exists) and "$(Description.@)" contains "Released"
```

## Placeholders
The `until` command supports placeholders in conditions. The most commonly used placeholders are:

| Placeholder | Meaning |
| --- | --- |
| `$localPath` / `$filePath` | Local path of the current file, or folder path when the context is a folder. |
| `$folderPath` / `$directory` | Local path of the file folder or current folder. |
| `$fileName` / `$filename` / `$name` | File name with extension. |
| `$fileNameWithoutExtension` | File name without extension. |
| `$extension` | File extension. |
| `$id` | File or folder ID. |
| `$version` | Current file version. |
| `$revision` | Current file revision. |
| `$folderName` | Folder name. |
| `$folderID` | Folder ID. |
| `$vaultName` / `$vaultname` | Vault name. |
| `$vaultRootFolder` / `$vaultrootfolder` | Local path of the vault root folder. |
| `$GUID` / `$guid` | Script or task GUID context when available. |
| `$taskName` | Task name context when available. |
| `$tempFolder` / `$TempFolder` | Windows temporary folder. |
| `$machineName` / `$computerName` | Current machine name. |
| `$userName` / `$username` | PDM logged-in user, or Windows user when no PDM user is available. |
| `$username.firstName` / `$username.lastName` | PDM logged-in user's first and last name when available. |
| `$username.FullName` | PDM logged-in user's full name when available. |
| `$username.email` | PDM logged-in user's email address when available. |
| `$windowsUser` | Windows user name. |
| `$userDomain` / `$domain` | Windows user domain. |
| `$configuration` | Current configuration context when available. |
| `$value` | Current value context when available. |
| `$completefilename` | Legacy complete file path placeholder. |
| `$completefoldername` | Legacy complete folder path placeholder. |

Date and time placeholders:

| Placeholder | Meaning |
| --- | --- |
| `$yyyy` / `$year` | Four-digit year. |
| `$yy` | Two-digit year. |
| `$MM` | Two-digit month number. |
| `$M` | Month number. |
| `$dd` | Two-digit day of month. |
| `$d` | Day of month. |
| `$month` | Full month name. |
| `$mon` | Short month name. |
| `$day` | Full day name. |
| `$dayShort` | Short day name. |
| `$HH` | 24-hour hour. |
| `$hh` | 12-hour hour. |
| `$mi` / `$mm` | Minutes. |
| `$ss` | Seconds. |
| `$tt` | AM/PM designator. |
| `$timestamp` | Timestamp in `yyyyMMdd_HHmmss` format. |
| `$date` | Date in `yyyy-MM-dd` format. |
| `$time` | Time in `HH-mm-ss` format. |

>[!Note]
> Placeholder names are evaluated case-insensitively in until conditions.

## PDM Variables
Use `$(VariableName.ConfigurationName)` to read a PDM variable from the file context.

```bash
"$(Description.@)" contains "ECO"
"$(Revision.@)" equals "A"
```

If the configuration is omitted, PDMShell uses `@`.

## Arithmetic Comparisons
Numeric expressions can be used on either side of a comparison.

```bash
1 + 3 greater than 3
2 * 5 equals 10
"$(Quantity.@)" greater than 0
```

Arithmetic is evaluated only for simple numeric expressions containing numbers, parentheses, and arithmetic operators.

## Remarks
- Use `filePath` when you need placeholders or PDM variables to be evaluated against one specific file.
- Use [`search`](SEARCH.md) and `match` when the same condition should be evaluated across multiple matching files.
- `exists` does not need a value in the visual editor.
- For generated PDF/DXF workflows, use placeholders such as `$folderPath`, `$fileNameWithoutExtension`, and `$extension` to avoid hard-coded output paths.

## Availability
Available since PDMShell 4.0.7.
