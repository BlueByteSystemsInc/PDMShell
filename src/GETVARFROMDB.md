# GETVARFROMDB Command Documentation

## DESCRIPTION:
Gets the value of a variable for a specified file or folder directly from the database.

## SYNTAX:
getvarfromdb [-f filePath] [-var variableName] [-configs configNames]

## PARAMETERS:
-f filePath - The file or folder to get the variable from.

-var variableName - The variable name to retrieve from the database.

-configs configNames - The configuration names to retrieve the variable from, separated by commas.

## EXAMPLES:
getvarfromdb -f "file1.sldprt" -var "CustomVar"

## REMARKS:
- The configuration names should be separated by commas.