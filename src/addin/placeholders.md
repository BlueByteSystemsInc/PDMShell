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
| `$(Variable.Configuration)` | PDM variable value for the current file and configuration |

Date and time placeholders such as `$yyyy`, `$MM`, `$dd`, `$timestamp`, `$date`, and `$time` are also supported.

## PDM variables

Use `$(Variable.Configuration)` to read PDM variable values.

```pdmshell
"$(Description.@)" contains "ECO"
"$(Revision.@)" equals "A"
```

Use `@` for the `@` tab. Use the configuration name when a specific configuration value is needed.

## Related articles

- [Conditions](conditions.md)
- [Runtime execution](runtime-execution.md)
