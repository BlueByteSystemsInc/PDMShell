---
description: Execute a SOLIDWORKS macro on a specific file or on multiple files found via search in the PDM vault.
title: RUNSWMACRO Command Documentation | PDMShell | SOLIDWORKS PDM
---
# RUNSWMACRO Command Documentation

## DESCRIPTION:

The `RunSWMacro` command allows you to execute a SOLIDWORKS macro on a specific file or on multiple files found via search in the PDM vault. This is useful for automating repetitive tasks or applying custom logic to many files.


## SYNTAX:

```bash
runswmacro -filePath -search -recursive
```

## PARAMETERS:

The command requires the following parameters:

- `filePath`: Path to the SOLIDWORKS macro file (`.swp` or `.dll`). This is required and the file needs to cached in PDM.
- `search`: (Optional) Search query to find files to run the macro on.
- `recursive`: (Optional) If set, search will include subfolders.
- `list`: (Optional) csv file path of filepaths without a column header.
- `skip`: Skips the specified number of items. Only valid with `list`.
- `count`: Only processes the specified number of items. Only valid with `list`.
- `timeout`: Macro timeout in milliseconds

## List Example

```csv
C:\TestVault\part1.sldprt
C:\TestVault\assembly2.sldasm
C:\TestVault\drawing3.slddrw
C:\TestVault\bracket4.sldprt
```

## SWP Macro

>[!WARNING]
> Please read the remarks below to properly call your macro.

- The macro procedure name must be called `main`.
- The macro module name must be called the file name of the macro appended by `1`. Example: If the macro called `print.swp` the module name must be called `print1`.


## DLL Macro
>[!WARNING]
> Please read the requirements below to properly create your DLL macro.

### Requirements
- The macro class must implement the `IPDMShellSOLIDWORKSMacro` interface
- The class must be decorated with the `PDMShellMacro` attribute
- The interface can be found in the NuGet package `BlueByte.PDMShell.SOLIDWORKSMacro` on nuget.org

### Required NuGet Package Versions

>[!IMPORTANT]
> Your project must use these specific versions of the NuGet packages:

```xml
<PackageReference Include="BlueByte.PDMShell.SOLIDWORKSMacro" Version="1.0.0" />
<PackageReference Include="BlueByte.SOLIDWORKS.Interops" Version="2019.0.0" />
<PackageReference Include="BlueByte.SOLIDWORKS.PDMProfessional.Interops" Version="2024.5.50" />
```

Install using Package Manager Console:

```powershell
Install-Package BlueByte.PDMShell.SOLIDWORKSMacro -Version 1.0.0
Install-Package BlueByte.SOLIDWORKS.Interops -Version 2019.0.0
Install-Package BlueByte.SOLIDWORKS.PDMProfessional.Interops -Version 2024.5.50
```

>[!NOTE]
> Using different versions may result in compatibility issues or runtime errors.
> These specific versions are tested and guaranteed to work with PDMShell.

### Example Implementation
```csharp
using PDMShellSOLIDWORKSMacro;
using SolidWorks.Interop.sldworks;
using EPDM.Interop.epdm;

[PDMShellMacro]
public class MyMacro : IPDMShellSOLIDWORKSMacro
{
    public bool Execute(
        SldWorks swApp, 
        IEdmFile5 pdmFileObject, 
        IEdmFolder5 pdmFolderObject, 
        int handle, 
        string progress, 
        IPDMCmdLineCallback callback, 
        out string error)
    {
        error = string.Empty;
        // Update progress using the callback
        callback.AppendMessage("Starting macro execution...");
        
        // Your macro implementation here
        callback.AppendMessage($"Processing file: {pdmFileObject.Name}");
        
        // Report completion
        callback.AppendMessage("Macro execution completed successfully");

        return true;
    }
}
```

>[!NOTE]
> Use the `callback.AppendMessage()` method to provide progress updates and status messages during macro execution. These messages will be displayed in the PDMShell output.

### Running the Macro
```bash
# Run the DLL macro on all parts in the current directory
runswmacro -filePath "Macros/MyMacro.dll" -search "%.sldprt" -timeout 12000
```

>[!NOTE]
> The DLL must be built against .NET Framework 4.7.2 or higher

## EXAMPLE:

```bash
# run batch export macro on all part in the current directory
 runswmacro -filePath "Macros/BatchExport.swp" -search "%.sldprt" 
 ```