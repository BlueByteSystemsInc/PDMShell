---
description: Changes the current PDM directory.
title: CD Command | PDMShell | SOLIDWORKS PDM
---
# CD Command
## Description
Changes the current PDM directory.

## Syntax
```bash
cd [-directory|-id]
```

## Parameters
- `directory` (or `d`): The directory to switch to. The directory parameter can be a relative or absolute path in PDM.
- `id`: ID of the folder to navigate to.

## Examples
```bash
cd -directory 'C:\Vault\NewFolder' # Navigates its newFolder
```
## Remarks
- Please be aware of the following special ways to change directory:
```bash
cd.. # Navigates to the parent folder
cd\  # Navigates to the root of the vault
```
- If the user just created a new folder and wants to `cd` to it using autocomplete, they need to use the `dir` command with the `-refresh` parameter to force the session to load the current files and sub-folders in the active directory. Using `-refresh` might affect the performance of the session if the current folder has too many files and sub-folders.
- `directory` is the default parameter. You do not need to specify it if it is the only parameter in your command. 
Example: 
```bash
cd api #navigates to the api folder
cd -id 755 #navigates to the folder with id 755
```

## Tutorial
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/cd.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>

## Availability
Available since PDMShell 2.0.0 or earlier.
