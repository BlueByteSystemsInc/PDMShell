# RUNSCRIPT Command Documentation

## DESCRIPTION:
Runs a PDMShell script.

## SYNTAX:
runscript [-filePath filePath]

## PARAMETERS:
-filePath  file path to the script file.

## EXAMPLES:
runscript -source pdmshell.script 
In the example above the pdmshell.script exists in the current directory.

## REMARKS:
- Script file must be stored in PDM.
- Commands like `cls` and `quit` are not supported in scripting.
- A good way to start creating a script is the  `start notepad.exe` command. Use it to create a new text file and copy the commands from the PDMShell session.