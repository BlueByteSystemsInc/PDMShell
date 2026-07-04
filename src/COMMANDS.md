---
description: Browse PDMShell commands by category, with links and availability information.
title: Command Reference | PDMShell | SOLIDWORKS PDM
---
# Command Reference

Use this page to browse PDMShell commands by category. Availability is listed at the bottom of each command page and summarized here for quick scanning.

Availability means the PDMShell version where the command first became available. Last updated means the most recent PDMShell version where the command behavior, parameters, or important command documentation changed.

## Recently Updated Commands

| Command | Last Updated | What Changed |
| --- | --- | --- |
| [search](SEARCH.md) | PDMShell 4.0.14 | Added result shaping with `SortBy`, `SortOrder`, `GroupBy`, `DuplicatedBy`, and `Strategy` for commands that use `-search`. |
| [msgbox](MSGBOX.md) | PDMShell 4.0.14 | Added session-level placeholder evaluation for `value` and `title`, including `$vaultName`, `$date`, `$time`, `$guid`, and `$tempFolder`. |

## Vault

| Command | Description | Availability |
| --- | --- | --- |
| [login](LOGIN.md) | Log in to PDM | Available since PDMShell 2.0.0. |
| [cd](CD.md) | Change directory | Available since PDMShell 2.0.0. |
| [dir](DIR.md) | List directory contents | Available since PDMShell 2.0.0. |
| [mkdir](MKDIR.md) | Create a new PDM directory | Available since PDMShell 2.0.0. |
| [clearcache](CLEARCACHE.md) | Clear cache | Available since PDMShell 2.0.0. |
| [history](HISTORY.md) | View complete file history | Available since PDMShell 2.0.0. |
| [inbox](INBOX.md) | Open PDM Inbox | Available since PDMShell 2.0.0. |
| [addtovault](ADDTOVAULT.md) | Add files to vault | Available since PDMShell 2.0.0. |
| [users](USERS.md) | List users | Available since PDMShell 2.0.0. |

## File Operations

| Command | Description | Availability |
| --- | --- | --- |
| [get](GET.md) | Get latest or selected version | Available since PDMShell 2.0.0. |
| [checkout](CHECKOUT.md) | Check out | Available since PDMShell 2.0.0. |
| [checkin](CHECKIN.md) | Check in | Available since PDMShell 2.0.0. |
| [undocheckout](UNDOCHECKOUT.md) | Undo checkout | Available since PDMShell 2.0.0. |
| [copy](COPY.md) | Copy files | Available since PDMShell 2.0.74. |
| [copytree](COPYTREE.md) | Copy tree | Available since PDMShell 2.0.46. |
| [pasteasreference](PASTEASREFERENCE.md) | Paste as custom reference | Available since PDMShell 4.0.0. |
| [pasteasshared](PASTEASSHARED.md) | Paste as shared file | Available since PDMShell 4.0.9. |
| [packandgo](PACKANDGO.md) | Pack and Go | Available since PDMShell 3.0.27. |
| [move](MOVE.md) | Move files | Available since PDMShell 3.0.28. |
| [rename](RENAME.md) | Rename files | Available since PDMShell 2.0.0. |
| [delete](DELETE.md) | Delete files or folders | Available since PDMShell 2.0.0. |
| [destory](DESTORY.md) | Destroy deleted files | Available since PDMShell 2.0.5. |
| [recover](RECOVER.md) | Recover deleted files | Available since PDMShell 2.0.74. |
| [listreferences](LISTREFERENCES.md) | List references | Available since PDMShell 3.0.70. |
| [updatereferences](UPDATEREFERENCES.md) | Update references | Available since PDMShell 3.0.23. |
| [transition](TRANSITION.md) | Change workflow state | Available since PDMShell 2.0.0. |

## Variables

| Command | Description | Availability |
| --- | --- | --- |
| [getvar](GETVAR.md) | Get variable value | Available since PDMShell 2.0.0. |
| [getvarfromdb](GETVARFROMDB.md) | Get variable value from database | Available since PDMShell 2.0.0. |
| [setvar](SETVAR.md) | Set variable value | Available since PDMShell 2.0.0. |
| [globalvariables](GLOBALVARIABLES.md) | Global variables | Available since PDMShell 4.0.7. |
| [infovar](INFOVAR.md) | Get variable information | Available since PDMShell 2.0.0. |
| [mkvar](MKVAR.md) | Create a new PDM variable | Available since PDMShell 2.0.0. |
| [editvars](EDITVARS.md) | Launch Variable Editor | Available since PDMShell 2.0.0. |

## Source / CSV

