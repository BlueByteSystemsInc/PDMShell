gi# Scripting in PDMShell

## Overview
PDMShell supports scripting to automate tasks and streamline workflows. Scripts use the `.pdmshell` file extension and are plain text files, making them easy to create and edit using any text editor, such as Notepad.

---

## Creating a Script
A PDMShell script is a sequence of PDMShell commands written in a plain text file. Each command is executed in the order it appears in the script.

### Example Script
Below is an example of a `.pdmshell` script:

```bash
# filepath: example.pdmshell
# This script automates exporting and adding files to the vault.

# Navigate to the working directory
cd "\api\sandbox\fidget spinner"

# Create a new export folder with a dynamic name using the current folder
mkdir "$name-export-$date"

# Export all SolidWorks part files to the new folder as STEP files
export -search %.sldprt -directory "$name-export-$date" -extensions stp -name $namewithoutextension-$yyyy-$mm-$dd

# Change to the newly created export folder
cd "$name-export-$date"

# Add the exported files to the vault as stp files are NOT automatically added
addtovault -source " "

# Check in all files in the current folder
checkin -search %

# Open the folder in File Explorer
start .
```

### Script Annotations
1. **`cd "\api\sandbox\fidget spinner"`**: Changes the current working directory to the specified path.
2. **`mkdir "$name-export-$date"`**: Creates a new folder with a dynamic name based on the current date and the folder name.
3. **`export`**: Exports all `.sldprt` files in the current directory to the newly created folder as `.stp` files, appending the current date to the file names.
4. **`cd "$name-export-$date"`**: Changes the working directory to the newly created export folder.
5. **`addtovault`**: Adds the exported files to the vault.
6. **`checkin`**: Checks in all files in the current folder to the vault.
7. **`start .`**: Opens the current folder in File Explorer.

---

### Comments

Lines that start with `#` are ignored.

## Executing a Script
There are two ways to execute a `.pdmshell` script:

### 1. Using `pdmcli.exe`
You can execute a script using the `pdmcli.exe` command-line tool. Provide the script file as the first argument, wrapped in quotes if the file path contains spaces.

#### Example Command
```bash
pdmcli.exe "C:\Scripts\example.pdmshell"
```

The `pdmcli.exe` tool can be found in the installation folder under `Program Files (x86)\BLUE BYTE SYSTEMS INC`.

### 2. Using the `runscript` Command
You can also execute scripts directly from the PDMShell console using the `runscript` command.

[Note]

#### Example Command
```bash
runscript -source "C:\Scripts\example.pdmshell"
```
> [!NOTE]
> For more information about the `runscript` command, refer to the [runscript documentation](runscript.html).

---

## Advanced Usage: Workflow Integration
For users with the **Premium Version** of PDMShell, `pdmcli.exe` can be hooked into workflow transitions. This allows scripts to be executed automatically as part of a workflow, enabling seamless automation of complex processes.

---

## Remarks
- Scripts are a powerful way to automate repetitive tasks and enforce consistency in workflows.
- Since `.pdmshell` files are plain text, they can be created and edited using any text editor.
- Ensure the script file is saved with the `.pdmshell` extension for proper execution.
- Use comments (`#`) in scripts to document the purpose of each command for better readability.


## Let Blue Byte Systems Write Your Scripts
If you need assistance creating scripts for your specific workflows, Blue Byte Systems offers professional scripting services. Their team of experts can design and implement custom .pdmshell scripts tailored to your requirements, ensuring optimal efficiency and accuracy.

To learn more about this service, contact Blue Byte Systems directly through their support page.