# FROGLEAP Command Documentation

## DESCRIPTION:
Frog leaps an old version as newest. 

## SYNTAX:
frogleap [-s search] [-f filePath] [-oldVersion oldVersion]

## PARAMETERS:
-s search - The search operation to use.

-f filePath - The file(s) to be frog leaped. This is the default parameter.

-oldVersion oldVersion - The old version to leap. This is an integer.

## EXAMPLES:
frogleap -f "file1.sldprt" -oldVersion 2

## REMARKS:
- The search parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.