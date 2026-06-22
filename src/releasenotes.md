---
description: PDMShell changelog and release notes for SOLIDWORKS PDM automation, including new commands, add-in updates, script templates, bug fixes, and upgrade notes.
title: PDMShell Changelog and Release Notes | SOLIDWORKS PDM Automation
keywords: PDMShell changelog, PDMShell release notes, SOLIDWORKS PDM automation, PDM command line, PDMShell add-in
---

# PDMShell Changelog And Release Notes

Track PDMShell releases, new command-line features, SOLIDWORKS PDM add-in updates, script library templates, bug fixes, and upgrade notes.

>[!Important]
> To update PDMShell properly, **download** the latest version, **uninstall** PDMShell and 
then **install** the latest version. **Do not update installed version.**

## 4.0.11 (06/21/2026)
- Added documentation for the WPF **Expression Evaluator**, including how to safely preview placeholder expressions against a selected PDM file or folder, use `$value`, choose configurations, and test string functions before running commands or scripts.
- Added an on-demand PDMShell add-in script demo to the **Command menu scripts** documentation, showing how users can launch a rename script from SOLIDWORKS PDM without creating a PDM Task.

## 4.0.10 (07/18/2026)
- Added logged-in PDM user profile placeholders: `$username.firstName`, `$username.lastName`, `$username.FullName`, and `$username.email`.
- Added a dark themed WPF **Expression Evaluator** dialog for testing placeholder expressions against a selected PDM file or folder before running a command.

## 4.0.9 (07/18/2026)
- Added the [`pasteasshared`](PASTEASSHARED.md) command to share one file or search results into another vault folder.

## 4.0.8 (07/18/2026)
- Added `${regex(value, pattern)}` and `${regex(value, pattern, group)}` dynamic placeholder string functions.
- Added the **Rename Before Dash** script template to the PDMShell Script Library.
- Fixed Script Library downloads so templates without a SOLIDWORKS macro no longer create or report an empty `Macro.swb` file.
- Updated the AI Assistant toolbar button to open the hosted PDMShell Assistant website.

## 4.0.7 (07/17/2026)
- **Added the PDMShell add-in for SOLIDWORKS PDM (Downloadable for Premium Users).**
- Added the Script Editor for configuring PDMShell scripts from inside PDM.
- Added script permissions for permitted users and groups.
- Added script conditions that control whether a script should run for the selected file, folder, or command context.
- Added right-click command menu support so configured scripts can appear as PDM menu commands.
- Added PDM event trigger points so scripts can run on supported PDM command hooks.
- Added condition test messages to help administrators validate scripts before production use.
- Added `pdmcli.exe -edit "script.pdmshell"` support to open a script in the visual editor without executing it.
- Added headless mode support for add-in automation. Use `pdmcli.exe -headless` or enable **Headless** in PDMShell settings to start a lighter execution shell for automation runs.
- Protected unsaved visual editor work by hydrating the editor from [`runscript`](RUNSCRIPT.md) only when the current editor is empty or clean.
- Added a default check-in comment value of `Checked by PDMShell` in the visual command builder.
- Changed [`wait`](WAIT.md) to a fixed-duration pause and moved condition polling to the new [until](UNTIL.md) command.
- Added session global variables with `setglobal`, `getglobal`, `clearglobal`, and `${global.Name}` evaluation.
- Updated the installer package for this release.

## 4.0.6 (06/12/2026)
- Enhanced script execution for command-line and automation scenarios.
- Added `runscript -items` for integrations that pass file and folder ID pairs.
- Updated [`runscript`](RUNSCRIPT.md) so `items`, `filePath`, and [`search`](SEARCH.md) use the same placeholder and PDM variable evaluation path as visual Run command execution.
- Added command-line `.pdmshell` detection so `pdmcli.exe "script.pdmshell"` runs the script and forwards supported parameters such as `-items`.
- Added the **Error Mode** setting. `Default` mode reports missing-file delete operations as warnings, while `Aggressive` mode keeps the previous hard-error behavior.

