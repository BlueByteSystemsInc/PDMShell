---
title: PDMShell MCP Server for Claude Desktop | Version 4.0.51
description: Use the bundled PDMShell MCP server to discover and run SOLIDWORKS PDM commands from Claude Desktop with the local PDMShell machine license.
keywords: PDMShell MCP server, Claude Desktop, SOLIDWORKS PDM AI, Model Context Protocol, pdmshell 4.0.51
---

# PDMShell MCP Server

PDMShell 4.0.51 introduces a bundled [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) server for Claude Desktop. It lets Claude discover PDMShell commands, understand their parameters and search expressions, and run commands through the same PDMShell command engine used by the desktop application.

>[!Important]
> The MCP server ships with PDMShell and always uses the same release version. PDMShell 4.0.51 installs MCP server 4.0.51; updating PDMShell updates the local MCP server at the same time.

## Automatic Claude Desktop setup

The signed VeloPack installer includes `pdmcli.mcp.exe` and registers it in Claude Desktop as `pdmshell` after installation. An update refreshes the registration so Claude points to the MCP executable in the current PDMShell version folder. Uninstalling PDMShell removes the `pdmshell` entry without removing unrelated Claude settings.

Restart Claude Desktop after installing or updating PDMShell so it reloads the MCP configuration.

## Licensing and vault access

The MCP server uses the local PDMShell machine license. It does not maintain a separate license or require a separate activation. License limits enforced by PDMShell also apply when a command is executed through Claude.

Version, license, command, parameter, search, and vault-view discovery do not require an active vault login. Commands that access vault content require Claude to establish a PDMShell session with the appropriate vault first.

## Available MCP tools

| Tool | Purpose |
| --- | --- |
| `pdmshell_version` | Reports the MCP server, PDMShell, Core, protocol, and runtime versions without requiring a vault login. |
| `pdmcli_license_status` | Reports the locally installed PDMShell machine-license tier. |
| `pdmcli_list_vaults` | Lists SOLIDWORKS PDM vault views available to the current Windows user. |
| `pdmcli_list_commands` | Lists available PDMShell commands, descriptions, and required license tiers. |
| `pdmcli_describe_command` | Describes every parameter, short name, requirement, accepted type, and example for a command. |
| `pdmcli_describe_search` | Explains search tokens, PDM variable expressions, operators, sorting, grouping, duplicate handling, escaping, defaults, and examples. |
| `pdmcli_execute` | Runs a complete PDMShell command in a persistent MCP session. |

## Verify the installed version

Ask Claude:

> Use `pdmshell_version` and show the installed PDMShell and MCP server versions.

For 4.0.51, `mcpVersion` and `pdmShellVersion` should both report `4.0.51.0`. The version is also supplied to Claude when the MCP connection is initialized.

## Discover commands and parameters

Claude can inspect the implementation-derived command catalog before constructing a command. For example:

> List the available PDMShell commands, then describe every parameter for the `search` command.

> Explain the PDMShell search-expression grammar and give me an example that finds checked-out SOLIDWORKS part files by a PDM variable value.

The discovery tools allow Claude to reason about the installed PDMShell command surface instead of relying on a fixed prompt or a separately maintained command list.

## Run a vault command

Command execution uses a persistent session, so Claude can log in and then run subsequent commands against the same vault and current directory. A typical workflow is:

1. Call `pdmcli_list_vaults` to identify an available vault view.
2. Inspect the `login` command with `pdmcli_describe_command`.
3. Run the login command through `pdmcli_execute`.
4. Inspect the intended operation and parameters before running it.

Commands executed through MCP can modify PDM data. Review generated commands before approving destructive or broad operations.

## Troubleshooting

- Restart Claude Desktop after installing or updating PDMShell.
- Confirm that `pdmshell` appears in Claude Desktop's MCP integrations.
- Ask Claude to call `pdmshell_version`; this works without a vault login and confirms that the server can start.
- Use `pdmcli_list_vaults` to verify that the current Windows user has a local PDM vault view.
- If a vault command fails, log in to the required vault before retrying it.

See [Installation](howtoinstall.md), [Machine License](machine-license.md), [Advanced Search](advancedsearch.md), and the [Command Reference](COMMANDS.md) for related guidance.
