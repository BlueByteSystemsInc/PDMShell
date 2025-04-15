# RENAMEFROMSOURCE Command Documentation

## DESCRIPTION:
The `renamefromsource` command is used to rename files in the PDM system based on a source CSV file. The CSV file provides the necessary information to map file IDs to their new names and folder IDs. This command supports alias evaluation for dynamic renaming.

---

## SYNTAX:
```bash
renamefromsource -filePath -evaluatealias -csv 
```

## PARAMETERS:
- `filePath`: (Required) The source file path. This must be a CSV file with three columns:

1. File ID: The ID of the file to be renamed.
2. New File Name: The new file name, including the extension.
3. Folder ID: The ID of the folder containing the file.

- `evaluatealias`: Toggle. This allows placeholders to be used in the new file name.
- `csv`: Specifies the path to an additional CSV file for batch renaming.

## EXAMPLES:
Rename files using a source CSV file:
```bash
renamefromsource -filePath "C:\data\rename.csv" -evaluatealias  
# renames all the files in rename.csv while evaluating aliases
```

## CSV FORMAT:
The source CSV file must have the following structure:

| File ID | New File Name           | Folder ID |
|---------|--------------------------|-----------|
| 123     | newfile1.txt             | 456       |
| 124     | anotherfile.docx         | 457       |
| 125     | examplefile_backup.pdf   | 458       |

- **File ID**: The ID of the file to be renamed.  
- **New File Name**: The desired new name for the file, including the extension.  
- **Folder ID**: The ID of the folder containing the file.

## REMARKS:
- The `filePath` parameter is mandatory and must point to a valid CSV file.
- The `evaluatealias` parameter supports dynamic placeholders for renaming, such as $name, $revision, $yyyy, etc. Ensure the CSV file is properly formatted with three columns: File -ID, New File Name, and Folder ID.
- The `csv` parameter is optional and can be used to provide additional renaming data.

For more information about alias evaluation, refer to the [Dynamic Placeholders in PDMShell](EVAL.html).

## TUTORIAL:
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/renamefromsource.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>