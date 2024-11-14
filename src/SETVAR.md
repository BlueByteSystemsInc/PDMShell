# SETVAR Command Documentation

## DESCRIPTION:
Sets the value of a variable for a specified file or folder.

## SYNTAX:
setvar [-f file] -v variable_name -s value

## PARAMETERS:
-f file - The file or folder to set the variable for.
-v variable_name - The variable to set.
-s value - The value to assign to the variable.

## EXAMPLES:
setvar -f 'file1.sldprt' -v 'CustomVar' -s 'NewValue'
