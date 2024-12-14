# UNDOCHECKOUT Command Documentation

## DESCRIPTION:
Undoes a checkout operation.

## SYNTAX:
undocheckout [-f filePath | -s search]

## PARAMETERS:
-f filePath - The file(s) to undo the checkout for.

-search search - The search operation to use.


## EXAMPLES:
undocheckout -f "file1.sldprt"

## REMARKS:
- The search parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.