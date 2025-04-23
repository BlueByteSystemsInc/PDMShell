# GETVARFROMDB Command Documentation

## DESCRIPTION:
Gets the value of a variable for a specified file or folder directly from the database.

## SYNTAX:
```bash
getvarfromdb -filePath -variableName -configs
```

## PARAMETERS:
- `filePath` :  
  The file or folder to get the variable from.

- `variableName` :  
  The variable name to retrieve from the database.

- `configs` :  
  The configuration names to retrieve the variable from, separated by commas.

## EXAMPLES:
getvarfromdb -f "file1.sldprt" -variableName "CustomVar"

## REMARKS:
- The configuration names should be separated by commas.
- This command will always return the latest value.