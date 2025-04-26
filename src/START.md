---
description: The START command is used to launch programs, tools, or specific applications. It supports launching SOLIDWORKS, the PDM administration tool, Notepad, Windows Explorer, and other custom programs. Additionally, it can open the SOLIDWORKS API help file or the current folder in Explorer.
title: START Command Documentation | PDMShell | SOLIDWORKS PDM
---
# START Command Documentation

## DESCRIPTION:
The `start` command is used to launch programs, tools, or specific applications. It supports launching SOLIDWORKS, the PDM administration tool, Notepad, Windows Explorer, and other custom programs. Additionally, it can open the SOLIDWORKS API help file or the current folder in Explorer.

## SYNTAX:
```bash
start -process -swversion
```

## PARAMETERS:
- **`process`**:  
  *(Optional)* Specifies the program to start. Common values include:  
  - `admin`: Launches the PDM administration tool.  
  - `notepad`: Launches Notepad.  
  - `apihelp`: Opens the SOLIDWORKS API help file.  
  - `explorer`: Opens Windows Explorer.  
  - `.`: Opens the current folder in Windows Explorer.  

- **`swversion`**:  
  *(Optional)* Specifies the version of SOLIDWORKS to launch. The year should be provided (e.g., `2023`).


## EXAMPLES:
  
   ```bash
# Launch the PDM administration tool.  
   start admin
   ```

## REMARKS:
- **Launching SOLIDWORKS**:  
  If the `-wversion` parameter is provided, the command attempts to locate and launch the specified version of SOLIDWORKS. If the version is not found, an error message will be displayed.

- **Administration Tool**:  
  The `admin` option launches the PDM administration tool. Ensure the tool is installed and accessible.

- **Notepad**:  
  The `notepad` option launches the default Notepad application from the system directory.

- **API Help**:  
  The `apihelp` option opens the SOLIDWORKS API help file (`api_gb.chm`) from the PDM installation directory.

- **Explorer**:  
  The `explorer` option opens Windows Explorer. Using `.` opens the current folder.

- **Error Handling**:  
  If the specified program or process cannot be found, an error message will be displayed.
