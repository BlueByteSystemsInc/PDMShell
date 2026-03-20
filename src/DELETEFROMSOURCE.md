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
| `filePath` | string | Yes | Path to the source CSV file containing File IDs and Folder IDs. This can be outside the vault. |
| `destroy` | flag | No | If specified, files will be permanently destroyed after deletion. |
| `csv` | string | No | Path to export the results CSV file. |
| `batch` | int | No | Destory batch size for large folders. |


## IMPORTANT NOTES ABOUT `-destroy`:
The `deletefromsource` command first attempts to delete and destroy (if `-destroy` used) files normally using the provided input (IDs from the CSV).

After that initial pass, it performs a second step using the Name column. This is specifically for files that were already deleted but not destroyed.
Since these files no longer exist in the vault in a normal state, they cannot be deleted again and their IDs do not exist anymore. Instead, PDMShell uses the file name to locate these previously deleted items and destroy them directly.

This approach allows you to:
- Handle active files (delete → destroy)
- Handle already deleted files (destroy only) if there a value in the name column. See structure of the CSV file.

>[!Important]
>For previously deleted files, you only need to provide the file name in the Name column.

## SOURCE CSV FORMAT:

The source CSV file must contain a header row with the following columns:

```bash
FileID,FolderID,Name
12345,678,1.sldprt
12346,678,2.sldprt
```
>[!Important]
>The `Name` column is optional. PDMShell uses this value to destroy items. You can enter the names of files that were previously deleted; PDMShell will attempt to delete them (which will fail) and then proceed to destroy them. 

| Column | Description |
|---|---|
| FileID | The document ID of the file |
| FolderID | The folder ID containing the file |

## RESULTS CSV FORMAT:

If `-csv` is specified, PDMShell will generate a results file containing:

```bash
FileID,FolderID,Error
12345,678,"DELETE error: File Not Found"
```

## RESULTS CSV COLUMNS:

| Column | Description |
|---|---|
| FileID | File ID |
| FolderID | Folder ID |
| Error | Error message |


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