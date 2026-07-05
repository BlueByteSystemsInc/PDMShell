---
description: Runs a SOLIDWORKS macro on files found by search.
title: runswmacro Command | PDMShell | SOLIDWORKS PDM
---
# runswmacro
## Description
The `runswmacro` command allows you to execute a SOLIDWORKS macro on a specific file or on multiple files found via search in the PDM vault. This is useful for automating repetitive tasks or applying custom logic to many files.


## Syntax

```text
runswmacro -filePath -search -recursive -list -skip -count -timeout
```

## Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `-filePath` | Yes | Path to the SOLIDWORKS macro file (`.swp` or `.dll`). This is required and the file needs to cached in PDM. |
| `-search` | Yes | Search query to find files to run the macro on. |
| `-recursive` | Yes | If set, search will include subfolders. |
| `-list` | Yes | csv file path of filepaths without a column header. |
| `-skip` | Yes | Skips the specified number of items. Only valid with `list`. |
| `-count` | Yes | Only processes the specified number of items. Only valid with `list`. |
| `-timeout` | Yes | Macro timeout in seconds (for both the macro to execute and for SOLIDWORKS to start too) |
| `-version` | No | SOLIDWORKS year version. Example 2023. Default is latest. |
| `-csv` | No | CSV file path used to report macro execution errors and success. |

### Parameter Details

The command requires the following parameters:

- `filePath`: Path to the SOLIDWORKS macro file (`.swp` or `.dll`). This is required and the file needs to cached in PDM.
- `search`: Search query to find files to run the macro on.
- `recursive`: If set, search will include subfolders.
- `list`: csv file path of filepaths without a column header.
- `skip`: Skips the specified number of items. Only valid with `list`.
- `count`: Only processes the specified number of items. Only valid with `list`.
- `timeout`: Macro timeout in seconds (for both the macro to execute and for SOLIDWORKS to start too)
- `version`: SOLIDWORKS year version. Example 2023. Default is latest.


- `csv`: CSV file path used to report macro execution errors and success.

## What version of SOLIDWORKS will PDMShell use?
PDMShell will use the latest SOLIDWORKS version installed on your system by checking the Windows Registry at:
```
HKEY_LOCAL_MACHINE\SOFTWARE\SolidWorks
```

>[!NOTE]
> If you have multiple SOLIDWORKS versions installed, PDMShell will automatically select the most recent version found in the registry.

## List Example

PDMShell assumes the csv file feed into the `list` parameter has a header.

```csv
File Path
C:\TestVault\part1.sldprt
C:\TestVault\assembly2.sldasm
C:\TestVault\drawing3.slddrw
C:\TestVault\bracket4.sldprt
```
>[!WARNING]
> If you only have a list of filenames, we created SOLIDWORKS VBA [this macro](/src/createcompletepathsfromfilename.html) to help you get the complete list of the filepaths from filenames.


## SWP Macro

>[!WARNING]
> Please read the remarks below to properly call your macro.

- The macro procedure name must be called `main`.
- The macro module name must be called the file name of the macro appended by `1`. Example: If the macro called `print.swp` the module name must be called `print1`.

>[!IMPORTANT]
>`runswmacro` does not check out files automatically. It opens the file in SOLIDWORKS and runs the selected macro.

If your macro needs to modify and save files inside SOLIDWORKS PDM, the macro itself must handle the check-out and check-in process.

The example below shows a generic pattern that:

1. Gets the active SOLIDWORKS document.
2. Logs in to the PDM vault.
3. Checks out the active file.
4. Runs your custom macro logic.
5. Saves the file.
6. Closes the document.
7. Checks the file back into the vault.

Before using this macro, enable the SOLIDWORKS PDM reference from:

`Tools > References > PDMWorks Enterprise Type Library`

Then update the `vaultName` constant with your vault name.

Make sure there are no missing references.


