---
title: Use PDMShell with Claude Desktop | Version 4.0.53
description: Connect Claude Desktop to PDMShell and use natural language to discover and run SOLIDWORKS PDM commands.
keywords: PDMShell MCP server, Claude Desktop, SOLIDWORKS PDM AI, Model Context Protocol, PDMShell 4.0.53
---

<img src="../images/claude.svg" alt="Claude logo" width="56">

# Use PDMShell with Claude Desktop

PDMShell 4.0.53 lets you work with SOLIDWORKS PDM from Claude Desktop. You can ask questions in everyday language, explore available PDMShell commands, build searches, and run approved operations in your local vault.

You do not need to configure the connection manually. Install or update PDMShell, restart Claude Desktop, and Claude will see a connection named **pdmshell**.

>[!Important]
> PDMShell and its Claude integration are installed and updated together. Their version numbers always match.

## Get started

1. [Install or update PDMShell](howtoinstall.md).
2. Close Claude Desktop completely if it is running.
3. Start Claude Desktop again.
4. Ask Claude: **What version of PDMShell is installed?**

Claude should use the `pdmshell_version` tool and show matching PDMShell and MCP server versions. For PDMShell 4.0.53, both versions are `4.0.53.0`.

## Things you can ask Claude

Try prompts like these:

> Show me the PDMShell commands that are available.

> Explain every parameter for the PDMShell search command.

> Show the PDM vault views available on this computer.

> Build a search for checked-out SOLIDWORKS part files where the Description variable contains "bracket".

> Log in to the Engineering vault, then show me the files in the current folder.

Claude can look up command syntax and parameter details before it creates a command. It can also explain PDMShell search fields, variable expressions, operators, sorting, grouping, duplicate handling, and escaping.

## Connect to a vault

Claude can inspect PDMShell without logging in, but it must log in before reading or changing vault content.

You can simply ask:

> Show my available PDM vaults and help me log in to one.

After login, the connection keeps the same PDMShell session. Claude can continue working with the selected vault and current folder without starting over for every command.

## Long-running commands

PDMShell reports progress to Claude while longer commands run. Progress messages can identify the current operation or file as PDMShell processes it.

You can ask Claude to cancel an active command. PDMShell forwards that request to the running operation and stops at the next safe cancellation point. Some SOLIDWORKS or PDM API calls must finish before cancellation can take effect.

## Your PDMShell license

Claude uses the PDMShell machine license already installed on your computer. There is no separate MCP license and no second activation step.

If no Premium license is installed, PDMShell continues with its normal Free-version limits. You can ask Claude to show the current license status at any time.

Learn more about [machine licenses](machine-license.md) or [compare Free and Premium](FREEVSPREMIUM.md).

## Review commands before running them

Claude can run PDMShell commands that modify PDM files and data. Before approving a large, destructive, or unfamiliar operation, ask Claude to:

1. Explain the command.
2. Show the complete command and all parameters.
3. Describe which files or folders it may affect.
4. Wait for your approval before running it.

For extra safety, begin with a search or listing command so you can review the affected items first.

## If Claude cannot find PDMShell

Try these steps:

1. Confirm that PDMShell 4.0.51 or newer is installed.
2. Close and restart Claude Desktop.
3. Open Claude Desktop's integrations and confirm that **pdmshell** appears.
4. Ask Claude: **Use pdmshell_version and show me the result.**
5. If vault commands fail, ask Claude to list the available vaults and log in first.

If the connection still does not appear, reinstall or update PDMShell and restart Claude Desktop.

## Check or edit Claude Desktop's configuration

PDMShell normally adds the connection automatically. If **pdmshell** is missing from Claude Desktop, you can check Claude's configuration file manually.

Close Claude Desktop before editing the file. Make a backup copy first so you can restore your existing integrations if the JSON is entered incorrectly.

Claude Desktop commonly stores the file in one of these locations:

- Standard Claude Desktop installation: `%APPDATA%\Claude\claude_desktop_config.json`
- Microsoft Store installation: `%LOCALAPPDATA%\Packages\Claude_*\LocalCache\Roaming\Claude\claude_desktop_config.json`

The `Claude_*` folder name varies. Open `%LOCALAPPDATA%\Packages` in File Explorer, find the folder whose name begins with `Claude_`, and then open `LocalCache\Roaming\Claude`.

If `claude_desktop_config.json` does not exist, create it as a plain text file with that exact name. Make sure Windows has not added a hidden `.txt` extension.

The file should contain a `pdmshell` entry like this:

```json
{
  "mcpServers": {
    "pdmshell": {
      "command": "C:\\Users\\YourName\\AppData\\Local\\Blue Byte Systems\\PDMShell\\current\\MCP\\pdmcli.mcp.exe",
      "args": []
    }
  }
}
```

Replace `YourName` with your Windows user-folder name. You can also browse to `pdmcli.mcp.exe`, copy its complete path, and use that path for `command`. Keep the doubled backslashes because Claude's configuration uses JSON syntax.

If Claude already has other MCP servers, keep them and add `pdmshell` inside the existing `mcpServers` object. Separate the entries with a comma:

```json
{
  "mcpServers": {
    "another-server": {
      "command": "C:\\Tools\\another-server.exe"
    },
    "pdmshell": {
      "command": "C:\\Users\\YourName\\AppData\\Local\\Blue Byte Systems\\PDMShell\\current\\MCP\\pdmcli.mcp.exe",
      "args": []
    }
  }
}
```

Save the file, restart Claude Desktop, and ask:

> Use pdmshell_version and show me the result.

### Common Claude configuration problems

- **PDMShell does not appear:** Fully exit Claude Desktop from the system tray and start it again.
- **Server disconnected:** Confirm that Claude's `command` path exists and ends with `MCP\pdmcli.mcp.exe`.
- **Configuration does not load:** Check for a missing comma, extra comma, unmatched brace, or single backslashes in the JSON file.
- **An old PDMShell version appears:** Update or reinstall PDMShell, then restart Claude Desktop.
- **Other Claude integrations disappeared:** Restore your backup and add only the `pdmshell` entry inside the existing `mcpServers` object.
- **Version works but vault commands fail:** Ask Claude to list available vaults and log in before running a vault command.

## Available tools

You normally do not need to call these tools by name—Claude chooses the appropriate one for your request.

| Tool | What it does |
| --- | --- |
| `pdmshell_version` | Shows the installed PDMShell and MCP server versions. |
| `pdmcli_license_status` | Shows the local PDMShell license status. |
| `pdmcli_list_vaults` | Lists PDM vault views available on this computer. |
| `pdmcli_list_commands` | Lists available PDMShell commands. |
| `pdmcli_describe_command` | Explains a command and all its parameters. |
| `pdmcli_describe_search` | Explains PDMShell searches and provides examples. |
| `pdmcli_execute` | Runs a PDMShell command in the current session. |

Continue with [Advanced Search](advancedsearch.md), the [Command Reference](COMMANDS.md), or the [PDMShell release notes](releasenotes.md).
