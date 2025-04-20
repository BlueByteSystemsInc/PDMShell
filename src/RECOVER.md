# RECOVER Command Documentation

## DESCRIPTION:
The `recover` command is used to recover files from a specified directory or source. It supports optional parameters for search queries and recursive operations.

## SYNTAX:
```bash
recover -directory -search -recursive -source 
```

## PARAMETERS:

- `directory`: Specifies the directory to recover files from. This parameter is optional.
- `search`: A search query to filter the files to recover. This parameter is optional. Supports % and * as wildcards.
- `recursive`: Enables recursive recovery of files within subdirectories. This parameter is optional.
- `source`: Specifies the source to recover files from. This parameter is optional.

>[!NOTE]
> - To generate a source csv file, use the command `delete -list -csv deletedfiles.csv` to generate a list of all deleted files in the current directory.
> - You can include `recursive` to get all files from the subdirectories.
> - To generate a source csv file for a particular directory, use `directory` in combination with `list` and `csv`. 

## EXAMPLES:
```bash
recover -source "source.csv"
# Recovers files from the specified source.
recover -directory ""
# Recovers files from the current directory.
```

## REMARKS:
- Ensure that the specified directory or source exists and is accessible.

## TUTORIAL:
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/recover.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>