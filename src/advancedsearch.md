---
description: Learn how to run PDMShell advanced search
title: Notes About Using Advanced Search In PDMShell | SOLIDWORKS PDM
---
# PDMShell Advanced Search Guide

PDMShell provides a complete search engine based on PDM's own search. This feature is extremely useful with commands that have a `-search` parameter. 

This guide explains how the `-search` parameter works, how to use tokens, variables, operators, and how PDMShell parses and applies search rules.

## 1. Overview

The `-search` parameter accepts simple text queries or advanced multi-condition expressions that filter files and folders using PDM system tokens and variable values.

## 2. Simple Searches

If no operators are present, the entire input is treated as a Name filter.

Examples:  
```bash
pump  
assembly_1001  
*.sldasm
```
Equivalent to: 
```bash 
Name=pump
```



## 3. Advanced Syntax

Multiple conditions are separated using semicolons.

Example:  
```bash 
Name=Pump;Recursive=true;VersionsBefore=20200101
```
>[!Note]
> Dates must follow the `yyyMMdd` format.

Escaping rules:  
```bash 
\; inserts a semicolon  
\= inserts an equals sign  
\\ inserts a literal backslash
```

Example:  
```bash 
Name=Valve\=A;Label=Released\;Approved
``` 

## 4. Built-in Search Tokens

These tokens map directly to EdmSearchToken values and control how PDMShell filters PDM objects.

### Table: Supported Search Tokens

| Token | Description |
|-------|-------------|
| Name | File or folder name filter |
| AllVersions | Search all versions |
| ContentText | Full-text content search string |
| ContentTextExact | Exact match of content |
| ContentTextInBody | Search inside file body |
| ContentTextInProperties | Search in custom properties |
| ContentTextOr | Match any word |
| FindFiles | Include files in results |
| FindFolders | Include folders in results |
| FindItems | Include items in results |
| FolderID | Starting folder ID |
| HistoryAfter | Search history after date |
| HistoryBefore | Search history before date |
| HistoryString | History string search |
| HistoryStringConfiguration | Search configuration names |
| HistoryStringFileName | Search file names in history |
| HistoryStringLabels | Search labels in history |
| HistoryStringRevisionComment | Search revision comments |
| HistoryStringStateComment | Search state change comments |
| HistoryStringVariableValues | Search variable changes |
| HistoryStringVersionComment | Search version comments |
| Label | Search label text |
| LabelAfter | Labels after date |
| LabelBefore | Labels before date |
| LabelByUser | Labels created by user |
| LabelComment | Search label comment |
| Locked | Return checked-out files |
| LockedBy | Return files locked by user |
| Recursive | Include subfolders |
| StateAfter | State changes after date |
| StateBefore | State changes before date |
| StateByUser | User who changed state |
| StateHistoric | Search historic states |
| StateID | Workflow state ID |
| StateName | Workflow state name |
| Unlocked | Return checked-in files |
| VersionComment | Search version comment |
| VersionsAfter | Versions after date |
| VersionsBefore | Versions before date |
| VersionsByUser | Versions created by user |
| WorkflowName | Search by workflow name |

## 5. Default Behavior

`FolderID` defaults to the active directory.  
`Recursive` defaults to the global flag.  
`FindFolders` defaults to the includefolders flag.  
`FindFiles` is always true.

## 6. Variable Search

Conditions beginning with @ use PDM variables.

Format: 
```bash  
@VariableName Operator Value
```

Examples:  
```
@Description=Pump  
@Weight>=10  
@Revision!=A  
@Material~Steel  
@ProjectCode!~TEST  
```

PDMShell automatically:

1. Detects the operator  
2. Extracts variable name and value  
3. Looks up the variable definition using IEdmVariable5  
4. Determines the variable type  
5. Converts the value to the correct type  
6. Selects the appropriate EdmVarOp_* enum  
7. Applies AddVariable2

## 7. Supported Variable Operators

PDMShell supports all major comparison operators for variables.

### Table: Supported Operators

| Symbol | Meaning |
|--------|---------|
| = | Equal |
| != | Not equal |
| <> | Not equal |
| > | Greater than |
| < | Less than |
| >= | Greater or equal |
| <= | Less or equal |
| ~ | Contains |
| !~ | Does not contain |

## 8. Variable Operator-to-Enum Mapping

### Table: String Variable Operator Mapping

| Symbol | Enum |
|--------|------|
| = | Equals |
| != / <> | Different |
| > | Greater |
| < | Less  |
| >= | Greater or equal |
| <= | Less or equal |
| ~ | Contains |
| !~ | Not contains |

### Numeric and date types use the corresponding numeric/date enum sets.

Dates must be in the format: yyyyMMdd

## 9. Operator Detection

Operators are detected longest-first to avoid ambiguity.

### Table: Operator Detection Order

| Order | Operator |
|-------|----------|
| 1 | >= |
| 2 | <= |
| 3 | != |
| 4 | <> |
| 5 | !~ |
| 6 | ~ |
| 7 | > |
| 8 | < |
| 9 | = |

This ensures >= is not incorrectly parsed as >.

## 10. Combining Tokens and Variables

Tokens and variable conditions can be mixed:
```bash 
Name=Pump;@Description~Steel;StateName=Released;@Weight>=5
```

All conditions must match.

## 11. Invalid Input Handling

Invalid expressions are ignored silently. PDMShell continues applying valid conditions.

Examples ignored:
```bash 
@MissingVar=Test  
HistoryBefore=BADDATE  
UnknownKey=Value  
```

## 12. Examples

Search by name:
```bash 
Name=Valve
```

Search by folder:
```bash 
Name=Valve;FolderID=102
```

Variable contains:
```
@Description~Pump
```
Token and variable together:
```bash 
StateName=Approved;@Revision!=A
```
More complex:
```bash 
Name=Pump;@Material~Steel;@Weight>=15;Recursive=true;VersionsBefore=20200101
```
## 13. Technical support

Please reach out to us if you have a premium license or considering getting one from our contact [page](https://bluebyte.biz/contact) on our main website.
