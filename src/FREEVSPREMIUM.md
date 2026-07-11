---
description: Comparison between the Free and Premium versions of PDMShell.
title: PDMShell Free vs Premium | SOLIDWORKS PDM
---

# PDMShell Free vs Premium

PDMShell is available as a Free edition for evaluation and lightweight work, and a Premium edition for production automation in SOLIDWORKS PDM.

---

## Overview

| Edition | Description |
|----------|--------------|
| Free | Best for evaluation, quick validation, and small command-line jobs. |
| Premium | Best for production automation, unlimited scripting, workflow integration, and PDMShell add-in deployment. |

---

## Feature Comparison

| Feature | Free | Premium |
|----------|------|----------|
| `search` result limit | 5 items | Unlimited |
| `runscript` script length | 5 lines | Unlimited |
| Command-line use | Yes, with Free limits | Yes, without Free limits |
| Source and CSV workflows | Limited by Free limits | Yes |
| Workflow transitions | No | Yes |
| PDMShell add-in | No | Yes |
| Automation scripting | Yes, limited to 5 script lines | Yes, unlimited |
| Visual workflow building | Yes, limited by execution limits | Yes |
| Priority support | No | Yes |
| Commercial use | Yes, non-resellers only | Yes |
| Reseller use | No | Yes |
| Cost | Free | Seat-based annual pricing |

---

## Free Edition

Use the Free edition when you want to evaluate PDMShell, test command syntax, or run small command-line tasks.

Free edition limits:

- [`search`](SEARCH.md) returns up to 5 items.
- [`runscript`](RUNSCRIPT.md) runs scripts up to 5 lines.
- The PDMShell add-in is not included.
- Production automation, large batch work, and customer service work require Premium or a separate licensing agreement.

> [!NOTE]
> The [PDMShell add-in](TASKSCRIPT.md) is available only with PDMShell Premium. The Free edition can run supported command-line features within its limits, but it does not include the PDM add-in, right-click menu scripts, event trigger points, add-in permissions, or add-in conditions.

> [!WARNING]
> If you are a reseller, VAR, consultant, or service partner, you cannot use PDMShell to perform customer migrations, vault cleanup, batch automation, or paid customer services unless your license agreement explicitly allows it. Contact Blue Byte Systems Inc for special licensing permission.

## Premium Edition

Use Premium when PDMShell is part of a production automation workflow.

Premium includes:

- Unlimited search results.
- Unlimited script execution.
- Workflow and transition automation.
- PDMShell add-in access.
- Right-click menu scripts and event trigger points.
- License options for single workstations or shared vault access.

## Premium Licensing Options

Premium is seat-based. A seat can be activated for one standalone machine, or managed through the PDM add-in when you want pooled vault access.

| Option | Activation location | Best for | How it works |
| --- | --- | --- | --- |
| Single machine | Standalone PDMShell application installed on the workstation | One workstation or one administrator | The license is activated on that computer and used by PDMShell on that machine. |
| License pool | PDMShell add-in license manager in the SOLIDWORKS PDM Administration Tool | Teams using the PDMShell add-in from a shared PDM vault | License keys are managed from the vault, and users borrow available seats when running add-in automation. |

Use a [Machine License](machine-license.md) when PDMShell is mainly used from one licensed workstation. Use a [License Pool](license-pool.md) when multiple users need shared access through the PDMShell add-in.

## Premium Pricing

Current listed Premium pricing is seat-based:

| Seats | Price per seat |
| --- | --- |
| 1-3 | US$999/year |
| 4-7 | US$749/year |
| 8+ | US$499/year |

The total recurring price is calculated from the number of seats selected and the active price-per-seat tier. For current checkout pricing, visit [PDMShell Premium](https://bluebyte.biz/product/pdmshell).

> [!TIP]
> If your team wants help planning, developing, or deploying PDMShell automation, Blue Byte Systems offers [Enterprise Support Services](https://bluebyte.biz/product/enterprise-support-services/).

## Buy Premium

To buy a Premium PDMShell license, visit [PDMShell Premium](https://bluebyte.biz/product/pdmshell).
