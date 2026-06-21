---
name: Check In All Files
id: CHECKINALLFILES
description: Checks in all files found recursively from the current PDMShell directory.
requiresSolidWorks: false
scriptFile: CHECKINALLFILES.pdmshell
tags:
  - Checkin
  - Batch
  - Search
  - Script
---

# Check In All Files

This script checks in all files found recursively from the current PDMShell directory, then exits PDMShell silently.

>[!TIP]
> You can download this script directly from the PDMShell Script Library. Open PDMShell, open the Script Library, choose **Check In All Files**, and load the script into the active session.

This script does not log in automatically. Make sure PDMShell is already logged in to the correct vault before running it. The script ends with `quit -silent`, so it is intended for unattended use after the session is already authenticated.

This script does not use a SOLIDWORKS macro.

## Script

```pdmshell
Checkin -search "Name=%;Locked=true;Recursive=true" -comment "checked in by script" -Checkinoptions "EdmUnlock_IgnoreCorruptFile+EdmUnlock_IgnoreRefsOutsideVault+EdmUnlock_IgnoreRefsNotLockedByCaller"

quit -silent
```

## What it does

- Searches recursively from the current PDMShell directory.
- Checks in every matching file.
- Ignores references that are not locked by the current user.
- Ignores references outside the vault.
- Ignores corrupt or unsupported referenced files.
- Exits PDMShell silently when complete.

## Requirements

- PDMShell must already be logged in to the correct vault.
- The current PDMShell directory should be the folder where the recursive check-in should start.
- The user must have permission to check in the target files.
- Files must be checked out in a state that PDMShell can check in.

## Save And Run

Save the script with the `.pdmshell` extension, for example:

```text
C:\PDMShellScripts\checkinallfiles.pdmshell
```

You can run it from PDMShell with:

```pdmshell
runscript -source "C:\PDMShellScripts\checkinallfiles.pdmshell"
```

You can also run it from Windows Task Scheduler by creating a task that launches `pdmcli.exe` and passes the script command.

Example program:

```text
C:\Program Files\Blue Byte Systems Inc\PDMShell\pdmcli.exe
```

Example arguments:

```text
/single "runscript -source \"C:\PDMShellScripts\checkinallfiles.pdmshell\""
```

Run the scheduled task with a Windows account that has access to the vault view and is already authenticated in SOLIDWORKS PDM.

## Customization

To narrow the files being checked in, change the search query:

```pdmshell
Checkin -search "Name=%.sldprt;Locked=true;Recursive=true" -comment "checked in by script" -Checkinoptions "EdmUnlock_IgnoreCorruptFile+EdmUnlock_IgnoreRefsOutsideVault+EdmUnlock_IgnoreRefsNotLockedByCaller"
```

To keep PDMShell open after the script runs, remove:

```pdmshell
quit -silent
```

To create a log file, add a [`dump`](../../DUMP.md) command before [`checkin`](../../CHECKIN.md), for example:

```pdmshell
dump -filePath "checkin-log.txt"
```

## Notes

This script is intentionally broad because `Name=%;Locked=true;Recursive=true` matches all locked files under the current directory. Review the current directory before running it.
