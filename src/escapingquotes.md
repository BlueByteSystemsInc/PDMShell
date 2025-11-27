---
description: Learn how to properly escape quotes when calling PDMShell from cmd.exe, Dispatch, or inside a PDMShell session.
title: Quote Escaping Rules for PDMShell | SOLIDWORKS PDM
---

### When calling from **command line (cmd.exe or Dispatch):**
---
#### Example 1:
![escapequotescommandline](../images/escapequotecommandline.png)

Using `\"` in `cmd.exe` will actually produce " in the PDMShell session:

```bash
pdmcli.exe /single help -command \"checkout\" 
# This runs the command: help -command "checkout" (See above)
```

#### Example 2:

Using `\\\""` in `cmd.exe` will actually produce `\"` in the PDMShell session command box which in turn gets evaluated as `"` once executed:

![escapequotescommandline](../images/escapequotecommandline_1.png)
```bash
pdmcli.exe /single setvar -filePath membrane.sldprt -variableName Description -value \" 1 \\\"" 3\"
```

will produce:

```bash
# >setvar -filePath membrane.sldprt -variableName Description -value "1 \" 3"
# >@: Set Description to 1 " 3
# \" in PDMShell session evaluates to "
```




### When calling from **PDMShell regular session:**
---
To escape `"`, use this `\"`:
```bash
setvar -filePath membrane.sldprt -VariableName Description -value "3/1"
# @: Set Description to 3/1
setvar -filePath membrane.sldprt -VariableName Description -value "3/\"1"
# @: Set Description to 3/"1
# \" escape " in a regular session
```
