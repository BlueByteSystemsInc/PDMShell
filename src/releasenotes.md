---
description: PDMShell changelog and release notes for SOLIDWORKS PDM automation, including new commands, add-in updates, script templates, bug fixes, and upgrade notes.
title: PDMShell Changelog and Release Notes | SOLIDWORKS PDM Automation
keywords: PDMShell changelog, PDMShell release notes, SOLIDWORKS PDM automation, PDM command line, PDMShell add-in
---

# PDMShell Changelog And Release Notes

Track PDMShell releases, new command-line features, SOLIDWORKS PDM add-in updates, script library templates, bug fixes, and upgrade notes.

>[!Important]
> To update PDMShell properly, download the latest version, uninstall PDMShell and 
then install the latest version. Do not update installed version.

## 4.0.27 (2026-07-08)
- Improved revision placeholder evaluation so `${revision()}`, `$revision`, and revision component functions use the active PDM revision scheme formatting when resolving the current file revision.
- Improved revision component parsing for formatted PDM revision schemes, including letter components, zero-padded numbers, hexadecimal numbers, and date/time format tokens.
- Updated [Expression Evaluator](expression-evaluator.md) examples to show current revision values, current revision component values, and next revision component values against a selected PDM file.
- Updated [`setvar`](SETVAR.md) documentation with an example that writes the next formatted revision value into a data card variable, clarified command-box quote escaping, and documented `-stringformat None`.
- Added a dedicated dark license node conflict dialog with resources for pooled add-in licenses and machine licenses.
- Added a main-window license banner for free-version usage or licenses expiring within 30 days, including a direct `Order license` action.
- Updated license conflict wording to use `node` because a license can be active on a vault node or a single machine.

## 4.0.26 (2026-07-07)
- Breaking change: PDM variable evaluation now uses `$()` expressions such as `$(Revision)`, `$(Revision.@)`, and `$(PartNo.Default)`. Bracketed text is treated as literal text, so folder names like `[debugging]` are no longer interpreted as variables.
- Updated alias, [`setvar`](SETVAR.md), [`runscript`](RUNSCRIPT.md), generated script preview, and condition evaluation documentation to use the new PDM variable expression syntax.
- When the configuration is omitted, PDMShell uses `@` for `.sldprt` and `.sldasm` files, and an empty configuration for drawings, other file types, and folders.

## 4.0.25 (2026-07-06)
- Fixed placeholder evaluation when an alias is followed by an underscore or other non-alphanumeric separator, so file-context expressions such as `$fileNameWithoutExtension_R_%.pdf` resolve correctly in [`runscript`](RUNSCRIPT.md), command alias evaluation, and generated script previews.

## 4.0.24 (2026-07-06)
- Updated [`move`](MOVE.md) so `-search` is always scoped to the current PDMShell directory and moves matching files to `-directory`; `-source` is used only when moving a specific file or folder.

## 4.0.23 (2026-07-05)
- Fixed placeholder evaluation when an alias is followed by a file extension separator, so commands such as [`dump`](DUMP.md) can now resolve paths like `c:\Temp\membrane-$guid.txt`.

## 4.0.22 (2026-07-04)
- Improved [placeholder evaluation](EVAL.md) so the Expression Evaluator, generated script preview, command alias evaluation, and conditions resolve the same common file, folder, vault, user, date, and environment placeholders.

## 4.0.21 (2026-07-04)
- Added [`transition`](TRANSITION.md) `mode` for direct file and search transitions so administrators can choose `simple` or `references`.
- Updated the [`rebuild`](REBUILD.md) documentation to clarify that the command is reserved and not implemented yet.
- Split add-in licensing guidance into a dedicated [Licensing](licensing.md) section with [License Pool](license-pool.md) and [Machine License](machine-license.md) articles.

