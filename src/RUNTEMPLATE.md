---
description: Runs a SOLIDWORKS PDM template by template menu name.
title: runtemplate Command | PDMShell | SOLIDWORKS PDM
---
# runtemplate
## Description
Runs a SOLIDWORKS PDM template from PDMShell by using the template menu name.

The `runtemplate` command is useful when you want to start a configured PDM template from a script or command line workflow. The command runs the template in the current vault folder unless a different vault folder is provided.

## Syntax
```bash
runtemplate -name template_menu_name [-directory vault_folder] [-silent]
```

Short format:

```bash
runtemplate -name template_menu_name [-d vault_folder] [-silent]
```

## Parameters
- `name` Required. Template menu name to run. This is the same name shown for the template command in SOLIDWORKS PDM.
- `directory` Optional. Vault folder where the template should run. If omitted, the current PDMShell folder is used.
- `d` Optional short name for `directory`.
- `silent` Optional. Automatically confirms the template creation dialog when possible.

## Examples
```bash
# runtemplate
runtemplate -name "New Project"

# runtemplate
runtemplate -name "New Project" -directory "Projects"

# runtemplate
runtemplate -name "New Project" -d "Projects"

# runtemplate
runtemplate -name "Create ECO" -d "Engineering Change Orders" -silent
```

## Remarks
- The template name must match the template menu string configured in SOLIDWORKS PDM.
- The command uses the current vault session.
- If `directory` is relative, it is resolved from the current PDMShell folder.
- The template must be installed and available in the selected vault.
- Use `silent` only when the template can be created without entering additional information.

## Availability
Available since PDMShell 4.0.0.

## Last Updated
Updated in PDMShell 4.0.16 to improve `silent` confirmation for template creation dialogs.
