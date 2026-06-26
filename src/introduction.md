---
description: Learn what PDMShell is, how it helps automate SOLIDWORKS PDM Professional, and where to start with commands, scripts, the add-in, and visual workflows.
title: Getting Started with PDMShell | SOLIDWORKS PDM Automation
---
# Introduction to PDMShell

PDMShell is a command-line and scripting tool for SOLIDWORKS PDM Professional. It helps administrators, engineers, and migration teams automate repetitive vault work without writing a full custom add-in for every task.

You can use PDMShell for quick one-line commands, repeatable `.pdmshell` scripts, batch operations, workflow transition automation, Dispatch integration, and PDMShell add-in scripts that run directly inside the PDM client.

## What You Can Do with PDMShell

PDMShell is useful when you need to automate file, folder, metadata, and workflow operations in PDM.

- Navigate vault folders and inspect files.
- Check files in or out.
- Rename, move, copy, delete, recover, and export files.
- Read and update PDM variables.
- Search for files and export results to CSV.
- Run SOLIDWORKS macros and PDM tasks.
- Automate revision, version, reference, BOM, and Document Manager workflows.
- Build scripts that users can run from the PDMShell add-in, Dispatch, workflow transitions, or scheduled jobs.

## Ways to Use PDMShell

### Interactive Command Shell

Use the PDMShell window when you want to type commands directly and see the result immediately.

```bash
login -auto -vaultName MyVault
cd "\Projects"
dir
```

### Script Files

Save repeatable work in `.pdmshell` files and run them with `pdmcli.exe` or the [`runscript`](RUNSCRIPT.md) command.

```bash
runscript -source "C:\Scripts\UpdateVariables.pdmshell"
```

PDMShell can read normal `.pdmshell` script files as plain text, which makes them easy to store in a PDM vault, review, version, and reuse.

When you save a script from the PDMShell toolbar or visual editor, PDMShell may convert the saved file to an encrypted script format for security. This helps protect scripts that are intended to be distributed or run by users without exposing the editable source text.

### Visual Code Editor

The visual editor helps you build PDMShell workflows with command nodes, connections, and command parameters. It is useful when a script needs to be easier to understand, document, or hand off to another administrator.

See [Visual Code Editor](visual-code-editor-4.md).

### PDMShell Add-in

The [PDMShell add-in](TASKSCRIPT.md) lets administrators run approved scripts from PDM right-click menus and event trigger points. It can replace many Dispatch-style automations and adds permissions, conditions, command menu scripts, placeholders, headless execution, and visual editor support.

## First Commands to Learn

Start with these commands before moving into larger scripts:

| Command | What it does |
| --- | --- |
| [`login`](LOGIN.md) | Logs into a PDM vault. |
| [`cd`](CD.md) | Changes the current PDM folder. |
| [`dir`](DIR.md) | Lists files and folders. |
| [`search`](SEARCH.md) | Finds files and folders. |
| [`getvar`](GETVAR.md) | Reads PDM variable values. |
| [`setvar`](SETVAR.md) | Updates PDM variable values. |
| [`runscript`](RUNSCRIPT.md) | Runs a saved `.pdmshell` script. |
| [`help`](HELP.md) | Lists commands or opens command help. |

## Using the Help System

PDMShell includes a help system for learning commands while you work.

To view all available commands:

```bash
help
```

To get help for a specific command:

```bash
help -command cd
```

## Command Page Structure

Each command page in this documentation follows the same structure:

1. Description: What the command does.
2. Syntax: The command format and supported parameters.
3. Parameters: What each parameter means.
4. Examples: Common ways to use the command.
5. Remarks: Notes, limits, and important behavior.
6. Availability: The PDMShell version where the command first became available.

## Example Command Page

Here is a small example using the [`cd`](CD.md) command.

```bash
cd [-directory|-id]
```

Examples:

```bash
cd -directory "C:\Vault\NewFolder"
cd -id 755
cd..
cd\
```

Notes:

- Use `cd..` to move to the parent folder.
- Use `cd\` to move to the root of the vault.
- If you just created a folder and want autocomplete to see it, use `dir -refresh`.
- `directory` is the default parameter, so `cd "\Projects"` is valid.

## Dynamic Placeholders

PDMShell scripts can use placeholders for file names, folder paths, variables, dates, and other runtime values.

```bash
rename -filePath "$localPath" -value "$fileNameWithoutExtension-$yyyy$extension"
```

See [Dynamic Placeholders in PDMShell](EVAL.md).

## Case Sensitivity

As of PDMShell 3.0.1, command names, parameter names, and values are case-sensitive.

## Escaping Quotes

Escaping quotes depends on where the command starts, such as Command Prompt, Dispatch, a workflow transition, or an existing PDMShell session.

See [Escaping Characters](escapingquotes.md).

## Quick Tutorial

This short tutorial shows basic folder navigation with the [`cd`](CD.md) command.

<video src="https://bluebyte.biz/wp-content/pdmshellvideos/cd.mp4" autoplay muted controls style="width: 100%; border-radius: 8px;"></video>

## Getting Support

If you need help building scripts or planning automation, contact Blue Byte Systems support:

[Get Support](mailto:support@bluebytesystemsinc.zohodesk.com)

Thank you for choosing PDMShell. We are excited to help you streamline your PDM workflows and unlock new levels of productivity.
