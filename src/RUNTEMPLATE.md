---
description: Runs a SOLIDWORKS PDM template by template menu name.
title: RUNTEMPLATE Command Documentation | PDMShell | SOLIDWORKS PDM
---

# RUNTEMPLATE Command Documentation

## DESCRIPTION

Runs a SOLIDWORKS PDM template from PDMShell by using the template menu name.

The `runtemplate` command is useful when you want to start a configured PDM template from a script or command line workflow. The command runs the template in the current vault folder unless a different vault folder is provided.

## SYNTAX

```bash
runtemplate -name template_menu_name [-directory vault_folder]
```

Short format:

```bash
runtemplate -name template_menu_name [-d vault_folder]
```

## PARAMETERS

- `name` Required. Template menu name to run. This is the same name shown for the template command in SOLIDWORKS PDM.
- `directory` Optional. Vault folder where the template should run. If omitted, the current PDMShell folder is used.
- `d` Optional short name for `directory`.

## EXAMPLES

```bash
# Run a template in the current folder
runtemplate -name "New Project"

# Run a template in a specific vault folder
runtemplate -name "New Project" -directory "Projects"

# Same command using the short directory parameter
runtemplate -name "New Project" -d "Projects"
```

## REMARKS

- The template name must match the template menu string configured in SOLIDWORKS PDM.
- The command uses the current vault session.
- If `directory` is relative, it is resolved from the current PDMShell folder.
- The template must be installed and available in the selected vault.
