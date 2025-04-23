# GETVAR Command Documentation

## DESCRIPTION:
Gets the value of a variable for a specified file or folder.

## SYNTAX:
```bash
getvar -filePath -variableName -configs -clear -version
```
## PARAMETERS:
- `filePath` :  
  The file or folder to get the variable from.

- `variableName` :  
  The variable name to retrieve.

- `configs` :  
  The configuration names to retrieve the variable from, separated by commas.

- `clear` :  
  Clears the variable value.

- `version` :  
  The version of the file to retrieve the variable from.

## EXAMPLES:
```bash
getvar -filePath "file1.sldprt" -variableName "CustomVar"
```
## REMARKS:
- The configuration names should be separated by commas.
- The variable must be in the data card.
- **This comand will return what's in the locale cache which may not be necessarily the latest version. For that, please use `getVarFromDB`**.