## 4.0.19 (2026-07-04)
- Added [PDMShell add-in license management](addin/license-manager.md) from `Manage PDMShell Licenses` in the SOLIDWORKS PDM Administration Tool.
- Added guidance for [License Pool](license-pool.md) and [Machine License](machine-license.md) so administrators can choose how the add-in consumes PDMShell licenses.

## 4.0.18 (2026-07-06)
- Added revision-aware [placeholder evaluation](EVAL.md) functions including `${revision()}`, `${nextRevision()}`, `${revisionComponentValue(...)}`, `${nextRevisionComponentValue(...)}`, revision component counters, revision scheme checks, and revision value validation.
- Added optional file path support to revision evaluation functions so scripts can inspect the revision of another PDM file, such as a related PDF derived from the current file name.
- Updated script evaluation so revision functions without an explicit file path are treated as file-sensitive and evaluate per selected file during script execution.
- Improved revision function formatting so next revision values use the active PDM revision component format, including padded numeric formats and alpha formats.
- Updated the [Expression Evaluator](expression-evaluator.md) documentation with revision function examples and file-context guidance.
- Added [`until`](UNTIL.md) `onTimeout` behavior so scripts stop by default after a timeout while still allowing final cleanup commands, or continue when `onTimeout continue` is used.
- Moved the [Visual Code Editor](visual-code-editor-4.md) generated script toggle beside the zoom controls so script preview is available where users manage the visual view.
- Improved the Visual Code Editor generated script drawer by replacing the old tabs with a cleaner generated script header and a `Checks` status action.
- Improved Visual Code Editor checks so the validation list is only shown when issues exist.
- Updated the generated script preview to use a code font while keeping the command picker and visual command boxes in the normal interface font.

## 4.0.17 (2026-06-30)
- 🎉 Added support for [IF statements and conditions](if-statements.md) in the Visual Code Editor, including `Conditions Met` and `Else` branches during script execution.

## 4.0.16 (2026-06-30)
- Improved [`runtemplate`](RUNTEMPLATE.md) `-silent` confirmation so template dialogs can be confirmed with `Create` or `OK` buttons.

## 4.0.15 (2026-06-29)
- Added the [Offline Activation](offline-activation.md) workflow in PDMShell settings for air-gapped or restricted computers.
- Improved the Settings window with a separate `Offline Activation` section under license management.
- Improved the Settings window license layout and made the license actions easier to scan and use.
- Improved the bottom action buttons in the update and settings dialogs for clearer alignment, sizing, and visual consistency.

## 4.0.14 (2026-06-27)
- Added [Visual Code Editor](visual-code-editor-4.md) UI support for IF statement nodes and branch layout. Runtime execution for IF statement branches is not enabled yet.
- Added [result shaping](search-result-shaping.md) to advanced search queries with `SortBy`, `SortOrder`, `GroupBy`, `DuplicatedBy`, and `Strategy` so commands that use `-search` can sort, group, and keep or exclude selected results.
- Improved [advanced search](advancedsearch.md) documentation by splitting [search tokens](search-tokens.md), [variable search](search-variables.md), [result shaping](search-result-shaping.md), and [search favorites](search-favorites.md) into focused articles.
- Improved multi-session tab behavior so each session keeps its own vault connection, autocomplete metadata, visual editor metadata, and Connect to Vault action.
- Fixed tab switching issues that could replay output text or duplicate the welcome message.
- Improved visual editor autocomplete loading for large vaults by showing busy status and staged progress while vault metadata is loaded.
- Improved the update available dialog with dark release note styling, larger centered action buttons, an administrator privilege tooltip, elevated updater launch, and a Windows 11-style shield icon when running on Windows 11.
- Fixed PDMShell Updater stability when the installer is canceled and when the updater is launched from PDMShell before uninstalling the existing version.
- Updated [`msgbox`](MSGBOX.md) so `value` and `title` support session-level placeholder evaluation such as `$vaultName`, `$date`, `$time`, `$guid`, and `$tempFolder`.

