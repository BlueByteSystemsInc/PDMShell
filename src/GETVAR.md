# GETVAR Command Documentation

## DESCRIPTION:
Gets the value of a variable for a specified file or folder.

## SYNTAX:
getvar [-f filePath] [-var variableName] [-configs configNames] [-clear] [-ver version]

## PARAMETERS:
-f filePath - The file or folder to get the variable from.

-var variableName - The variable name to retrieve.

-configs configNames - The configuration names to retrieve the variable from, separated by commas.

-clear - Clears the variable value.

-ver version - The version of the file to retrieve the variable from.

## EXAMPLES:
getvar -f "file1.sldprt" -var "CustomVar"

## REMARKS:
- The configuration names should be separated by commas.
- The variable must be in the data card.