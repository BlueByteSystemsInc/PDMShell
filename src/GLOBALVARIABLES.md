---
description: Store and reuse session global variables in PDMShell scripts.
title: Global Variables | PDMShell | SOLIDWORKS PDM
---
# Global Variables

Global variables store temporary values for the current PDMShell session or script run. They are not SOLIDWORKS PDM datacard variables and they are not written to the vault.

Use global variables when several commands need the same value, or when a script needs to calculate a value once and reuse it later.

## Commands

```pdmshell
setglobal -name Project -value "ABC-100"
getglobal -name Project
getglobal
clearglobal -name Project
```

## Syntax

```pdmshell
setglobal -name variableName -value value
getglobal [-name variableName]
clearglobal -name variableName
```

## Parameters

- `name`: Global variable name. Names must start with a letter or underscore and can contain letters, numbers, and underscores.
- `value`: Value to store for the global variable.

## Using Global Variables

Use `${global.Name}` inside evaluated command parameters.

```pdmshell
setglobal -name Project -value "ABC-100"
rename -filePath "$localPath" -value "${global.Project}-$fileName"
setvar -variableName Description -filePath "$localPath" -value "${global.Project} - $value"
```

Global variables can also be used with string evaluation functions.

```pdmshell
setglobal -name BaseName -value "$fileNameWithoutExtension"
rename -filePath "$localPath" -value "${replace(${global.BaseName},OLD,NEW)}.pdf"
```

## Wait And Until

Global variables work with [`wait`](WAIT.md) and [`until`](UNTIL.md).

```pdmshell
setglobal -name Delay -value "10"
wait -timeout "${global.Delay}"

setglobal -name ReadyFile -value "C:\Temp\ready.txt"
until -conditions "${global.ReadyFile} exists" -timeout 60
```

## Remarks

- Global variable names are case-insensitive.
- `getglobal` without `name` prints all currently set global variables.
- Unknown `${global.Name}` references are left unchanged so typos are visible.
- Global variables are cleared when the PDMShell session ends.

## Availability
Available since PDMShell 4.0.7.