```vb
Option Explicit

Dim swApp As SldWorks.SldWorks
Dim pdmVault As EdmVault5
Dim handle As Long

Const vaultName As String = "Your vault name"

Sub main()

    On Error GoTo CleanExit

    Dim swFrame As SldWorks.Frame
    Dim swModel As SldWorks.ModelDoc2
    Dim docType As Integer
    Dim filePath As String
    Dim docTitle As String

    Set swApp = Application.SldWorks
    Set swFrame = swApp.Frame

    handle = swFrame.GetHWnd

    Set pdmVault = New EdmVault5
    pdmVault.LoginAuto vaultName, handle

    Set swModel = swApp.ActiveDoc

    If swModel Is Nothing Then GoTo CleanExit

    docType = swModel.GetType
    filePath = swModel.GetPathName

    If Len(filePath) = 0 Then GoTo CleanExit

    checkOutFile pdmVault, docType

    Set swModel = swApp.ActiveDoc

    If swModel Is Nothing Then GoTo CleanExit

    RunCustomLogic swModel

    Dim errors As Long
    Dim warnings As Long

    swModel.Save3 swSaveAsOptions_Silent, errors, warnings

    docTitle = swModel.GetTitle

    swApp.CloseDoc docTitle

    checkInClosedFile pdmVault, filePath

CleanExit:

End Sub

Private Sub checkOutFile(ByVal pdmVault As EdmVault5, ByVal docType As Integer)

    On Error GoTo Done

    Dim swModel As SldWorks.ModelDoc2
    Dim pdmFile As IEdmFile5
    Dim pdmFolder As IEdmFolder5
    Dim ret As Integer

    Set swModel = swApp.ActiveDoc

    If swModel Is Nothing Then GoTo Done

    Set pdmFile = pdmVault.GetFileFromPath(swModel.GetPathName, pdmFolder)

    If pdmFile Is Nothing Then GoTo Done
    If pdmFolder Is Nothing Then GoTo Done

    If pdmFile.IsLocked Then GoTo Done

    If swModel.ForceReleaseLocks Then
        pdmFile.LockFile pdmFolder.ID, handle
    End If

    If docType = swDocDRAWING Then
        ret = swApp.CloseAndReopen(swModel, swCloseReopenOption_DiscardChanges, swModel)
    Else
        ret = swModel.ReloadOrReplace(False, swModel.GetPathName, True)
    End If

Done:

End Sub

Private Sub checkInClosedFile(ByVal pdmVault As EdmVault5, ByVal filePath As String)

    On Error GoTo Done

    Dim pdmFile As IEdmFile5
    Dim pdmFolder As IEdmFolder5

    Set pdmFile = pdmVault.GetFileFromPath(filePath, pdmFolder)

    If pdmFile Is Nothing Then GoTo Done
    If pdmFolder Is Nothing Then GoTo Done

    If Not pdmFile.IsLocked Then GoTo Done

    pdmFile.UnlockFile handle, "Updated by SOLIDWORKS macro", EdmUnlock_OverwriteLatestVersion

Done:

End Sub

Private Sub RunCustomLogic(ByVal swModel As SldWorks.ModelDoc2)

    On Error GoTo Done

    If swModel Is Nothing Then GoTo Done

    ' Add your custom SOLIDWORKS macro logic here.
    ' Examples:
    ' - Update custom properties
    ' - Rebuild the model
    ' - Update drawing views
    ' - Export files
    ' - Change configurations
    ' - Run geometry checks

    swModel.ForceRebuild3 False
    swModel.ViewZoomtofit2

Done:

End Sub


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
# runswmacro
runswmacro -filePath "Macros/MyMacro.dll" -search "%.sldprt" -timeout 12000
```

>[!NOTE]
> The DLL must be built against .NET Framework 4.7.2 or higher

## Examples
```bash
# runswmacro
 runswmacro -filePath "Macros/BatchExport.swp" -search "%.sldprt" 
 ```

>[!Important]
> You can use the token `edit` in the search to force a check out and a check in of the search results. The check out uses the default checkout settings specified in the reference dialog of your PDM user settings (ie: this might check out the file itself and its references too). The check in will only check in the document itself (**not the references**).

```bash
# runswmacro
 runswmacro -filePath "Macros/BatchExport.swp" -search "Name=%.sldprt;Edit" 
 ```

## Availability
Available since PDMShell 2.0.83.
