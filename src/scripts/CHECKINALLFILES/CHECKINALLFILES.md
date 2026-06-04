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

This script does not log in automatically. Make sure PDMShell is already logged in to the correct vault before running it. The script ends with `quit -silent`, so it is intended for unattended use after the session is already authenticated.

This script does not use a SOLIDWORKS macro.

## Script

```pdmshell
checkin -search "Name=%;Recursive=true" -checkinoptions IgnoreReferencesNotLockedByCaller+IgnoreRefsOutsideVault+IgnoreCorruptFile

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
checkin -search "Name=%.sldprt;Recursive=true" -checkinoptions IgnoreReferencesNotLockedByCaller+IgnoreRefsOutsideVault+IgnoreCorruptFile
```

To keep PDMShell open after the script runs, remove:

```pdmshell
quit -silent
```

To create a log file, add a `dump` command before `checkin`, for example:

```pdmshell
dump -filePath "checkin-log.txt"
```

## Notes

This script is intentionally broad because `Name=%;Recursive=true` matches all files under the current directory. Review the current directory before running it.
