---
description: The DELETEFROMSOURCE command is used to delete files from a CSV file and optionally export the results.
title: DELETEFROMSOURCE Command Documentation | PDMShell | SOLIDWORKS PDM
---

# DELETEFROMSOURCE Command Documentation

## DESCRIPTION:

The `deletefromsource` command deletes files listed in a CSV file. It can also optionally destroy the files and export the operation results to a CSV file for auditing and reporting purposes.

## SYNTAX:
```bash
    deletefromsource -filePath -destroy -csv -batch
```

## PARAMETERS:

| Parameter | Type | Required | Description |
|---|---|---|---|
| `filePath` | string | Yes | Path to the source CSV file containing File IDs and Folder IDs. |
| `destroy` | flag | No | If specified, files will be permanently destroyed after deletion. |
| `csv` | string | No | Path to export the results CSV file. |
| `batch` | int | No | Destory batch size for large folders. |
## SOURCE CSV FORMAT:

The source CSV file must contain a header row with the following columns:

```bash
FileID,FolderID
12345,678
12346,678
```

| Column | Description |
|---|---|
| FileID | The document ID of the file |
| FolderID | The folder ID containing the file |

## RESULTS CSV FORMAT:

If `-csv` is specified, PDMShell will generate a results file containing:

```bash
FileID,FolderID,Deleted,Destroyed,DeleteError,DestroyError
12345,678,True,True,,
12346,678,False,False,File is checked out,
```

## RESULTS CSV COLUMNS:

| Column | Description |
|---|---|
| FileID | File ID |
| FolderID | Folder ID |
| Deleted | Whether delete succeeded |
| Destroyed | Whether destroy succeeded |
| DeleteError | Delete error message if failed |
| DestroyError | Destroy error message if failed |

## REMARKS:

- The source file **must be a CSV file with a header row**.

## EXAMPLES:

```bash
## Delete files from CSV:
deletefromsource -filePath "files to delete.csv"
```
```bash
##Delete and destroy files:
deletefromsource -filePath "files to delete.csv" -destroy
```
```bash
## Delete, destroy, and export results:
deletefromsource -filePath "files to delete.csv" -destroy -csv "results.csv"
```
```bash
## Delete, destroy (50 files at a time in each folder), and export results:
deletefromsource -filePath "files to delete.csv" -destroy -csv "results.csv" -batch 50
```