# Evaluation Functionality in PDMShell

## Overview
The **Evaluation** functionality in PDMShell allows dynamic value substitution using placeholders. This feature is supported by several commands and enables the use of file or folder properties, system variables, and other contextual information to generate new values dynamically.

Evaluation is not a standalone command but a **functionality** used by specific commands to process the `value` parameter or other relevant inputs.

---

## Commands Supporting Evaluation
The following commands support evaluation:

### Commands Using the Current Folder as the backing Object (`directory` parameter):
- **`cd`**: Change the current directory.
- **`mkdir`**: Create a new directory.
- **`exportcommand`**: Export commands to a file.
- **`addtvault`**: Add a vault with the directory as the backing object.

### Commands Using Files or Folders as the backing Object:
- **`rename`**: Uses the `value` parameter for renaming files or folders.
- **`setvar`**: Uses the `value` parameter to set variables for files or folders.

---

## Placeholders for Evaluation
The `value` parameter in supported commands can include placeholders that are dynamically replaced with actual values based on the context. The placeholders differ slightly depending on whether the backing object is a **file** or a **folder**.

### Placeholders for Files
- `$value`: Existing value of the variable.
- `$name`: The file name with extension.
- `$nameWithoutExtension`: The file name without extension.
- `$username`: The name of the logged-in user.
- `$vaultName`: The name of the vault.
- `$yyyy`: The current year.
- `$mm`: The current month (two digits).
- `$hh`: The current hour (two digits).
- `$mi`: The current minute (two digits).
- `$ss`: The current second (two digits).
- `$id`: The file ID.
- `$revision`: The current revision of the file (PDM revision, not the PDM variable).
- `$date`: The current date.
- `$time`: The current time in the current locale.
- `$version`: The current version of the file.
- `$extension`: The file extension.
- `$fullyQualifiedName`: The full local path of the file.
- `$fullyQualifiedFolderName`: The full local path of the folder containing the file.
- `$folderName`: The name of the folder containing the file.

### Placeholders for Folders
- `$value`: Existing value of the variable.
- `$name`: The folder name.
- `$folderName`: The name of the parent folder.
- `$id`: The folder ID.
- `$fullyQualifiedName`: The full local path of the folder.
- `$username`: The name of the logged-in user.
- `$vaultName`: The name of the vault.
- `$yyyy`: The current year.
- `$mm`: The current month (two digits).
- `$hh`: The current hour (two digits).
- `$mi`: The current minute (two digits).
- `$ss`: The current second (two digits).
- `$date`: The current date.
- `$time`: The current time in the current locale.

---

## Using Variables in Evaluation
In addition to placeholders, you can include other variables by enclosing them in square brackets (e.g., `[VariableName]`). These variables are dynamically resolved based on the context of the file or folder.
