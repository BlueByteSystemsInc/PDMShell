---
description: Release Notes of PDMShell
title: Release Notes of PDMShell | PDMShell | SOLIDWORKS PDM
---

>[!Important]
> To update PDMShell properly, **download** the latest version, **uninstall** PDMShell and then **install** the latest version. **Do not update installed version.**

# 3.0.24 (2025-12-23)
- No added commands or bug fixes.  
- Updated parameters tooltip in `addtovault`, `rename`, `cd` and others.

# 3.0.24 (2025-12-22)
- parameter tooltips (little box that shows up next to the parameter when you type in the command box) are now uniaue for each command. Over the next releases, we will update all tooltips for all parameters to make them more clear. The same parameter can be used in multiple commands having different function in each.

# 3.0.23 (2025-12-20)
- Added [update references command](UPDATEREFERENCES.md)

# 3.0.22 (2025-12-19)
- Added [copy command](COPY.md)

# 3.0.21 (2025-12-18)
- Fixed single instance bug. All commands are now executed sequentially. Output is not during commands execution anymore. This was in 3.0.19 and 20
- Added `getoptions` in [Get](GET.md)
- Added `checkoutoptions` in [Checkout](CHECKOUT.md)

# 3.0.20 (2025-12-12)
- Fixed timeout issue with [Export](EXPORT.md) and [RunSwMacro](RUNSWMACRO.md).
- Added `name`, `filePath` and `value` parameters to [INBOX](INBOX.md). 
- `source` parameter default to current directory in [addtovaultcommmand](ADDTOVAULT.md). 

# 3.0.19 (2025-12-11)
- Added `winlog` parameter for pdmcli.exe. See remarks section of [dump command](DUMP.md).
- Fixed single instance bug. All commands are now executed sequentially. Output is blocked during commands execution.

# 3.0.18 (2025-12-08)
- Rebuild. Previous faulty build.

# 3.0.17 (2025-12-08)
- Fixed single instance issue related to Windows enviornment variables
- Added note for `solidworks` and `pdm`parameters in the [Version](VERSION.md) command: **RESERVED FOR FUTURE. NOT IMPLEMENTED**   

# 3.0.16 (2025-12-07)
- [Export: Added timeout parameter launching SOLIDWORKS](EXPORT.md).
- [RunSwMacro: timeout parameter is also enabled for launching SOLIDWORKS](RUNSWMACRO.md).
- Enforced `.pdmshell` extension across all commands as the scripting file extension.
# 3.0.15
- skipped

# 3.0.14 (2025-12-05)
- [Login: Fix bug with parameter casing](LOGIN.md).
- [Login: Added implementation with the transition command](TRANSITION.md).
- Updated documentation

# 3.0.13 (2025-12-04)
- [VERSIONUPGRADE: Added a new command](VERSIONUPGRADE.md).
- [VERSIONUPGRADEFROMSOURCE: Added a new command (Reserved but not implemented)](VERSIONUPGRADEFROMSOURCE.md).

# 3.0.12 (2025-12-03)
- [SetRevisionFromSource: Added a new command](SETREVISIONFROMSOURCE.md).

# 3.0.11 (2025-12-02)
- [SetRevision: Added a new command](SETREVISION.md).
 - Fixed evaluation bug: Bracketed variable `[Variable]` fail to evaluate in `name` and `value` parameters

# 3.0.10 (2025-12-01)
- Rebuild

# 3.0.9 (2025-12-01)
 - [INFOVAR: Fixed bug with related to single flag variables](INFOVAR.md) 
 - [SETVAR: Added support for handling folder cards](SETVAR.md) 

# 3.0.8 (2025-11-30)
 - Fixed unhandled exception when license is limited that causes a crash in all commands
 - Fixed evaluation bug (order)
 - Fixed some minor bugs in BOM command

# 3.0.7 (2025-11-29)
 - [BOM: Added a new command](BOM.md). Please see notes [here](howtoinstall.md#common-update-issues) about new commands in the **Common Update Issues** section.
 - [Added `$configuration` placeholder](EVAL.md)
 - Added release notes page
 - Fixed some minor typos for the delete and destroy commands
 - Change toolbar icons and tooltips for better UX
 