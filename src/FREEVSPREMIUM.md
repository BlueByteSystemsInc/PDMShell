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
| **Premium** | Full access with **unlimited search results**, unlimited scripting, and workflow automation. |

---

## Feature Comparison

| Feature | Free | Premium |
|----------|------|----------|
| `search` result limit | 5 items | Unlimited |
| `runscript` script length | 5 lines | Unlimited |
| All `search` commands | Yes, limited to 5 results | Yes, unlimited |
| `printfromsource`, `getvar` | Yes | Yes, unlimited |
| Workflow & transitions | No | Yes |
| Automation scripting | Yes, limited to 5 script lines | Yes, unlimited |
| Alias & renaming | Yes | Yes |
| Priority support | No | Full |
| Commercial use | Yes, non-resellers only | Yes |
| Reseller use | No | Yes |
| Cost | Free | Paid |

---

## Free Edition

Perfect for evaluation, quick lookups, and validation tasks.  
**Limits:** `search` returns up to 5 items, and `runscript` runs scripts up to 5 lines.  
**Note:** Resellers and VARs may not use the Free version commercially.

**Example:**
```bash
printfromsource -filePath "source.csv" -csv "output.csv"
```

## Buy Premium

To buy a Premium PDMShell license, visit:
http://bluebyte.biz/product/pdmshell
