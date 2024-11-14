# List of PDM commands and their basic details
$commands = @(
    @{ Name = "ADDADDIN"; Description = "Adds an addin to the logged-in vault. Overrides any existing version."; Syntax = "addaddin -add <addin_name> [-force]"; Parameters = @(
        "addin_name - The name of the addin to be added.",
        "-force - Forces the addin to be added even if it already exists."
    ); Example = "addaddin -add 'MyAddin' -force" },

    @{ Name = "CD"; Description = "Displays the name of, or changes, the current PDM directory."; Syntax = "cd [-d directory]"; Parameters = @(
        "-d directory - The directory to switch to."
    ); Example = "cd -d 'C:\Vault\NewFolder'" },

    @{ Name = "CHECKIN"; Description = "Check-in the specified file or files using a search operation."; Syntax = "checkin [-f file]"; Parameters = @(
        "-f file - The file(s) to be checked in."
    ); Example = "checkin -f 'file1.sldprt'" },

    @{ Name = "CHECKOUT"; Description = "Checks out a file."; Syntax = "checkout [-f file]"; Parameters = @(
        "-f file - The file(s) to be checked out."
    ); Example = "checkout -f 'file2.sldasm'" },

    @{ Name = "CLS"; Description = "Clears the screen."; Syntax = "cls"; Parameters = @(); Example = "cls" },

    @{ Name = "DEBUG"; Description = "Opens up the vault in an open dialog and redirects console to the session."; Syntax = "debug"; Parameters = @(); Example = "debug" },

    @{ Name = "DIR"; Description = "Displays a list of files and subdirectories in a directory."; Syntax = "dir [-d directory]"; Parameters = @(
        "-d directory - The directory to display files from."
    ); Example = "dir -d 'C:\Vault\Documents'" },

    @{ Name = "DUMP"; Description = "Dumps all session text into a log file."; Syntax = "dump [-l logfile]"; Parameters = @(
        "-l logfile - The log file to dump session details into."
    ); Example = "dump -l 'sessionlog.txt'" },

    @{ Name = "EDITVARS"; Description = "Shows the variable editor manager."; Syntax = "editvars"; Parameters = @(); Example = "editvars" },

    @{ Name = "FROGLEAP"; Description = "Frog leaps an old version as newest."; Syntax = "frogleap [-v version]"; Parameters = @(
        "-v version - The version to leap."
    ); Example = "frogleap -v 2.1" },

    @{ Name = "GET"; Description = "Downloads a version of the specified document to the local cache."; Syntax = "get [-f file]"; Parameters = @(
        "-f file - The file to be downloaded."
    ); Example = "get -f 'file1.sldprt'" },

    @{ Name = "GETNAME"; Description = "Returns the name of an object (folder or file) from a PDM ID."; Syntax = "getname [-id object_id]"; Parameters = @(
        "-id object_id - The PDM ID of the object."
    ); Example = "getname -id 12345" },

    @{ Name = "GETVAR"; Description = "Gets the value of a variable for a specified file or folder."; Syntax = "getvar [-f file] [-v variable_name]"; Parameters = @(
        "-f file - The file or folder to get the variable from.",
        "-v variable_name - The variable name to retrieve."
    ); Example = "getvar -f 'file1.sldprt' -v 'CustomVar'" },

    @{ Name = "GETVARFROMDB"; Description = "Gets the value of a variable for a specified file or folder directly from the database."; Syntax = "getvarfromdb [-f file] [-v variable_name]"; Parameters = @(
        "-f file - The file or folder to get the variable from.",
        "-v variable_name - The variable name to retrieve from the database."
    ); Example = "getvarfromdb -f 'file1.sldprt' -v 'CustomVar'" },

    @{ Name = "HELP"; Description = "Provides description, syntax of all commands."; Syntax = "help [-c command_name]"; Parameters = @(
        "-c command_name - The specific command you need help with."
    ); Example = "help -c 'cd'" },

    @{ Name = "HISTORY"; Description = "Prints the history of a file."; Syntax = "history [-f file]"; Parameters = @(
        "-f file - The file to get the history for."
    ); Example = "history -f 'file1.sldprt'" },

    @{ Name = "INBOX"; Description = "Opens the PDM inbox and sends a message as the logged-in user."; Syntax = "inbox [-m message]"; Parameters = @(
        "-m message - The message to send."
    ); Example = "inbox -m 'File checked in successfully'" },

    @{ Name = "INFOVAR"; Description = "Gets information about a variable."; Syntax = "infovar [-v variable_name]"; Parameters = @(
        "-v variable_name - The variable name to retrieve information for."
    ); Example = "infovar -v 'CustomVar'" },

    @{ Name = "KILL"; Description = "Kills a process."; Syntax = "kill [-p process_name]"; Parameters = @(
        "-p process_name - The process to terminate."
    ); Example = "kill -p 'MyProcess'" },

    @{ Name = "LOGIN"; Description = "Authenticates a user to a specified vault."; Syntax = "login [-a|-win|-ex] -u username -p password -v vault_name"; Parameters = @(
        "Auto -a  Automatic authentication with current user. Displays login dialog box if not logged in.",
        "win -w  Automatic authentication with current user. Does not display login dialog box.",
        "External -ex Toggle ensures that a license is consumed.",
        "Username -u  Username.",
        "Password -p  Password.",
        "vaultName -v  Vault Name."
    ); Example = "login -u admin -p 'password' -v 'MyVault'" },

    @{ Name = "MKDIR"; Description = "Creates a new folder."; Syntax = "mkdir [-d directory]"; Parameters = @(
        "-d directory - The folder to create."
    ); Example = "mkdir -d 'C:\Vault\NewFolder'" },

    @{ Name = "MKVAR"; Description = "Creates a new variable."; Syntax = "mkvar [-v variable_name]"; Parameters = @(
        "-v variable_name - The name of the variable to create."
    ); Example = "mkvar -v 'NewVariable'" },

    @{ Name = "PREVIEW"; Description = "Previews thumbnails of PDM files."; Syntax = "preview [-f file]"; Parameters = @(
        "-f file - The file to preview."
    ); Example = "preview -f 'file1.sldprt'" },

    @{ Name = "PRINT"; Description = "Displays the biographical information about the specified file."; Syntax = "print [-f file]"; Parameters = @(
        "-f file - The file to print biographical information for."
    ); Example = "print -f 'file1.sldprt'" },

    @{ Name = "QUIT"; Description = "Quits the application."; Syntax = "quit"; Parameters = @(); Example = "quit" },

    @{ Name = "REBUILD"; Description = "Rebuilds SOLIDWORKS files and their references."; Syntax = "rebuild [-f file]"; Parameters = @(
        "-f file - The file(s) to rebuild."
    ); Example = "rebuild -f 'file1.sldasm'" },

    @{ Name = "RENAME"; Description = "Renames a specified file or a group of files."; Syntax = "rename [-f file] -n new_name"; Parameters = @(
        "-f file - The file(s) to rename.",
        "-n new_name - The new name for the file."
    ); Example = "rename -f 'file1.sldprt' -n 'new_file.sldprt'" },

    @{ Name = "SETVAR"; Description = "Sets the value of a variable for a specified file or folder."; Syntax = "setvar [-f file] -v variable_name -s value"; Parameters = @(
        "-f file - The file or folder to set the variable for.",
        "-v variable_name - The variable to set.",
        "-s value - The value to assign to the variable."
    ); Example = "setvar -f 'file1.sldprt' -v 'CustomVar' -s 'NewValue'" },

    @{ Name = "START"; Description = "Starts a program."; Syntax = "start [-p program_name]"; Parameters = @(
        "-p program_name - The program to start."
    ); Example = "start -p 'C:\Program Files\MyProgram.exe'" },

    @{ Name = "UNDOCHECKOUT"; Description = "Undoes a checkout operation."; Syntax = "undocheckout [-f file]"; Parameters = @(
        "-f file - The file(s) to undo the checkout for."
    ); Example = "undocheckout -f 'file1.sldprt'" },

    @{ Name = "USERS"; Description = "Lists all the users in the active vault."; Syntax = "users"; Parameters = @(); Example = "users" },

    @{ Name = "VERSION"; Description = "Lists versions of PDMShell, SOLIDWORKS, and PDM add-ins."; Syntax = "version"; Parameters = @(); Example = "version" }
)

# Define the output directory
$outputDir = "C:\Users\jlili\source\repos\BlueByteSystemsInc\PDMShell.Docs\src"


# Create the directory if it doesn't exist
if (-not (Test-Path -Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir
}

# Loop through each command and create the corresponding markdown file
foreach ($command in $commands) {
    # Define the filename (convert to lowercase for the filename)
    $fileName = "$($command.Name.ToLower()).md"
    $filePath = Join-Path -Path $outputDir -ChildPath $fileName

    # Create the file with formatted content
    $content = @"
# $($command.Name) Command Documentation

## DESCRIPTION:
$($command.Description)

## SYNTAX:
$($command.Syntax)

## PARAMETERS:
$($command.Parameters -join "`n")

## EXAMPLES:
$($command.Example)
"@

    # Write the content to the markdown file
    Set-Content -Path $filePath -Value $content
}

Write-Host "Markdown files created successfully in '$outputDir' directory."
