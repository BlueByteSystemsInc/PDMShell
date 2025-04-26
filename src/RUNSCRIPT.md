---
description: Runs a PDMShell script.
title: RUNSCRIPT Command Documentation | PDMShell | SOLIDWORKS PDM
---
# RUNSCRIPT Command Documentation

## DESCRIPTION:
Runs a PDMShell script.

## SYNTAX:
```bash
runscript -source -filePath -search -recursive
```

## PARAMETERS:
- `source`:  Script file.  
- `filePath`:  File path to run the script on.  
- `search`:  Search query to filter files.
- `recursive`: If specified, the command will run script on all files recursively in subdirectories.  
## EXAMPLES:
 ```bash
runscript -filePath pdmscript.script -search "%.sldprt" -recursive 
# this will run pdm.script on all part files in the active directory and its subdirectories
 ```

## REMARKS:
- A good way to start a script is using the `start notepad.exe` command to open up notepad.exe.
- In your script, you must use the alias `$completefilename` and `$completefoldername` to reference the file your script is targeting. This is required with the `search` or `filePath` parameters. 

## FREE VERSION LIMIT:
- The free version is limited to 10 lines per script.