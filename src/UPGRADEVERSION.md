---
description: Checks and upgrades SOLIDWORKS PDM file versions, performs reference validation, and optionally exports broken references to CSV.
title: VERSIONUPGRADE Command Documentation | PDMShell | SOLIDWORKS PDM
---
# VERSIONUPGRADE Command Documentation

## DESCRIPTION:

The `VersionUpgradeCommand` provides tools for **bumping PDM revisions**, **validating file references**, and **exporting broken reference results to a CSV file**.

This command uses PDM’s internal engine to:

- Increment revision numbers in bulk  
- Detect incorrect, missing, or version-mismatched references  
- Output the reference check results to a CSV file that can be added or updated inside the PDM vault  

The CSV export uses the fields of the `EdmCheckRef` structure:

- `mlParentFileID`  
- `mlRefFileID`  
- `mbsParentPath`  
- `mbsRefPath`  
- `mlRefVersion`  
- `mlRefLatestVersion`  
- `mlRefFolderID`  

Each result row represents a reference that is out of date, missing, or mismatched according to PDM rules.

---

## SYNTAX:
```bash
versionupgrade -search <query> [-recursive] [-bumprevision] [-referencescheck] [-csv <fileName>]
```
---

## PARAMETERS:

- `search`  
Search query used to locate files for the version upgrade operation.  
If omitted, no files will be processed.

>[!NOTE]
> Consult [advanced search](advancedsearch.md) to learn how to create advanced search queries.


- `recursive`   
  Searches through all subfolders from the current folder. Not required if using `Recursive=true` in `search`.

- `bumprevision`  
  Increments the PDM revision of each file returned from the search.  
  Requires the logged-in user to have the permission:  
  **Modify revision numbers (EdmSysRight_ModifyRevisionNumbers)**.

- `referencescheck`  
  Runs PDM’s **Reference Check**.
  This detects:

  - Missing references  
  - Wrong versions  
  - Outdated references  
  - Broken or invalid reference paths  

   Any issues found are stored in an internal list and may be exported via the `csv` parameter.

- `csv`  
  Exports reference-check issues to a CSV file.  
  If the file exists in the vault, it is **updated**.  
  If the file does not exist, it is **added** to the vault.

The CSV contains:

```bash
ParentFileID,RefFileID,ParentPath,RefPath,RefVersion,RefLatestVersion,RefFolderID
```
### Behavior notes for CSV:
- Fully-qualified paths inside the vault are handled correctly.  
- CSV escaping is applied (quotes, commas, newlines).  
- UTF-8 encoding without BOM is used for compatibility.  
- If the CSV file is checked out, a warning is returned.

---

## WORKFLOW OVERVIEW

### 1. Search for files  
The command executes a PDM search using the supplied query and optional recursion.

### 2. Perform requested operations  
Depending on parameters:

- `-bumprevision` → increments the PDM revision counters  
- `-referencescheck` → checks all references for correctness  

### 3. CSV Export (optional)  
If both `search` and `referencescheck` are supplied, and `csv` is specified:

- Writes reference errors to a CSV  
- Adds or updates the file in the vault  
- Displays success, warnings, and error messages

---

## NOTES:

- `bumprevision` and `referencescheck` operate *only* on files returned by the search.
- CSV exporting is only active when **both**  
  `search` **and** `referencescheck` are supplied.
- The reference check output may include many entries depending on assembly depth.
- This command does **not** modify file content — it only updates revision metadata or reference validation results.
- Bulk operations respect PDM permissions and may fail if the user lacks rights.

---

## AVAILABILITY  
-  **3.0.13**