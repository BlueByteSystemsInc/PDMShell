---
title: RunScript command
description: Run a PDMShell script from another script, the visual editor, or pdmcli.exe.
---

# runscript

`runscript` loads and runs a `.pdmshell` script file.

Use it when you want to keep shared automation in one script and call it from another command, from the visual editor, or directly from `pdmcli.exe`.

## Syntax

```text
runscript -source "C:\Vault\Scripts\CreateECO.pdmshell"
runscript -source "C:\Vault\Scripts\CreateECO.pdmshell" -filePath "C:\Vault\Parts\1001.sldprt"
runscript -source "C:\Vault\Scripts\CreateECO.pdmshell" -search "Name=%.sldprt" -recursive
runscript -source "C:\Vault\Scripts\CreateECO.pdmshell" -items "123,45;678,90"
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-source` | Mode-dependent | See parameter details below. |
| `-filePath` | Mode-dependent | See parameter details below. |
| `-search` | Mode-dependent | See parameter details below. |
| `-recursive` | Mode-dependent | See parameter details below. |
| `-items` | Mode-dependent | See parameter details below. |

### Parameter Details

Only one targeting mode is normally needed: `filePath`, [`search`](SEARCH.md), or `items`.

## Items format

Use `items` when an external command already knows the PDM IDs to process.

```pdmshell
runscript -source "C:\Vault\Scripts\CreateECO.pdmshell" -items "123,45;678,90"
```

Each item is separated by a semicolon.

| Item type | Format | Meaning |
| --- | --- | --- |
| File | `fileId,folderId` | The first value is the file ID. The second value is the containing folder ID. |
| Folder | `folderId,parentFolderId` | The first value is the folder ID. The second value is the parent folder ID. |

## Command-line shortcuts

`pdmcli.exe` can detect a `.pdmshell` path and convert it to `runscript`.

```powershell
pdmcli.exe "C:\Vault\Scripts\CreateECO.pdmshell"
pdmcli.exe "C:\Vault\Scripts\CreateECO.pdmshell" -items "123,45;678,90"
```

Use `-edit` to open a script in the visual editor without executing it.

```powershell
pdmcli.exe -edit "C:\Vault\Scripts\CreateECO.pdmshell"
pdmcli.exe "C:\Vault\Scripts\CreateECO.pdmshell" -edit
```

When `runscript` loads a script, the visual editor is hydrated only when the current editor is empty or clean. If the user has unsaved script changes, `runscript` still executes normally but does not replace the editor contents.

## Placeholder evaluation

When `runscript` is executed with `items`, `filePath`, or [`search`](SEARCH.md), placeholders are evaluated with the same context used by visual Run command execution.

Normal lines run once. Consecutive item-specific lines run once for each resolved file or folder.

An item-specific line is a line that contains a file, folder, vault, date/time, or PDM variable placeholder.

## Supported placeholders

| Placeholder | Description |
| --- | --- |
| `$localPath`, `$filePath` | Local path to the current file. |
| `$fileName`, `$filename`, `$name` | Current file or folder name. |
| `$fileNameWithoutExtension` | File name without extension. |
| `$extension` | File extension. |
| `$id` | Current file or folder ID. |
| `$folderPath`, `$directory` | Current folder path. |
| `$folderName` | Current folder name. |
| `$folderID` | Current folder ID. |
| `$vaultName` | Current vault name. |
| `$vaultRootFolder` | Local vault root folder. |
| `$GUID` | Current command/session GUID. |
| `$taskName` | Current task name when available. |
| `$tempFolder`, `$TempFolder` | Temporary folder path. |
| `$machineName`, `$computerName` | Windows machine name. |
| `$userName`, `$username` | Current PDM user name. |
| `$username.firstName`, `$username.lastName` | Current PDM user's first and last name when available. |
| `$username.FullName` | Current PDM user's full name when available. |
| `$username.email` | Current PDM user's email address when available. |
| `$windowsUser` | Current Windows user name. |
| `$userDomain`, `$domain` | Current Windows domain. |
| `$yyyy`, `$yy`, `$MM`, `$M`, `$dd`, `$d` | Date values. |
| `$month`, `$mon`, `$day`, `$dayShort` | Date name values. |
| `$HH`, `$hh`, `$mm`, `$ss`, `$tt` | Time values. |
| `$timestamp`, `$date`, `$time` | Common date/time formats. |
| `$completefilename` | Legacy complete file path placeholder. |
| `$completefoldername` | Legacy complete folder path placeholder. |
| `$(Variable)`, `$(Variable.Config)` | PDM variable value for the current file or folder. Use the explicit configuration form when a specific configuration tab is required. |

When the configuration is omitted, PDMShell uses `@` for `.sldprt` and `.sldasm` files, and an empty configuration for drawings, other file types, and folders. Bracketed text is literal and is not evaluated as a PDM variable.

## Example

The source script can use file placeholders and conditions. When the script is run for multiple items, these lines are evaluated for each target item.

```pdmshell
RunTask -filePath "$localPath" -taskName "Publish PDF & DXF"
until -conditions "$folderPath\$fileNameWithoutExtension.pdf exists" -timeout 500
```

## Free version limit

The free version is limited to 5 lines per script.

## Availability
Available since PDMShell 2.0.1.
