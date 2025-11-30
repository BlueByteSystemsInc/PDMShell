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

---

## Placeholders for Dynamic Substitution
The `value` parameter in supported commands can include placeholders that are dynamically replaced with actual values based on the context. The placeholders differ slightly depending on whether the backing object is a **file** or a **folder**.

### Placeholders for Files
- `$value`: Existing value of the variable.
- `$name`: The file name with extension.
- `$nameWithoutExtension`: The file name without extension.
- `$extension`: The file extension.
- `$id`: The file ID.
- `$revision`: The current revision of the file (PDM revision, not the PDM variable).
- `$version`: The current version of the file.
- `$fullyQualifiedName`: The full local path of the file.
- `$fullyQualifiedFolderName`: The full local path of the folder containing the file.
- `$folderName`: The name of the folder containing the file.
- `$configuration`: configuration name. Only valid for BOM command.

### Placeholders for Folders
- `$value`: Existing value of the variable.
- `$name`: The folder name.
- `$folderName`: The name of the parent folder.
- `$id`: The folder ID.
- `$fullyQualifiedName`: The full local path of the folder.

### Common Placeholders (Applicable to Both Files and Folders)
- `$username`: The name of the logged-in user.
- `$vaultName`: The name of the vault.
- `$yyyy`: The current year.
- `$mm`: The current month (two digits).
- `$hh`: The current hour (two digits).
- `$mi`: The current minute (two digits).
- `$ss`: The current second (two digits).
- `$date`: The current date.
- `$time`: The current time in the current locale.
- `$guid`: Unique identifier.
---

## Using Variables in Dynamic Placeholders
In addition to placeholders, you can include other variables by enclosing them in square brackets (e.g., `[VariableName]`). These variables are dynamically resolved based on the context of the file or folder.

---

## Example Usage
Here’s an example of how to use dynamic placeholders in a command:

### Renaming a File
```bash
rename -filePath 1.sldprt -value "$nameWithoutExtension_$yyyy$mm$dd$extension"