# GETVARFROMDB Command Documentation

## DESCRIPTION:
Gets the value of a variable for a specified file or folder directly from the database.

## SYNTAX:
getvarfromdb [-f file] [-v variable_name]

## PARAMETERS:
-f file - The file or folder to get the variable from.
-v variable_name - The variable name to retrieve from the database.

## EXAMPLES:
getvarfromdb -f 'file1.sldprt' -v 'CustomVar'
