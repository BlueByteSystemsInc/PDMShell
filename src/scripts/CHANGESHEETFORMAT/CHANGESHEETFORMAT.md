---
name: Change Drawing Sheet Format
id: CHANGESHEETFORMAT
description: Changes the sheet format of a matching SOLIDWORKS drawing through PDMShell.
requiresSolidWorks: true
scriptFile: CHANGESHEETFORMAT.pdmshell
macroFile: ChangeSheetFormat.swb
tags:
  - SOLIDWORKS
  - Drawing
  - Sheet Format
  - Macro
  - Checkout
  - Checkin
---

# Change Drawing Sheet Format

This script checks out the matching SOLIDWORKS drawing for the selected file, runs a macro that replaces drawing sheet formats, and checks the drawing back into SOLIDWORKS PDM.

The target drawing is resolved from the selected file name:

```text
$folderPath\$fileNameWithoutExtension.slddrw
```

## Script

```pdmshell
checkout -filePath "$folderPath\$fileNameWithoutExtension.slddrw"

cd -directory "$folderPath"

runswmacro -filePath "$tempFolder\ChangeSheetFormat.swb" -search "Name=$fileNameWithoutExtension.slddrw" -timeout 500

checkin -filePath "$folderPath\$fileNameWithoutExtension.slddrw"
```

## What it does

- Checks out the drawing with the same base name as the selected file.
- Changes the PDMShell working directory to the selected file folder.
- Runs a SOLIDWORKS macro against the matching drawing.
- Prompts once for the original and replacement sheet formats if no saved settings exist.
- Saves those settings beside the macro as `ChangeSheetFormat.ini`.
- Reuses the saved settings for subsequent files in a batch.
- Checks the drawing back into PDM.

## Requirements

- SOLIDWORKS must be installed on the machine running PDMShell.
- The user must have permission to check out and check in the drawing.
- The matching drawing must exist beside the selected file.
- The selected file should have a same-name `.slddrw` drawing in the same folder.
- The macro is downloaded to `$tempFolder\ChangeSheetFormat.swb`.

## Macro code

```vba
Option Explicit

Const swDocDRAWING As Long = 3
Const swSaveAsOptions_Silent As Long = 1

Dim swApp As SldWorks.SldWorks
Dim swModel As SldWorks.ModelDoc2
Dim swDraw As SldWorks.DrawingDoc

Sub main()

    Set swApp = Application.SldWorks
    Set swModel = swApp.ActiveDoc

    If swModel Is Nothing Then Exit Sub
    If swModel.GetType <> swDocDRAWING Then Exit Sub

    Set swDraw = swModel

    Dim configPath As String
    configPath = GetConfigPath()

    Dim oldFormat As String
    Dim newFormat As String

    LoadSettings configPath, oldFormat, newFormat

    oldFormat = Trim(oldFormat)
    newFormat = Trim(newFormat)

    If oldFormat = "" Or newFormat = "" Then

        oldFormat = InputBox("Enter the original sheet format name or path to replace.", "Change Sheet Format")
        If Trim(oldFormat) = "" Then Exit Sub

        newFormat = InputBox("Enter the new sheet format path.", "Change Sheet Format")
        If Trim(newFormat) = "" Then Exit Sub

        SaveSettings configPath, oldFormat, newFormat

    End If

    Dim sheetNames As Variant
    sheetNames = swDraw.GetSheetNames

    If IsEmpty(sheetNames) Then Exit Sub

    Dim changed As Boolean
    changed = False

    Dim i As Long
    For i = LBound(sheetNames) To UBound(sheetNames)

        swDraw.ActivateSheet CStr(sheetNames(i))

        Dim swSheet As SldWorks.Sheet
        Set swSheet = swDraw.GetCurrentSheet

        If Not swSheet Is Nothing Then

            Dim currentFormat As String
            currentFormat = swSheet.GetTemplateName

            If ShouldReplaceFormat(currentFormat, oldFormat) Then

                swSheet.SetTemplateName newFormat
                swSheet.ReloadTemplate True

                changed = True

            End If

        End If

    Next i

    If changed Then

        swModel.ForceRebuild3 True

        Dim errors As Long
        Dim warnings As Long

        swModel.Save3 swSaveAsOptions_Silent, errors, warnings

    End If

End Sub

Function ShouldReplaceFormat(ByVal currentFormat As String, ByVal oldFormat As String) As Boolean

    Dim currentLower As String
    Dim oldLower As String

    currentLower = LCase(Trim(currentFormat))
    oldLower = LCase(Trim(oldFormat))

    If currentLower = oldLower Then
        ShouldReplaceFormat = True
        Exit Function
    End If

    If GetFileNameOnly(currentLower) = GetFileNameOnly(oldLower) Then
        ShouldReplaceFormat = True
        Exit Function
    End If

    ShouldReplaceFormat = False

End Function

Function GetConfigPath() As String

    Dim macroPath As String
    macroPath = swApp.GetCurrentMacroPathName

    If Trim(macroPath) = "" Then
        GetConfigPath = Environ$("TEMP") & Chr(92) & "ChangeSheetFormat.ini"
    Else
        GetConfigPath = Left(macroPath, InStrRev(macroPath, Chr(92))) & "ChangeSheetFormat.ini"
    End If

End Function

Sub LoadSettings(ByVal configPath As String, ByRef oldFormat As String, ByRef newFormat As String)

    oldFormat = ""
    newFormat = ""

    If Dir(configPath) = "" Then Exit Sub

    Dim fileNo As Integer
    fileNo = FreeFile

    Open configPath For Input As #fileNo

    Do Until EOF(fileNo)

        Dim line As String
        Line Input #fileNo, line

        If LCase(Left(line, 10)) = "oldformat=" Then
            oldFormat = Mid(line, 11)
        ElseIf LCase(Left(line, 10)) = "newformat=" Then
            newFormat = Mid(line, 11)
        End If

    Loop

    Close #fileNo

End Sub

Sub SaveSettings(ByVal configPath As String, ByVal oldFormat As String, ByVal newFormat As String)

    Dim fileNo As Integer
    fileNo = FreeFile

    Open configPath For Output As #fileNo

    Print #fileNo, "OldFormat=" & oldFormat
    Print #fileNo, "NewFormat=" & newFormat

    Close #fileNo

End Sub

Function GetFileNameOnly(ByVal path As String) As String

    Dim slashPos As Long
    slashPos = InStrRev(path, Chr(92))

    If slashPos > 0 Then
        GetFileNameOnly = Mid(path, slashPos + 1)
    Else
        GetFileNameOnly = path
    End If

End Function
```

## Settings file

The macro creates and reuses this file beside the macro:

```ini
OldFormat=OldSheetFormat.slddrt
NewFormat=C:\SOLIDWORKS Sheet Formats\NewSheetFormat.slddrt
```

## Placeholders used

| Placeholder | Description |
|---|---|
| `$folderPath` | Local folder path of the selected file |
| `$fileNameWithoutExtension` | Selected file name without its extension |
| `$tempFolder` | Temporary folder in your Windows session |
