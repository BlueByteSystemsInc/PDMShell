---
description: The Dynamic Placeholders feature in PDMShell allows you to substitute values dynamically using placeholders
title: Dynamic Placeholders | PDMShell | SOLIDWORKS PDM
---
# Dynamic Placeholders in PDMShell

## Overview

The **Dynamic Placeholders** feature in PDMShell allows you to substitute values dynamically using placeholders. This functionality is supported by several commands and enables the use of file or folder properties, system variables, and other contextual information to generate new values automatically.

Dynamic Placeholders are not a standalone command but a **feature** used by specific commands to process the `value` parameter or other relevant inputs.

---

## Commands Supporting Dynamic Placeholders
The following commands support the use of dynamic placeholders:

### Commands Using the Current Folder as the Backing Object (`directory` parameter):
- **`cd`**: Change the current directory.
- **`mkdir`**: Create a new directory.
- **`export`**: Export commands to a file.
- **`addtvault`**: Add a vault with the directory as the backing object.

### Commands Using Files or Folders as the Backing Object:
- **`rename`**: Uses the `value` parameter for renaming files or folders.
- **`renamefromsource`**: The new file is evaluated if the `evaluatealiases` parameter is specified.
- **`setvar`**: Uses the `value` parameter to set variables for files or folders.
- **`bom`**: Uses the `name` parameter to set the exported bom csv name.
- **`export`**: Uses the `name` parameter to set the exported files name pattern.

---

## Placeholders for Dynamic Substitution
The `value` parameter in supported commands can include placeholders that are dynamically replaced with actual values based on the context. The placeholders differ slightly depending on whether the backing object is a **file** or a **folder**.

### Placeholders for Files
- `$value`: Existing value of the variable. If the existing value is null or empty, this evaluates to an empty string.
- `$name`: The file name with extension.
- `$nameWithoutExtension` or `$fileNameWithoutExtension`: The file name without extension.
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
- `$username`: The name of the logged-in user.
- `$vaultname`: The name of the vault.
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
Dynamic placeholders also support a small set of string functions. Functions are evaluated after placeholders such as `$value`, `$name`, and `[Variable]` have been resolved, so they can be used to manipulate the evaluated text.

String functions use the `${...}` syntax:

```bash
${left($value, 5)}
${replace($nameWithoutExtension, " ", "_")}
${before($nameWithoutExtension, "-")}
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

String functions can be nested when the nested function also uses `${...}`:

```bash
${left(${replace($value, " ", "_")}, 10)}
```

For example, if `$value` is `ABC 123 DRAFT`, the expression above evaluates to `ABC_123_DR`.

Unknown or invalid function expressions are left unchanged.

When a full command value is wrapped in double quotes, escape quotes inside function arguments with `\"`.

---

## Using Variables in Dynamic Placeholders
In addition to placeholders, you can include other variables by enclosing them in square brackets (e.g., `[VariableName]`). These variables are dynamically resolved based on the context of the file or folder.

---

## Example Usage
Here’s an example of how to use dynamic placeholders in a command:

### Renaming a File
```bash
rename -filePath 1.sldprt -value "$nameWithoutExtension_$yyyy$mm$dd$extension"
```

### Updating a Variable From Its Current Value
```bash
setvar -filePath file1.sldprt -variableName Description -value "${replace($value, \"DRAFT\", \"RELEASED\")}"
```

### Renaming With Nested String Functions
```bash
rename -filePath "Part 123 Draft.sldprt" -value "${left(${replace($nameWithoutExtension, \" \", \"_\")}, 12)}$extension"
```

### Renaming Everything Before a Separator
```bash
rename -filePath "ABC-123.sldprt" -value "${before($nameWithoutExtension, \"-\")}$extension"
```
