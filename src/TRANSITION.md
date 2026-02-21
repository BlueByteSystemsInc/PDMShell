---
title: TRANSITION Command Documentation | PDMShell | SOLIDWORKS PDM
description: Batch and single-file workflow state transitions using PDMShell
---

# TRANSITION Command Documentation

## DESCRIPTION

The `transition` command is used to move SOLIDWORKS PDM files from one workflow state to another using a specified transition.

This command supports three modes:

- Batch transition using CSV source (recommended for large migrations)
- Search-based transition
- Single file transition

# SYNTAX
```bash
# single file
transition -transitionid <id> -filePath <path>
# search and transition all results
transition -transitionid <id> -search <pattern> [-recursive]
# transition all files in the csv via the specified transition
transition -source <csv> -password <password> [-batch <size>] [-comment <text>]
```

# PARAMETERS

## transitionid
Specifies the workflow transition ID.
Required for search and filepath modes.

Example:
```bash
-transitionid 12
```
## source

Specifies a CSV file containing files to transition in batch.

The CSV may be:
- Absolute path
- Relative to current directory

Example:

-source transitions.csv

>[!IMPORTANT]
>The file must be locally cached.

## password

Specifies the PDM user password required to execute the transition.
Only used with `source` parameter.
Example:
```bash
-password mypassword
```

>[!IMPORTANT]
>Your password remains visible in your session output. Do not start PDMShell with winlog parameter.


## batch

Specifies how many files to process per batch.

Default:
1000
Example:
```bash
-batch 5000
```
Recommended values:
500

## comment

Specifies the transition comment.

Default:

Transitioned by PDMShell

Example:
```bash
-comment "Released by migration script"
```
---

## search

Searches for files matching a pattern in the current directory.

Example:
```bash
# find all parts in the current directory
-search %.sldprt
```
---

## recursive

Includes subfolders when used with search.

---

## filePath

Specifies a single file to transition.

Example:
```bash
# part is found the current directory
-filePath part.sldprt
```
---

# CSV FORMAT

Required format:

FileID,ParentFolderID,TransitionID

Example:

```bash
FileID,ParentFolderID,TransitionID
34521,1201,15
34522,1201,15
34523,1205,18
```
![transition.csv](/images/transitioncsv.png)
---

# BATCH MODE (SOURCE)

This is the recommended mode for:

- Data migrations
- Vault cleanup
- Bulk state changes
- Automation

Supports hundreds of thousands of files.

Example:
```bash
transition -source transitions.csv -password mypass -batch 2000
```
---

# IMPORTANT CONSIDERSATIONS FOR BATCH MODE

![ReferenceDialogSettings](/images/ReferenceDialogSettings.png)

PDMShell batch transitions are affected by the logged-in user’s Reference Dialog settings. If “Select child references during state change” and “Select references that are defined as drawing nodes during state change” are enabled, PDM will also transition referenced files, not just the source files from the CSV. If you want PDMShell batch mode to transition only the source files, these options must be disabled for the logged-in user.



# SEARCH MODE

Transitions files found using search.

Example:
```bash
transition -search %.sldasm -transitionid 12 -recursive
```
 

# SINGLE FILE MODE

Transitions one file.

Example:
```bash
transition -filePath part.sldprt -transitionid 12
```
 

# VALIDATION

The command automatically:

- Validates transition IDs
- Validates workflow permissions
- Validates file state eligibility
- Skips invalid files


# LICENSE LIMITATIONS

Free version limits number of files processed.

To remove limit: https://bluebyte.biz/product/pdmshell

# BEST PRACTICES

- Use source mode for large operations.
- Use batch size between 500 and 5000.
- Always test with small batch first.
- Backup vault before large operations.
