---
description: Sets the value of a variable for a specified checked out file or many checked out files.
title: SETVAR Command | PDMShell | SOLIDWORKS PDM
---
# SETVAR Command
## Description
Sets the value of a variable for a specified checked out file or many checked out files.

## Syntax
```bash
setvar (-filePath path | -search query) -variableName variable_name [-value value | -clear] [-configNames configuration_names] [-recursive] [-stringformat format]
```
## Parameters
- `filePath`: The file or folder to set the variable for.

- `variableName`: The variable to set.

- `value`: The value to assign to the variable. This parameter supports dynamic placeholders. When using `$value`, PDMShell substitutes the existing variable value; if the existing value is null or empty, `$value` evaluates to an empty string. Literal `\n` sequences are converted to `Environment.NewLine`.

- `configNames`: The configuration names to set the variable for, separated by commas.


- `clear`: Clears the variable value.
- `search`: The search operation to use.


- `recursive`: When used with `search`, includes files in subfolders.
- `stringformat`: string format. See remarks section. 

## Examples
```bash
setvar -filePath file1.sldprt -variableName Description -value $value -stringformat UpperCase # Upper case the current value.

setvar -filePath file1.sldprt -variableName Description -value "$value\n$fileNameWithoutExtension.pdf" # Append a new line and a generated PDF name.

setvar -filePath file1.sldprt -variableName Description -value "${replace($value, \"DRAFT\", \"RELEASED\")}" # Replace text in the current value.

setvar -filePath file1.sldprt -variableName Code -value "${left(${replace($value, \" \", \"_\")}, 12)}" # Nested string evaluation.

setvar -search "Name=%.sldprt" -variableName Description -value "$value\nChecked by $username" -recursive
```
## Evaluation
The `value` parameter gets evaluated by PDMShell. This feature allows you to use placeholders in the new value, which will be replaced with actual values from the file or folder. This can be useful to dynamically generate new values based on file or folder properties or other variables.

`$value` is the current value of the same variable before the command writes the new value. If the current value is null or empty, `$value` evaluates to an empty string instead of staying as literal `$value`.

Use `\n` inside the value when you want PDMShell to write a real newline to the variable.

String functions can be used after placeholder evaluation. This is useful with `$value` because `$value` is resolved first, then functions such as `${left(...)}`, `${right(...)}`, `${len(...)}`, `${pos(...)}`, `${replace(...)}`, `${before(...)}`, and `${after(...)}` run against the resolved text.

>[!Note]
> Please read more information about placeholder evaluation [here](EVAL.md).

## Remarks
- The `configNames` parameter should be separated by commas. If omitted, PDMShell uses `@` for configuration-supported documents.
- The `search` parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.
- The `stringformat` parameter allows you to format the value of the variable using predefined string formatting options. The following formats are supported:
  - **UpperCase**: Converts the entire string to uppercase.
  - **LowerCase**: Converts the entire string to lowercase.
  - **CamelCase**: Converts the string to camel case, where the first word is lowercase, and subsequent words are capitalized (e.g., `exampleString`).
  - **FirstLetterCase**: Capitalizes the first letter of the string and converts the rest to lowercase (e.g., `Example`).

## Tutorial
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/setvar.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>


## Changelog
- As of version [3.0.9](releasenotes.md), we have added support for setting folder daracard variables
- `$value` now evaluates to an empty string when the existing value is null or empty, and literal `\n` in evaluated values is converted to a newline.
- Dynamic placeholder evaluation supports string functions such as `${left(...)}`, `${right(...)}`, `${len(...)}`, `${pos(...)}`, `${replace(...)}`, `${before(...)}`, and `${after(...)}`.

## Availability
Available since PDMShell 2.0.0 or earlier.
