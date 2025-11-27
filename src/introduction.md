---
description: Welcome to PDMShell, the command-line interpreter designed specifically for SOLIDWORKS PDM Professional. You can more information about getting started here.
title: Getting Started | PDMShell | SOLIDWORKS PDM
---
# Introduction to PDMShell

Welcome to **PDMShell**, the command-line interpreter designed specifically for **SOLIDWORKS PDM Professional**. PDMShell empowers engineers and IT professionals with a **powerful**, **flexible**, and **efficient** tool for automating and streamlining tasks within the SOLIDWORKS PDM environment.

### Using the Help System

PDMShell provides a comprehensive help system and detailed command documentation to guide you through its features. Here's how to get started:

- To view a list of all available commands, type:
  ```bash
  help
  ```
- To get detailed information about a specific command, type:
  ```bash
  help -command <command>
  ```
  For example:
  ```bash
  help -command cd
  ```

### Understanding the Command Documentation Structure
Each command page in PDMShell documentation is organized into the following sections:

1. **DESCRIPTION**: A brief explanation of what the command does.
2. **SYNTAX**: The syntax for using the command, including required and optional parameters.
3. **PARAMETERS**: A detailed explanation of each parameter, including whether it is required or optional.
4. **EXAMPLES**: Practical examples of how to use the command.
5. **REMARKS**: Additional notes, tips, or special considerations for using the command.
6. **TUTORIAL**: A short video tutorial demonstrating the command in action (if available).

### Example Command Documentation
Here’s an example of how a command is documented:

#### CD Command Documentation

**DESCRIPTION**:  
Changes the current PDM directory.

**SYNTAX**:  
```bash
cd [-directory|-id]
```

**PARAMETERS**:  
- `directory`: The directory to switch to. The directory parameter can be a relative or absolute path in PDM.  
- `id`: ID of the folder to navigate to.

**EXAMPLES**:  
```bash
cd -directory 'C:\Vault\NewFolder' # Navigates to NewFolder
cd -id 755 # Navigates to the folder with ID 755
```

**REMARKS**:  
- Use `cd..` to navigate to the parent folder or `cd\` to navigate to the root of the vault.  
- If you just created a new folder and want to `cd` to it using autocomplete, use the `dir` command with the `-refresh` parameter to reload the session.  
- `directory` is the default parameter, so you don’t need to specify it if it’s the only parameter in your command.  


### Case Sensitivity

As of **PDMShell 3.0.1**, all **command names**, **parameter names**, and **values** are **case-sensitive**.

### Escaping Quotes

Escaping quotes when passing arguments to PDMShell depends on **where the command originates**. [Please read this dedicated article](escapingquotes.md).


**TUTORIAL**:  
<video src="https://bluebyte.biz/wp-content/pdmshellvideos/cd.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>


By following this structure, you can quickly learn how to use any command in PDMShell and integrate it into your workflows.

---

## 📞 Getting Support

If you need assistance or have any questions, we're here to help!   

- **Contact Us**:  
  Click the button below to reach out to our support team:  
  [Get Support](mailto:support@bluebytesystemsinc.zohodesk.com)

---

Thank you for choosing **PDMShell**! We’re excited to help you streamline your PDM workflows and unlock new levels of productivity.
