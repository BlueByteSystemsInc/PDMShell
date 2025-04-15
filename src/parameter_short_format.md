# Short Format for Parameters in PDMShell

## Overview

PDMShell supports short formats for many of its parameters to make commands more concise and easier to use. These short formats are defined for specific parameters and can be used as an alternative to their full names. Below is a comprehensive list of parameters and their corresponding short formats.

---

## List of Parameters and Their Short Formats

| **Parameter**            | **Short Format** | **Description**                                                                 |
|---------------------------|------------------|---------------------------------------------------------------------------------|
| `username`               | `u`              | Specifies the username for authentication.                                      |
| `password`               | `p`              | Specifies the password for authentication.                                      |
| `vaultName`              | `v`              | Specifies the name of the PDM vault.                                            |
| `filePath`               | `f`              | Specifies the file path to operate on.                                          |
| `command`                | `c`              | Specifies the command name.                                               |
| `search`                 | `s`              | Specifies the search query. Can use % for wildcard.                                                    |
| `directory`              | `d`              | Specifies the directory to operate on.  Wrap in "" if there are spaces.                                         |
| `columns`                | `cols`           | Specifies the columns to include in the output. Wrap in "" if there are spaces. Seperate multiple by comma.                                 |
| `csv`                    | `csv`            | Specifies the CSV file to use. You need to include extension.                                                 |
| `sort`                   | `sort`           | Specifies the sorting order by column name. Used only in `dir` command.                                                    |
| `programName`            | `prog`           | Specifies the program name.                                                     |
| `configNames`            | `configs`        | Specifies the configuration names. Wrap in "" if there are spaces. Seperate multiple by comma.                                               |
| `value`                  | `val`            | Specifies the value to set. Wrap in "" if there are spaces.                                                    |
| `version`                | `ver`            | Specifies the version of the file or software.                                  |
| `variableName`           | `var`            | Specifies the name of the variable.                                             |
| `clearToggle`            | `cls`            | Toggles clearing the variable. Used only `setvar` command.                                           |
| `comment`                | `cmt`            | Specifies a comment during check-in. Wrap in "" if there are spaces.                                                           |
| `checkinoptions`         | `ciopt`          | Specifies options for check-in operations.                                      |
| `oldVersion`             | `oversion`       | Specifies the old version of the file.                                          |
| `refresh`                | `refresh`        | Refreshes the current session autocomplete list. Use with `dir`.                                                  |
| `checkinouttoggle`       | `checkinouttoggle` | Toggles check-in or check-out operations.                                       |
| `process`                | `process`        | Specifies the process to execute.                                               |
| `list`                   | `list`           | Lists items based on the specified criteria.                                     |
| `batch`                  | `batch`          | Specifies batch operations.                                                     |
| `id`                     | `id`             | Specifies the ID of the file or folder.                                         |
| `mkvarattributes`        | `mkvarattributes`| Specifies attributes for variable creation.                                     |
| `TransitionID`           | `trid`           | Specifies the transition ID.                                                    |
| `source`                 | `source`         | Specifies the source file or folder.                                            |
| `destory`                | `dest`           | Specifies the destination file or folder.                                       |
| `recursive`              | `recursie`       | Toggles recursive operations.                                                   |
| `extensions`             | `ext`            | Specifies file extensions to include.                                           |
| `ignoreexisting`         | `ignoreex`       | Ignores existing files or folders.                                              |
| `date`                   | `date`           | Specifies the date.                                                             |
| `updaterefs`             | `updaterefs`     | Updates references for files or folders.                                        |
| `includesubfolders`      | `includesubfolders` | Includes subfolders in the operation.                                          |
| `includeproperties`      | `includeproperties` | Includes properties in the operation.                                          |
| `toolboxflag`            | `toolboxflag`    | Toggles the toolbox flag.                                                       |
| `evaluatealias`          | `evaluatealias`  | Evaluates aliases for dynamic placeholders.                                     |
| `stringformat`           | `stringformat`   | Specifies the string format.                                                    |
| `taskName`               | `taskName`       | Specifies the name of the task.                                                 |
| `suffix`                 | `suffix`         | Specifies a suffix to append.                                                   |
| `prefix`                 | `prefix`         | Specifies a prefix to prepend.                                                  |
| `includedrawings`        | `includedrawings` | Includes drawings in the operation.                                            |
| `latest`                 | `latest`         | Toggles the use of the latest version.                                          |

---

## Usage Example

Here’s an example of using short formats in a command:

### Full Format
```bash
setvar -filePath "C:\Vault\File.sldprt" -variableName "VariableName" -value "NewValue"
```