# COPYTREE Command Documentation

## DESCRIPTION:
The `copytree` command is used to copy files and their associated metadata from a source directory or search results, with options to apply prefixes, suffixes, and other filters. This only works with assembly files.

## SYNTAX:
```bash
copytree [-search|-filePath] -suffix -prefix -recursive -includedrawings -latest -directory
```

## PARAMETERS:
- `-filePath`: The source file or directory to copy.  
- `-directory`: Specifies the target directory where the files will be copied.  
- `-search`: A search query to filter files to be copied.  
- `-suffix`: Adds a suffix to the copied files.  
- `-prefix`:  Adds a prefix to the copied files.  
- `-recursive`: Copies files recursively from subdirectories.  
- `-includedrawings`: Includes associated drawing files in the copy operation.  
- `-latest`: Ensures the latest version of the files is copied.

## EXAMPLES:
 ```bash
   copytree -filePath "fidget spinner.sldasm" -suffix _ -directory "\new project" #copies the fidget spinner to new project folder with suffix _
   copytree -search "*.sldasm" -includedrawings -directory "c:\export" #copies all assemblies in current directory to the export under c drive
   ```

## REMARKS:
- The `-dir` parameter specifies the target directory. If omitted, the current directory is used.
- Use the `-recursive` parameter to include all subdirectories in the operation.
- The `-includedrawings` parameter ensures that associated drawing files are included in the copy.
- The `-latest` parameter ensures that only the latest versions of files are copied.
