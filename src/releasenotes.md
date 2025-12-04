---
description: Release Notes of PDMShell
title: Release Notes of PDMShell | PDMShell | SOLIDWORKS PDM
---

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
 