## 4.0.11 (2026-06-21)
- Added documentation for the [Expression Evaluator](expression-evaluator.md), including how to safely preview placeholder expressions against a selected PDM file or folder, use `$value`, choose configurations, and test string functions before running commands or scripts.
- Added an on-demand [PDMShell add-in](TASKSCRIPT.md) script demo to the [Command menu scripts](addin/command-menu.md) documentation, showing how users can launch a rename script from SOLIDWORKS PDM without creating a PDM Task.
- Updated the visual editor metadata for [`msgbox`](MSGBOX.md) so the `icon` parameter appears as a single-select combo box with the supported message box icons.

## 4.0.10 (2026-06-18)
- Added logged-in PDM user profile placeholders: `$username.firstName`, `$username.lastName`, `$username.FullName`, and `$username.email`.
- Added a dark themed [Expression Evaluator](expression-evaluator.md) for testing placeholder expressions against a selected PDM file or folder before running a command.

## 4.0.9 (2026-06-18)
- Added the [`pasteasshared`](PASTEASSHARED.md) command to share one file or search results into another vault folder.

## 4.0.8 (2026-06-18)
- Added `${regex(value, pattern)}` and `${regex(value, pattern, group)}` [placeholder](EVAL.md) string functions.
- Added the [Rename Before Dash](scripts/RENAMEBEFOREDASH/RENAMEBEFOREDASH.md) script template to the PDMShell Script Library.
- Fixed Script Library downloads so templates without a SOLIDWORKS macro no longer create or report an empty `Macro.swb` file.
- Updated the AI Assistant toolbar button to open the hosted PDMShell Assistant website.

## 4.0.7 (2026-07-17)
- Added the [PDMShell add-in](TASKSCRIPT.md) for SOLIDWORKS PDM (downloadable for Premium users).
- Added the [Script Editor](addin/script-editor.md) for configuring PDMShell scripts from inside PDM.
- Added [script permissions](addin/permissions.md) for permitted users and groups.
- Added [script conditions](addin/conditions.md) that control whether a script should run for the selected file, folder, or command context.
- Added [right-click command menu](addin/command-menu.md) support so configured scripts can appear as PDM menu commands.
- Added [PDM event trigger points](addin/trigger-points.md) so scripts can run on supported PDM command hooks.
- Added [condition](addin/conditions.md) test messages to help administrators validate scripts before production use.
- Added `pdmcli.exe -edit "script.pdmshell"` support to open a script in the visual editor without executing it.
- Added headless mode support for [add-in automation](addin/runtime-execution.md). Use `pdmcli.exe -headless` or enable Headless in PDMShell settings to start a lighter execution shell for automation runs.
- Protected unsaved visual editor work by hydrating the editor from [`runscript`](RUNSCRIPT.md) only when the current editor is empty or clean.
- Added a default check-in comment value of `Checked by PDMShell` in the visual command builder.
- Changed [`wait`](WAIT.md) to a fixed-duration pause and moved condition polling to the new [until](UNTIL.md) command.
- Added [session global variables](GLOBALVARIABLES.md) with `setglobal`, `getglobal`, `clearglobal`, and `${global.Name}` evaluation.
- Updated the [installer](howtoinstall.md) package for this release.

## 4.0.6 (2026-06-12)
- Enhanced [script execution](scripting.md) for command-line and automation scenarios.
- Added `runscript -items` for integrations that pass file and folder ID pairs.
- Updated [`runscript`](RUNSCRIPT.md) so `items`, `filePath`, and [`search`](SEARCH.md) use the same placeholder and PDM variable evaluation path as visual Run command execution.
- Added command-line `.pdmshell` detection so `pdmcli.exe "script.pdmshell"` runs the script and forwards supported parameters such as `-items`.
- Added the Error Mode setting to [script execution](scripting.md). `Default` mode reports missing-file delete operations as warnings, while `Aggressive` mode keeps the previous hard-error behavior.

