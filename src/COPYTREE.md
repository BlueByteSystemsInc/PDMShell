---
description: Copies a file tree in the SOLIDWORKS PDM vault.
title: copytree Command | PDMShell | SOLIDWORKS PDM
---
# copytree
## Description
The `copytree` command copies a file tree in the SOLIDWORKS PDM vault, with options to apply prefixes, suffixes, and other filters. This only works with assembly files.

## Syntax

```text
copytree [-search|-filePath] -suffix -prefix -recursive -includedrawings -latest -directory
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-search` | No | A search query to filter files to be copied. |
| `-filePath` | No | The source file or directory to copy. |
| `-suffix` | Mode-dependent | Adds a suffix to the copied files. |
| `-prefix` | Mode-dependent | Adds a prefix to the copied files. |
| `-recursive` | Mode-dependent | Copies files recursively from subdirectories. |
| `-includedrawings` | Mode-dependent | Includes associated drawing files in the copy operation. |
| `-latest` | Mode-dependent | Ensures the latest version of the files is copied. |
| `-directory` | Mode-dependent | Specifies the target directory where the files will be copied. |

### Parameter Details

- `filePath`: The source file or directory to copy.  
- `directory`: Specifies the target directory where the files will be copied.  
- `search`: A search query to filter files to be copied.  
- `suffix`: Adds a suffix to the copied files.  
- `prefix`:  Adds a prefix to the copied files.  
- `recursive`: Copies files recursively from subdirectories.  
- `includedrawings`: Includes associated drawing files in the copy operation.  
- `latest`: Ensures the latest version of the files is copied.

## Examples
 ```bash
   copytree -filePath "fidget spinner.sldasm" -suffix _ -directory "\new project" #copies the fidget spinner to new project folder with suffix _
   copytree -search "*.sldasm" -includedrawings -directory "c:\export" #copies all assemblies in current directory to the export under c drive
   ```

## Remarks
- The `-dir` parameter specifies the target directory. If omitted, the current directory is used.
- Use the `recursive` parameter to include all subdirectories in the operation.
- The `includedrawings` parameter ensures that associated drawing files are included in the copy.
- The `latest` parameter ensures that only the latest versions of files are copied.

## Availability
Available since PDMShell 2.0.46.
