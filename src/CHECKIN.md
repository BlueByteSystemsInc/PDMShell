# CHECKIN Command Documentation

## DESCRIPTION:
Check-in the specified file or files using a search operation.

## SYNTAX:
checkin [-s search] [-b batch] [-f filePath] [-cmt comment] [-ciopt Checkinoptions]

## PARAMETERS:
-s search - The search operation to use.

-b batch - Forces PDM to use the BatchUtility in PDM to process a large number of files.

-f filePath - The file(s) to be checked in. This is the default parameter.

-cmt comment - The comment to add to the check-in.

-ciopt Checkinoptions - The check-in options to use.

## EXAMPLES:
checkin -f "file1.sldprt"

## REMARKS:
- The search parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.
- If combining `Checkinoptions` parameters, the user needs to add `+` between the values.

### Checkinoptions Parameter Values:

| Member                                    | Description                                                                                                      |
|-------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| EdmUnlock_FailOnRegenerationNeed          | Fail if the file needs to be regenerated in the CAD program. NOTE: Only files resaved in SOLIDWORKS 2009 or later can trigger this flag |
| EdmUnlock_ForceUnlock                     | Unlock the file even if it is not modified                                                                       |
| EdmUnlock_IgnoreCorruptFile               | Ignore files with file formats unrecognized by SOLIDWORKS PDM Professional; without this flag, SOLIDWORKS PDM Professional returns E_EDM_INVALID_FILE if it encounters a corrupt file or a file containing a newer format than SOLIDWORKS PDM Professional can handle |
| EdmUnlock_IgnoreReferences                | Silently unlock parent files without their references                                                            |
| EdmUnlock_IgnoreRefsNotLockedByCaller     | Ignore references not locked by caller                                                                           |
| EdmUnlock_IgnoreRefsOutsideVault          | Ignore references to files outside the vault                                                                     |
| EdmUnlock_KeepLocked                      | Keep the file checked out after creating the new version in the archive                                          |
| EdmUnlock_OverwriteLatestVersion          | Do not create a new version; overwrite the last version of the file with new changes                             |
| EdmUnlock_RemoveLocalCopy                 | Remove the local copy of the file from the hard disk after the file has been checked in                          |
| EdmUnlock_Simple                          | Check in the file using default behavior                                                                         |