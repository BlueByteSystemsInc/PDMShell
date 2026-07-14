---
description: Sets the value of a variable for a specified checked out file or many checked out files.
title: setvar Command | PDMShell | SOLIDWORKS PDM
---
# setvar
## Description
Sets the value of a variable for a specified checked out file or many checked out files.

## Syntax

```text
setvar (-filePath path | -search query) -variableName variable_name [-value value | -clear] [-configNames configuration_names] [-recursive] [-stringformat format]
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-filePath` | Mode-dependent | The file or folder to set the variable for. |
| `-search` | Mode-dependent | The search operation to use. |
| `-variableName` | Mode-dependent | The variable to set. |
| `-value` | No | The value to assign to the variable. This parameter supports placeholders. When using `$value`, PDMShell substitutes the existing variable value; if the existing value is null or empty, `$value` evaluates to an empty... |
| `-clear` | No | Clears the variable value. |
| `-configNames` | No | The configuration names to set the variable for, separated by commas. |
| `-recursive` | No | When used with [`search`](SEARCH.md), includes files in subfolders. |
| `-stringformat` | No | string format. See remarks section. |

### Parameter Details

- `filePath`: The file or folder to set the variable for.

- `variableName`: The variable to set.

- `value`: The value to assign to the variable. This parameter supports placeholders. When using `$value`, PDMShell substitutes the existing variable value; if the existing value is null or empty, `$value` evaluates to an empty string. Literal `\n` sequences are converted to `Environment.NewLine`.

- `configNames`: The configuration names to set the variable for, separated by commas.


- `clear`: Clears the variable value.
- `search`: The search operation to use.


- `recursive`: When used with [`search`](SEARCH.md), includes files in subfolders.
- `stringformat`: Optional string format. Use `None` or omit this parameter when the evaluated value should be written without changing casing. See remarks section.

## Examples
```bash
setvar -filePath file1.sldprt -variableName Description -value $value -stringformat UpperCase # Upper case the current value.

setvar -filePath file1.sldprt -variableName Description -value "$value\n$fileNameWithoutExtension.pdf" # Append a new line and a generated PDF name.

setvar -filePath file1.sldprt -variableName Description -value "${replace($value, \"DRAFT\", \"RELEASED\")}" # Replace text in the current value.

setvar -filePath file1.sldprt -variableName Description -value "$(Description.@) - $fileNameWithoutExtension" # Read another file variable from the @ tab.

setvar -filePath file1.sldprt -variableName Code -value "${left(${replace($value, \" \", \"_\")}, 12)}" # Nested string evaluation.

setvar -search "Name=%.sldprt" -variableName Description -value "$value\nChecked by $username" -recursive
```

### Set A Variable From The Next Revision

You can use revision functions in `-value` to write the current or next PDM revision to a data card variable. This is useful for comments, release notes, or automation fields that need to preview the next formatted revision without changing the file revision.

```bash
setvar -filePath membrane.SLDDRW -variableName Comment -value "Incremented revision to ${nextRevisionComponentValue(\"Letters\")}-${nextRevisionComponentValue(\"Numeric\")}-W"
```

For a file whose next formatted revision components are `U` and `017`, the command writes:

```text
Incremented revision to U-017-W
```

<div align="center">
  <img src="/images/pdmshell-setvar-next-revision-comment.png" alt="setvar command writing a next revision value into the Comment variable" style="max-width:960px;width:100%;height:auto;">
</div>

When the value is wrapped in double quotes, escape quotes inside function arguments with `\"`.

### Set A Variable From A PDM Serial Number

Use `${serialNumber("SerialNumberName")}` to allocate a SOLIDWORKS PDM serial number and write it to a variable.

```bash
setvar -filePath file1.sldprt -variableName PartNo -value "${serialNumber(\"PartNumber\")}"
```

>[!Warning]
> The serial number function allocates a real PDM serial number each time the value is evaluated.

### Escaping Quotes In The Command Box

In the PDMShell command box, escape quotes inside function arguments when the whole `-value` argument is wrapped in double quotes. This is common when the value contains spaces.

```bash
setvar -filePath membrane.SLDDRW -variableName Comment -value "Incremented revision to ${nextRevisionComponentValue(\"Letters\")}-${nextRevisionComponentValue(\"Numeric\")}-W"
```