## 4.0.5 (06/10/2026)
- Enhanced script processing logic.

## 4.0.4 (06/10/2026)
- Added and documented the [wait](WAIT.md) command.
- Added condition expression support for file/folder/process existence, variable and placeholder comparisons, grouped `and` / `or` logic, and arithmetic comparisons.
- Simplified the Visual Code Editor wait conditions dialog to use a variable/placeholder field, operator dropdown, and conditional value field.
- Expanded wait-condition placeholder autocomplete and runtime placeholder evaluation.
- Fixed visual script editor command node icon rendering.
- Fixed visual script loading for root directory `cd -directory "\"` usage.
- Improved [`setvar`](SETVAR.md) evaluation so `$value` falls back to an empty string when null or empty, and literal `\n` writes a real newline.
- Updated [`pasteasreference`](PASTEASREFERENCE.md) behavior so `source` is the source file, [`search`](SEARCH.md) finds files to paste references to, and `filePath` is the reference to append.

## 4.0.3 (06/04/2026)
- Rebuild release.
- Fixed automatic login behavior when selecting or using vault view names.

## 4.0.1 (06/03/2026)
- Bumped PDMShell project versions to `4.0.1`.
- Updated [`help`](HELP.md) output to organize commands by category.
- Improved [`help`](HELP.md) responsiveness by reducing repeated UI updates and command metadata lookups.
- Standardized command descriptions in PDMShell and aligned command documentation wording.
- Added and documented the [whereusedtree](WHEREUSEDTREE.md) command for recursive where-used trees.
- Improved Visual Code Editor script saving, loading, canvas state restoration, and unsaved-change handling.
- Added Visual Code Editor canvas navigation controls such as zoom in, zoom out, and zoom to fit.
- Added the Check In All Files script to the script library.

## 4.0.0 (06/01/2026)
- Added [Visual Code Editor](visual-code-editor-4.md) for building PDMShell scripts as a workflow-style canvas.
- Added `Favorite=SEARCH FAVORITE` token to the advanced search.
- Added [runtemplate](RUNTEMPLATE.md) command to run SOLIDWORKS PDM templates from PDMShell.
- Added [pasteasreference](PASTEASREFERENCE.md) command to replace custom references from a file or search result.
## 3.0.71
- Fixed solidworks exception with `ruswmacrocommand`
- `list` parameter in `runswmacrocommand` now assumes first row is header
- Improved cancellation message when the user cancels the search 
- Improved search with variables.

## 3.0.70
- Fixed issue related to PDMShell staying in the task manager when it closes.
- Add `listreferencescommand` command

## 3.0.66-69 
- Remove dialog when calling [`quit`](QUIT.md) command
- Fixed few issues with updater

## 3.0.66 
- Added dark mode to the updates available dialog
- Added automatic update when you click on `Yes, update right now` in the updates available dialog 

## 3.0.59-65 
- Added fallback logic for when `addtovaultcommand` fails.  

## 3.0.58 (2026-03-23)
- Added retry logic for verifying license due to server overload. 

## 3.0.57 (2026-03-22)
- `dir`: Fixed search bug causing dir listing to be incomplete. 

## 3.0.56 (2026-03-22)
- Enhanced [`runscript`](RUNSCRIPT.md) and fixed minor bugs in the PDMShell add-in. 
- Added a new PDMShell add-in demo
## 3.0.55 (2026-03-20)
- Added a quick access button to PDMShell AI assistant
## 3.0.54 (2026-03-20)
- `deletefromsource`: API workaround for IEdmBatchDelete3 
## 3.0.53 (2026-03-18)
- `deletefromsource`: Fixed some bugs 

## 3.0.52 (2026-03-17)
- internal build

## 3.0.51 (2026-03-17)
- internal build

## 3.0.50 (2026-03-16)
- `updatesreferences`: added `csv` to save output.
## 3.0.49 (2026-03-16)
- Adding verbose logging to to [`addtovault`](ADDTOVAULT.md)
- `setvarfromsource`: Added error message to error code. 

