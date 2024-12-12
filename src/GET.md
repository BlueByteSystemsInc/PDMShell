# GET Command Documentation

## DESCRIPTION:
Retrieves a specified version of a file or files.

## SYNTAX:
get [-s search] [-f filePath] [-ver version]

## PARAMETERS:
-s search - The search operation to use.

-f filePath - The file(s) to retrieve. This is the default parameter.

-ver version - The version of the file to retrieve.

## EXAMPLES:
get -f "file1.sldprt" -ver 2

## REMARKS:
- The search parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.