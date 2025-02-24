# SETVARSFROMSOURCE Command Documentation

## DESCRIPTION:
Sets variables for multiple files using a CSV file as the source.

## SYNTAX:
setvarsfromsource -source csvFilePath

## PARAMETERS:
-source csvFilePath - The CSV file containing the file IDs and variable values.

## CSV FILE FORMAT:
The CSV file should have the following format:

FileID,Variable1,Variable2,... file1.sldprt,Value1,Value2,... file2.sldprt,Value1,Value2,...

## EXAMPLES:
setvarsfromsource -source "variables.csv"

## REMARKS:
- The CSV file should have the first column as the file ID and the subsequent columns as the variable names.
- The best way to generate a source CSV is to use the `dir` command on a folder with the `-csv` parameter, like:
`dir -csv data.csv`