## 3.0.48 (2026-03-15)
- Minor change to [`addtovault`](ADDTOVAULT.md): existing files found during add will be added to results file from parameter `csv`.
- Added the PDMShell add-in to run scripts from PDM. 

## 3.0.47 (2026-03-07)
- Added `edit` token to search. This will force a check out and check-in when using a PDM `-search` during any command. 
- Added [`version`](VERSION.md) to specify the version of SOLIDWORKS to use in [`export`](EXPORT.md) and [`runswmacro`](runswmacro.md) commands. 
 

## 3.0.46 (2026-03-06)
- Expanded `source` to take folder in [move](MOVE.md): This allow folders to be moved.

## 3.0.45 (2026-03-06)
- Add `label` parameter to [addtovault](ADDTOVAULT.md)


## 3.0.44 (2026-03-03)
- Add `count`, `clear`, `skip` parameters to [addtovault](ADDTOVAULT.md)


## 3.0.42 (2026-03-02)
- Small bugs fixes with the `csv` parameter in [addtovault](ADDTOVAULT.md)
- If you specify the word "DELETE" in the value of the custom property in the `propertymap`, PDMShell will delete the property prior to adding the file.

## 3.0.41 (2026-03-01)
- Added `propertymap` parameter to allow to set custom property prior to adding files to vault from a csv file.
- Changed `list` parameter in [addtovault](ADDTOVAULT.md) to `map`

## 3.0.40
## 3.0.39
Ghost builds

## 3.0.38 (2026-02-26)
- Added `update` parameter and changed the logic `refresh` parameter [DocManProps](DOCMANPROPS.md): `Update` now updates the files and `refresh` refresh the csv.


## 3.0.37 (2026-02-25)
- Added `list` parameter to [addtovault](ADDTOVAULT.md): CSV mapping file list
- Added `batch` parameter to [addtovault](ADDTOVAULT.md).
- Improved performance with large data sets [addtovault](ADDTOVAULT.md). 

## 3.0.36 (2026-02-24)
- Ignored temporary files in [DocManProps](DOCMANPROPS.md).
- Added support for listing non-solidworks in output of [DocManProps](DOCMANPROPS.md).
## 3.0.35 (2026-02-23)
## 3.0.34 (2026-02-23)
- Fixed bug when enumerating large data volume [DocManProps](DOCMANPROPS.md).
- pdmcli.exe now signed with a verified publisher.

## 3.0.33 (2026-02-21)
- Fixed escape and unescape bug in default mode in [DocManProps](DOCMANPROPS.md) command.
- Add `extensions` parameter to [DocManProps](DOCMANPROPS.md) command.

## 3.0.32 (2026-02-20)
- Added documentation for the [`transition`](TRANSITION.md)  [Transition](TRANSITION.md) command.

## 3.0.31 (2026-02-20)
- Added [`docmanprops`](DOCMANPROPS.md) to edit properties using the document manager [DocManProps](DOCMANPROPS.md) command.

## 3.0.30 (2026-02-17)
- Added `batch` parameter for destroying files in the [DeleteFromSource](DELETEFROMSOURCE.md) command.


## 3.0.29 (2026-02-16)
- Minor changes and updates to the docs.

## 3.0.28 (2026-02-11)
- Added `DuplicatedBy` token to advanced search and `DuplicateStrategy` parameter to the search command.
- Added [Move](MOVE.md) and [MoveFromSource](MOVEFROMSOURCE.md) commands.
## 3.0.27 (2026-02-09)
- Added [Pack And Go](PACKANDGO.md)
- Updated [Where Used](WHEREUSED.md)  

## 3.0.26 (2026-01-05)
- Happy New Year 2026!
- [get command](GET.md): `Directory` parameter is now **optional**. If not specified, the file is cached in its folder. If specified with an empty value, the file is cached at the root of the vault.
- Update tooltip for the `source` parameter in the [clear cache command](CLEARCACHE.md)