## 4.0.5 (2026-06-10)
- Enhanced script processing logic.

## 4.0.4 (2026-06-10)
- Added and documented the [wait](WAIT.md) command.
- Added [condition expression](conditions.md) support for file/folder/process existence, variable and placeholder comparisons, grouped `and` / `or` logic, and arithmetic comparisons.
- Simplified the [Visual Code Editor](visual-code-editor-4.md) wait conditions dialog to use a variable/placeholder field, operator dropdown, and conditional value field.
- Expanded wait-condition placeholder autocomplete and runtime placeholder evaluation.
- Fixed [Visual Code Editor](visual-code-editor-4.md) command node icon rendering.
- Fixed visual script loading for root directory `cd -directory "\"` usage.
- Improved [`setvar`](SETVAR.md) evaluation so `$value` falls back to an empty string when null or empty, and literal `\n` writes a real newline.
- Updated [`pasteasreference`](PASTEASREFERENCE.md) behavior so `source` is the source file, [`search`](SEARCH.md) finds files to paste references to, and `filePath` is the reference to append.

## 4.0.3 (2026-06-04)
- Rebuild release.
- Fixed automatic login behavior when selecting or using vault view names.

## 4.0.1 (2026-06-03)
- Bumped PDMShell project versions to `4.0.1`.
- Updated [`help`](HELP.md) output to organize commands by category.
- Improved [`help`](HELP.md) responsiveness by reducing repeated UI updates and command metadata lookups.
- Standardized command descriptions in PDMShell and aligned command documentation wording.
- Added and documented the [whereusedtree](WHEREUSEDTREE.md) command for recursive where-used trees.
- Improved [Visual Code Editor](visual-code-editor-4.md) script saving, loading, visual workflow restoration, and unsaved-change handling.
- Added [Visual Code Editor](visual-code-editor-4.md) navigation controls such as zoom in, zoom out, and zoom to fit.
- Added the [Check In All Files](scripts/CHECKINALLFILES/CHECKINALLFILES.md) script to the script library.

## 4.0.0 (2026-06-01)
- Added [Visual Code Editor](visual-code-editor-4.md) for building PDMShell scripts as visual workflows.
- Added `Favorite=SEARCH FAVORITE` token to [advanced search](advancedsearch.md).
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
- Enhanced [`runscript`](RUNSCRIPT.md) and fixed minor bugs in the [PDMShell add-in](TASKSCRIPT.md). 
- Added a new [PDMShell add-in](TASKSCRIPT.md) demo
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
- Added the [PDMShell add-in](TASKSCRIPT.md) to run scripts from PDM. 

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
- Added `DuplicatedBy` token to [advanced search](advancedsearch.md) and `DuplicateStrategy` parameter to the [`search`](SEARCH.md) command.
- Added [Move](MOVE.md) and [MoveFromSource](MOVEFROMSOURCE.md) commands.
## 3.0.27 (2026-02-09)
- Added [Pack And Go](PACKANDGO.md)
- Updated [Where Used](WHEREUSED.md)  

## 3.0.26 (2026-01-05)
- Happy New Year 2026!
- [get command](GET.md): `Directory` parameter is now optional. If not specified, the file is cached in its folder. If specified with an empty value, the file is cached at the root of the vault.
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
- Added note for `solidworks` and `pdm`parameters in the [Version](VERSION.md) command: RESERVED FOR FUTURE. NOT IMPLEMENTED   

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
 - Fixed a legacy bracketed-variable evaluation bug in `name` and `value` parameters.

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
 - [BOM: Added a new command](BOM.md). Please see notes [here](howtoinstall.md#common-update-issues) about new commands in the Common Update Issues section.
 - [Added `$configuration` placeholder](EVAL.md)
 - Added release notes page
 - Fixed some minor typos for the delete and destroy commands
 - Change toolbar icons and tooltips for better UX
 
