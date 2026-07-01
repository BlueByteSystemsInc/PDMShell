---
description: Placeholders in PDMShell let you substitute file, folder, vault, user, date, variable, and global values in supported command parameters.
title: Placeholders | PDMShell | SOLIDWORKS PDM
---
# Placeholders in PDMShell

## Overview

Placeholders in PDMShell let you substitute values at runtime. Supported commands can use file or folder properties, system values, vault context, PDM variables, and other contextual information to generate values automatically.

Placeholders are not a standalone command. They are evaluated by supported commands when processing the `value` parameter or other relevant inputs.

---

## Commands Supporting Placeholders
The following commands support placeholders:

### Commands Using the Current Folder as the Backing Object (`directory` parameter):
- [`cd`](CD.md): Change the current directory.
- [`mkdir`](MKDIR.md): Create a new directory.
- [`export`](EXPORT.md): Export commands to a file.
- [`addtovault`](ADDTOVAULT.md): Add files to the vault with the directory as the backing object.

### Commands Using Files or Folders as the Backing Object:
- [`rename`](RENAME.md): Uses the `value` parameter for renaming files or folders.
- [`renamefromsource`](RENAMEFROMSOURCE.md): The new file is evaluated if the `evaluatealiases` parameter is specified.
- [`setvar`](SETVAR.md): Uses the `value` parameter to set variables for files or folders.
- [`bom`](BOM.md): Uses the `name` parameter to set the exported bom csv name.
- [`export`](EXPORT.md): Uses the `name` parameter to set the exported files name pattern.

---

## Placeholder Reference
The `value` parameter in supported commands can include placeholders that are replaced with actual values based on the current context. The placeholders differ slightly depending on whether the backing object is a file or a folder.

### Placeholders for Files
- `$value`: Existing value of the variable. If the existing value is null or empty, this evaluates to an empty string.
- `$name`: The file name with extension.
- `$fileNameWithoutExtension`: The file name without extension.
- `$extension`: The file extension.
- `$id`: The file ID.
- `$revision`: The current revision of the file (PDM revision, not the PDM variable).
- `$version`: The current version of the file.
- `$filePath`: The full local path of the file.
- `$folderPath`: The full local path of the folder containing the file.
- `$folderName`: The name of the folder containing the file.
- `$configuration`: configuration name. Only valid for BOM command.
- `[Variable]`: @ Variable value.

### Placeholders for Folders
- `$value`: Existing value of the variable. If the existing value is null or empty, this evaluates to an empty string.
- `$folderName`: The name of the parent folder.
- `$folderID`: The folder ID.
- `$folderPath`: The full local path of the folder.
- `[Variable]`:  Variable value.

### Common Placeholders (Applicable to Both Files and Folders)
- `$localPath`: Local path
- `$username`: The name of the logged-in PDM user.
- `$username.firstName`: The logged-in PDM user's first name when available.
- `$username.lastName`: The logged-in PDM user's last name when available.
- `$username.FullName`: The logged-in PDM user's full name when available.
- `$username.email`: The logged-in PDM user's email address when available.
- `$vaultName`: The name of the vault. `$vaultname` is also supported for compatibility.
- `$yyyy`: The current year.
- `$mm`: The current month (two digits).
- `$hh`: The current hour (two digits).
- `$mi`: The current minute (two digits).
- `$ss`: The current second (two digits).
- `$date`: The current date.
- `$time`: The current time in the current locale.
- `$guid`: Unique identifier.
- `$tempFolder`: User's local temp folder under App Data

Literal `\n` sequences in evaluated values are converted to `Environment.NewLine`.

---

## Global Variables
Session global variables use the `${global.Name}` syntax. They are set with `setglobal`, printed with `getglobal`, and cleared with `clearglobal`.

```bash
setglobal -name Project -value "ABC-100"
rename -filePath "$localPath" -value "${global.Project}-$name"
setvar -variableName Description -filePath "$localPath" -value "${global.Project} - $value"
```

Global variables are temporary and last only for the current PDMShell session or script run. See [Global Variables](GLOBALVARIABLES.md).

---

## String Functions
Placeholders also support a small set of string functions. Functions are evaluated after placeholders such as `$value`, `$name`, and `[Variable]` have been resolved, so they can be used to manipulate the evaluated text.

String functions use the `${...}` syntax:

```bash
${left($value, 5)}
${replace($fileNameWithoutExtension, " ", "_")}
${before($fileNameWithoutExtension, "-")}
${regex($fileNameWithoutExtension, "^([^-]+)-", 1)}
```

Supported functions:

| Function | Description |
| --- | --- |
| `${left(value, count)}` | Returns the first `count` characters. If `count` is longer than the value, the whole value is returned. |
| `${right(value, count)}` | Returns the last `count` characters. If `count` is longer than the value, the whole value is returned. |
| `${len(value)}` | Returns the number of characters in `value`. |
| `${pos(value, search)}` | Returns the zero-based position of `search` in `value`, or `-1` when it is not found. |
| `${replace(value, old, new)}` | Replaces all occurrences of `old` with `new`. |
| `${before(value, search)}` | Returns the text before `search`. If `search` is not found, the original value is returned. |
| `${after(value, search)}` | Returns the text after `search`. If `search` is not found, an empty string is returned. |
| `${regex(value, pattern)}` | Returns the first regular expression match. If no match is found, an empty string is returned. |
| `${regex(value, pattern, group)}` | Returns a capture group from the first regular expression match. `group` can be a group number or group name. If the group is not found, an empty string is returned. |

String functions can be nested when the nested function also uses `${...}`:

```bash
${left(${replace($value, " ", "_")}, 10)}
```

For example, if `$value` is `ABC 123 DRAFT`, the expression above evaluates to `ABC_123_DR`.

Unknown or invalid function expressions are left unchanged.

When a full command value is wrapped in double quotes, escape quotes inside function arguments with `\"`.

## Expression Evaluator

Use the [Expression Evaluator](expression-evaluator.md) to preview placeholders, PDM variables, and string functions before running a command or script.

---

## Using Variables in Placeholders
In addition to named placeholders, you can include PDM variables by enclosing them in square brackets (e.g., `[VariableName]`). These variables are resolved based on the context of the file or folder.

---

## Example Usage
Here is an example of how to use placeholders in a command:

### Renaming a File
```bash
rename -filePath 1.sldprt -value "$fileNameWithoutExtension_$yyyy$mm$dd$extension"
```

### Updating a Variable From Its Current Value
```bash
setvar -filePath file1.sldprt -variableName Description -value "${replace($value, \"DRAFT\", \"RELEASED\")}"
```

### Renaming With Nested String Functions
```bash
rename -filePath "Part 123 Draft.sldprt" -value "${left(${replace($fileNameWithoutExtension, \" \", \"_\")}, 12)}$extension"
```

### Renaming Everything Before a Separator
```bash
rename -filePath "ABC-123.sldprt" -value "${before($fileNameWithoutExtension, \"-\")}$extension"
```

### Renaming With a Regular Expression
```bash
rename -filePath "ABC-123.sldprt" -value "${regex($fileNameWithoutExtension, \"^([^-]+)-\", 1)}$extension"
```
