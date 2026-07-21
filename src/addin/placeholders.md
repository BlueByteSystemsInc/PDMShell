---
description: Add-in placeholders and command context values available to PDMShell scripts.
title: Add-in Placeholders and Command Context | PDMShell Add-in
---
# Add-in Placeholders and Command Context

The add-in evaluates placeholders for the current command context and the affected file or folder.

| Placeholder | Description |
| --- | --- |
| `$localPath`, `$filePath` | Local path of the current file, or folder path when the context is a folder |
| `$fileName`, `$filename`, `$name` | Current file or folder name |
| `$fileNameWithoutExtension` | File name without extension |
| `$extension` | File extension |
| `$id` | Current file or folder ID |
| `$state` | Current workflow state name for the current file |
| `$stateID` | Current workflow state ID for the current file |
| `$workflow` | Workflow name for the current file state |
| `$workflowID` | Workflow ID for the current file state |
| `$folderPath`, `$directory` | Current folder path |
| `$folderName` | Current folder name |
| `$folderID` | Folder ID |
| `$vaultName` | Current vault name |
| `$vaultRootFolder` | Local vault root folder |
| `$GUID` | Current script execution identifier |
| `$tempFolder`, `$TempFolder` | Windows temporary folder |
| `$machineName`, `$computerName` | Current machine name |
| `$userName`, `$username` | Current PDM user name |
| `$username.firstName`, `$username.lastName` | Current PDM user's first and last name when available |
| `$username.FullName` | Current PDM user's full name when available |
| `$username.email` | Current PDM user's email address when available |
| `$windowsUser` | Current Windows user name |
| `$userDomain`, `$domain` | Current Windows domain |
| `$configuration`, `$configurationName` | Configuration context when provided by the PDM event |
| `$buttonText` | Card button text when provided by the PDM event |
| `$cmdType`, `$commandType` | PDM command type that triggered the script |
| `$cmdId`, `$commandId` | PDM command ID when available |
| `$(Variable.@)`, `$(Variable.Configuration)` | PDM file variable value for the current file |
| `$(Variable)` | PDM folder variable value for the current folder |

Date and time placeholders such as `$yyyy`, `$MM`, `$dd`, `$timestamp`, `$date`, and `$time` are also supported.

## Workflow placeholders

Use `$state`, `$stateID`, `$workflow`, and `$workflowID` when an add-in script needs the selected file's current workflow information.

```pdmshell
msgbox -value "$fileName is in $state"
```

Workflow placeholders require a file context. They evaluate to an empty value when there is no current file or when PDM cannot resolve the file state.

## PDM variables

Use `$(Variable.Configuration)` to read PDM variable values from files. Use `.@` for the file `@` tab. Folder variables can use `$(Variable)` because folders do not use file configurations.

```pdmshell
"$(Description.@)" contains "ECO"
"$(Revision.@)" equals "A"
```

For file data card variables, the `.@` suffix is required when reading the file `@` tab, for example `$(Description.@)`. Use the configuration name when a specific configuration value is needed. Bracketed text is literal and is not evaluated as a PDM variable.

## Related articles

- [Conditions](conditions.md)
- [Script Editor](script-editor.md)
