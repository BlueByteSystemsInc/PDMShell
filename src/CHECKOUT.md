# CHECKOUT Command Documentation

## DESCRIPTION:
Performs a check-out operation on a specified file or many files.

## SYNTAX:
checkout [-s search] [-f filePath]

## PARAMETERS:
-s search - The search operation to use.

-f filePath - The file(s) to be checked out. This is the default parameter.

## EXAMPLES:
checkout -f "file1.sldprt"

## REMARKS:
- The search parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.