If the value does not need outer quotes, the function argument quotes do not need to be escaped.

```bash
setvar -filePath membrane.SLDDRW -variableName Comment -value ${nextRevisionComponentValue("Letters")}-${nextRevisionComponentValue("Numeric")}-W
```

In the [Expression Evaluator](expression-evaluator.md), type only the expression and do not escape the function argument quotes.

```text
${nextRevisionComponentValue("Letters")}-${nextRevisionComponentValue("Numeric")}-W
```

## Evaluation
The `value` parameter gets evaluated by PDMShell. This feature allows you to use placeholders in the new value, which will be replaced with actual values from the file or folder. This can be useful to dynamically generate new values based on file or folder properties or other variables.

`$value` is the current value of the same variable before the command writes the new value. If the current value is null or empty, `$value` evaluates to an empty string instead of staying as literal `$value`.

Use `$(VariableName.ConfigurationName)` to read another PDM variable while building the value. For file data card variables, include the configuration suffix. Use `.@` for the file `@` tab, for example `$(Description.@)`, and use the explicit configuration name for a named tab, for example `$(PartNo.Default)`. Folder variables can use `$(VariableName)` because folders do not use file configurations. Bracketed text is literal and is not evaluated as a PDM variable.

Use `\n` inside the value when you want PDMShell to write a real newline to the variable.

String and arithmetic functions can be used after placeholder evaluation. This is useful with `$value` because `$value` is resolved first, then functions such as `${left(...)}`, `${right(...)}`, `${len(...)}`, `${pos(...)}`, `${replace(...)}`, `${before(...)}`, `${after(...)}`, `${regex(...)}`, `${inc(...)}`, `${dec(...)}`, `${add(...)}`, and `${sub(...)}` run against the resolved text.

For example, if the existing variable value is `vA4-32(74)`, this value keeps the prefix and increments both counters:

```bash
setvar -filePath "Part.sldprt" -variableName Comment -value "${regex($value, \"^([^-]+)-(\\d+)\\((\\d+)\\)$\", 1)}-${inc(${regex($value, \"^([^-]+)-(\\d+)\\((\\d+)\\)$\", 2)})}(${inc(${regex($value, \"^([^-]+)-(\\d+)\\((\\d+)\\)$\", 3)})})"
```

>[!Note]
> Please read more information about placeholder evaluation [here](EVAL.md).

## Remarks
- The `configNames` parameter should be separated by commas. If omitted, PDMShell uses `@` for configuration-supported documents.
- The [`search`](SEARCH.md) parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.
- The `stringformat` parameter allows you to format the value of the variable using predefined string formatting options. The following formats are supported:
  - None: Leaves the evaluated value unchanged. This is the default when `-stringformat` is omitted.
  - UpperCase: Converts the entire string to uppercase.
  - LowerCase: Converts the entire string to lowercase.
  - CamelCase: Converts the string to camel case, where the first word is lowercase, and subsequent words are capitalized (e.g., `exampleString`).
  - FirstLetterCase: Capitalizes the first letter of the string and converts the rest to lowercase (e.g., `Example`).

## Tutorial
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/setvar.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>


## Changelog
- As of version [3.0.9](releasenotes.md), we have added support for setting folder daracard variables
- `$value` now evaluates to an empty string when the existing value is null or empty, and literal `\n` in evaluated values is converted to a newline.
- PDM variable evaluation now uses `$(Variable)` and `$(Variable.Configuration)` expressions. Bracketed text is literal.
- Dynamic placeholder evaluation supports string and arithmetic functions such as `${left(...)}`, `${right(...)}`, `${len(...)}`, `${pos(...)}`, `${replace(...)}`, `${before(...)}`, `${after(...)}`, `${regex(...)}`, `${inc(...)}`, `${dec(...)}`, `${add(...)}`, and `${sub(...)}`.
- `-stringformat None` leaves the evaluated value unchanged and is the default behavior when `-stringformat` is omitted.
- For file variables, use the explicit file configuration suffix such as `$(Description.@)` when reading the file `@` tab.

## Availability
Available since PDMShell 2.0.0.
