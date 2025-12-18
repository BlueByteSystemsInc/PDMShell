---
description: Performs a check out operation on a specified file or many files.
title: CHECKOUT Command Documentation | PDMShell | SOLIDWORKS PDM
---
# CHECKOUT Command Documentation

## DESCRIPTION:
Performs a check out operation on a specified file or many files.

## SYNTAX:
```bash
checkout -search -recursive -filePath
```
## PARAMETERS:
-`search`: Search keyword

-`filePath`: The file(s) to be checked out. This is the default parameter

-`recursive`: Recursively check out all files in the current directory. Use in combination with search

-`checkoutoptions`: Optional. Use this to check a file and its references at once:

| Option Name (CLI)              | Description |
|--------------------------------|-------------|
| Nothing                        | No checkout options are applied. |
| AsBuilt1                       | Uses the same versions of referenced files that were used when the referencing file was checked in; otherwise, the latest versions are used. |
| SkipUnlockedWritable           | Does not retrieve files that are writable and not checked out. |
| SkipExisting                   | Does not retrieve files that already exist in the local cache. |
| ForPreview                     | Retrieves only referenced files required for preview; skips caching referenced files. |
| RefreshFileListing             | Refreshes the File Explorer listing after files have been checked out. |
| LockReferencedFilesToo         | Checks out (locks) files referenced by the checked-out file. |
| AsBuiltNotDefault              | Uses the as-built versions when creating the reference tree. |
| SkipOpenFileChecks             | Skips checking whether files are open in another application. |
| SkipLockRefFiles               | Skips checking of lock file references. |
| LockNoLclCopyFiles             | Locks referenced files even if no local cache copy exists. |
| IncludeAutoCacheFiles          | Automatically caches referenced files if the latest version is not already in the local cache. |
| RollbackTree                   | Provides the ability to roll back files in the checkout dialog. |
| ForViewer                      | Retrieves only referenced files required by the viewer; skips caching referenced files. |
| SingleFileRollback             | Rolls back a single file. |
| XrefsOpenCheck                 | Checks whether cross-reference files are open in another application. |


You combine values by using `+`. Please make sure to wrap the parameter value in "". Example: `"SkipExisting + LockReferencedFilesToo"`


## EXAMPLES:
```bash
checkout -filePath file1.sldprt
```
## REMARKS:
- The search parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.

## TUTORIAL:
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/checkout.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>