| Command | Description | Availability |
| --- | --- | --- |
| [deletefromsource](DELETEFROMSOURCE.md) | Delete files from CSV | Available since PDMShell 2.0.2. |
| [movefromsource](MOVEFROMSOURCE.md) | Move files from CSV | Available since PDMShell 3.0.28. |
| [printfromsource](PRINTFROMSOURCE.md) | Print information from CSV | Available since PDMShell 2.0.0. |
| [renamefromsource](RENAMEFROMSOURCE.md) | Rename files from CSV | Available since PDMShell 2.0.2. |
| [searchfromsource](SEARCHFROMSOURCE.md) | Search from CSV | Available since PDMShell 2.0.0. |
| [setrevisionfromsource](SETREVISIONFROMSOURCE.md) | Set revision from CSV | Available since PDMShell 3.0.12. |
| [setvarsfromsource](SETVARSFROMSOURCE.md) | Set variables from CSV | Available since PDMShell 2.0.1. |
| [versionupgradefromsource](VERSIONUPGRADEFROMSOURCE.md) | Upgrade version from CSV | Available since PDMShell 3.0.13. |
| [createvirtualfromsource](CREATEVIRTUALFROMSOURCE.md) | Create virtual documents from CSV | Available since PDMShell 2.0.34. |

## Automation

| Command | Description | Availability |
| --- | --- | --- |
| [runscript](RUNSCRIPT.md) | Run a PDMShell script | Available since PDMShell 2.0.1. |
| [runswmacro](runswmacro.md) | Run a SOLIDWORKS macro | Available since PDMShell 2.0.83. |
| [runtask](RUNTASK.md) | Run a PDM task | Available since PDMShell 2.0.33. |
| [runtemplate](RUNTEMPLATE.md) | Run a PDM template | Available since PDMShell 4.0.0. |
| [wait](WAIT.md) | Wait for seconds | Available since PDMShell 4.0.4. |
| [until](UNTIL.md) | Wait until conditions | Available since PDMShell 4.0.7. |
| [rebuild](REBUILD.md) | Ghost rebuild SOLIDWORKS files | Available since PDMShell 2.0.0. |
| [toolbox](TOOLBOX.md) | Process Toolbox flag | Available since PDMShell 2.0.17. |
| [addaddin](ADDADDIN.md) | Add add-in | Available since PDMShell 2.0.0. |
| [kill](KILL.md) | Stop process | Available since PDMShell 2.0.0. |

## Revision / Version

| Command | Description | Availability |
| --- | --- | --- |
| [version](VERSION.md) | Show version information | Available since PDMShell 2.0.0. |
| [setrevision](SETREVISION.md) | Set revision | Available since PDMShell 3.0.11. |
| [versionupgrade](VERSIONUPGRADE.md) | Upgrade version after PDM upgrade | Available since PDMShell 3.0.13. |
| [frogleap](FROGLEAP.md) | Frog leap file version | Available since PDMShell 2.0.0. |

## Document Manager

| Command | Description | Availability |
| --- | --- | --- |
| [docman](DOCMAN.md) | Document Manager operations | Available since PDMShell 2.0.16. |
| [docmanprops](DOCMANPROPS.md) | Read CAD properties | Available since PDMShell 3.0.30. |

## Utilities

| Command | Description | Availability |
| --- | --- | --- |
| [help](HELP.md) | List all commands | Available since PDMShell 2.0.0. |
| [cls](CLS.md) | Clear screen | Available since PDMShell 2.0.0. |
| [dump](DUMP.md) | Save session output to a file | Available since PDMShell 2.0.0. |
| [export](EXPORT.md) | Export files | Available since PDMShell 2.0.0. |
| [bom](BOM.md) | Export bill of materials | Available since PDMShell 2.0.0. |
| [preview](PREVIEW.md) | Preview files | Available since PDMShell 2.0.0. |
| [print](PRINT.md) | Print file information | Available since PDMShell 2.0.0. |
| [search](SEARCH.md) | Search for files | Available since PDMShell 2.0.5. |
| [msgbox](MSGBOX.md) | Show message box | Available since PDMShell 4.0.8. |
| [start](START.md) | Start a process | Available since PDMShell 2.0.0. |
| [quit](QUIT.md) | Quit PDMShell | Available since PDMShell 2.0.0. |
| [reboot](REBOOT.md) | Restart PDMShell | Available since PDMShell 2.0.1. |
| [whereused](WHEREUSED.md) | Find parents | Available since PDMShell 2.0.0. |
| [whereusedtree](WHEREUSEDTREE.md) | Find recursive parents | Available since PDMShell 4.0.1. |