## 3.0.25 (2025-12-23)
- No added commands or bug fixes.  
- Updated parameters tooltip in [`addtovault`](ADDTOVAULT.md), [`rename`](RENAME.md), [`cd`](CD.md) and others.

## 3.0.24 (2025-12-22)
- parameter tooltips (little box that shows up next to the parameter when you type in the command box) are now uniaue for each command. Over the next releases, we will update all tooltips for all parameters to make them more clear. The same parameter can be used in multiple commands having different function in each.

## 3.0.23 (2025-12-20)
- Added [update references command](UPDATEREFERENCES.md)

## 3.0.22 (2025-12-19)
- Added [copy command](COPY.md)

## 3.0.21 (2025-12-18)
- Fixed single instance bug. All commands are now executed sequentially. Output is not during commands execution anymore. This was in 3.0.19 and 20
- Added `getoptions` in [Get](GET.md)
- Added `checkoutoptions` in [Checkout](CHECKOUT.md)

## 3.0.20 (2025-12-12)
- Fixed timeout issue with [Export](EXPORT.md) and [RunSwMacro](runswmacro.md).
- Added `name`, `filePath` and `value` parameters to [INBOX](INBOX.md). 
- `source` parameter default to current directory in [addtovaultcommmand](ADDTOVAULT.md). 

## 3.0.19 (2025-12-11)
- Added `winlog` parameter for pdmcli.exe. See remarks section of [dump command](DUMP.md).
- Fixed single instance bug. All commands are now executed sequentially. Output is blocked during commands execution.

## 3.0.18 (2025-12-08)
- Rebuild. Previous faulty build.

## 3.0.17 (2025-12-08)
- Fixed single instance issue related to Windows enviornment variables
- Added note for `solidworks` and `pdm`parameters in the [Version](VERSION.md) command: **RESERVED FOR FUTURE. NOT IMPLEMENTED**   

## 3.0.16 (2025-12-07)
- [Export: Added timeout parameter launching SOLIDWORKS](EXPORT.md).
- [RunSwMacro: timeout parameter is also enabled for launching SOLIDWORKS](runswmacro.md).
- Enforced `.pdmshell` extension across all commands as the scripting file extension.
## 3.0.15
- skipped

## 3.0.14 (2025-12-05)
- [Login: Fix bug with parameter casing](LOGIN.md).
- [Login: Added implementation with the transition command](TRANSITION.md).
- Updated documentation

## 3.0.13 (2025-12-04)
- [VERSIONUPGRADE: Added a new command](VERSIONUPGRADE.md).
- [VERSIONUPGRADEFROMSOURCE: Added a new command (Reserved but not implemented)](VERSIONUPGRADEFROMSOURCE.md).

## 3.0.12 (2025-12-03)
- [SetRevisionFromSource: Added a new command](SETREVISIONFROMSOURCE.md).

## 3.0.11 (2025-12-02)
- [SetRevision: Added a new command](SETREVISION.md).
 - Fixed evaluation bug: Bracketed variable `[Variable]` fail to evaluate in `name` and `value` parameters

## 3.0.10 (2025-12-01)
- Rebuild

## 3.0.9 (2025-12-01)
 - [INFOVAR: Fixed bug with related to single flag variables](INFOVAR.md) 
 - [SETVAR: Added support for handling folder cards](SETVAR.md) 

## 3.0.8 (2025-11-30)
 - Fixed unhandled exception when license is limited that causes a crash in all commands
 - Fixed evaluation bug (order)
 - Fixed some minor bugs in BOM command

## 3.0.7 (2025-11-29)
 - [BOM: Added a new command](BOM.md). Please see notes [here](howtoinstall.md#common-update-issues) about new commands in the **Common Update Issues** section.
 - [Added `$configuration` placeholder](EVAL.md)
 - Added release notes page
 - Fixed some minor typos for the delete and destroy commands
 - Change toolbar icons and tooltips for better UX
 
