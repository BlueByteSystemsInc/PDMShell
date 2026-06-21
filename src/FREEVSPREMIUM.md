---
description: Comparison between the Free and Premium versions of PDMShell.
title: PDMShell Free vs Premium | SOLIDWORKS PDM
---

# PDMShell Free vs Premium

PDMShell comes in two editions: **Free** for light use and **Premium** for full automation in SOLIDWORKS PDM.

---

## Overview

| Edition | Description |
|----------|--------------|
| **Free** | Ideal for testing and small jobs. `search` returns up to **5 items**, and `runscript` runs scripts up to **5 lines**. |
| **Premium** | Full access with **unlimited search results**, unlimited scripting, workflow automation, and the PDMShell add-in. |

---

## Feature Comparison

| Feature | Free | Premium |
|----------|------|----------|
| `search` result limit | 5 items | Unlimited |
| `runscript` script length | 5 lines | Unlimited |
| All `search` commands | Yes, limited to 5 results | Yes, unlimited |
| `printfromsource`, `getvar` | Yes | Yes, unlimited |
| Workflow & transitions | No | Yes |
| PDMShell add-in | No | Yes |
| Automation scripting | Yes, limited to 5 script lines | Yes, unlimited |
| Alias & renaming | Yes | Yes |
| Priority support | No | Full |
| Commercial use | Yes, non-resellers only | Yes |
| Reseller use | No | Yes |
| Cost | Free | Paid |

---

## Free Edition

Perfect for evaluation, quick lookups, and validation tasks.  
**Limits:** [`search`](SEARCH.md) returns up to 5 items, and [`runscript`](RUNSCRIPT.md) runs scripts up to 5 lines.  
**Note:** Resellers, VARs, and service partners may not use PDMShell to perform migration, cleanup, or automation work for customers without special licensing permission from Blue Byte Systems Inc.

> [!NOTE]
> The [PDMShell add-in](TASKSCRIPT.md) is available only with **PDMShell Premium**. The Free edition can run supported command-line features within its limits, but it does not include the PDM add-in, right-click menu scripts, event trigger points, add-in permissions, or add-in conditions.

> [!WARNING]
> If you are a reseller, VAR, consultant, or service partner, you cannot use PDMShell to perform customer migrations, vault cleanup, batch automation, or paid customer services unless your license agreement explicitly allows it. Contact Blue Byte Systems Inc for special licensing permission.

**Example:**
```bash
printfromsource -filePath "source.csv" -csv "output.csv"
```

## Buy Premium

To buy a Premium PDMShell license, visit:
http://bluebyte.biz/product/pdmshell
