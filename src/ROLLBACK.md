---
title: rollback Command | PDMShell
description: Preview and permanently roll a checked-in SOLIDWORKS PDM file back to an earlier version, date, or revision.
keywords: PDMShell rollback command, SOLIDWORKS PDM rollback, rollback file version
---

# `rollback` command

Previews or permanently rolls a checked-in PDM file back to an earlier version. You can select the target by version number, previous version, date, or revision name.

>[!WARNING]
> Rollback permanently deletes every file version after the selected target, including associated file and data-card data. It cannot be undone without restoring the vault database and archives from backup.

The command previews the result by default. It does not change the file unless you add `-confirm`.

## Requirements

- PDMShell Premium
- SOLIDWORKS PDM Professional 2017 or newer
- The file must be checked in
- The current user must have Rollback permission
- The selected rollback point must not be cold-stored

## Syntax

```text
rollback -filePath file_path
         (-version number | -previous | -before date | -revision name)
         [-comment text]
         [-deleteParentReferences]
         [-confirm]
```

Specify exactly one target selector.

## Target selectors

| Parameter | Short name | Description |
| --- | --- | --- |
| `-version` | `-ver` | Retains this exact earlier PDM version. |
| `-previous` | `-prev` | Retains the version immediately before the current version. |
| `-before` | `-before` | Retains the newest version created before the supplied local date and time. |
| `-revision` | `-rev` | Retains the newest earlier version carrying this revision name. |

ISO 8601 dates are recommended:

```text
2026-07-01
2026-07-01T17:30:00-07:00
```

A date without a time means the start of that date in local time.

## Other parameters

| Parameter | Description |
| --- | --- |
| `-filePath` | Checked-in PDM file to roll back. Absolute and relative paths are supported. |
| `-comment` | Comment stored with the rollback. Defaults to `Rollback performed by PDMShell`. |
| `-deleteParentReferences` | Deletes affected parent references instead of redirecting them to the retained version. Use with care. |
| `-confirm` | Performs the permanent rollback after showing the resolved target. Without it, the command is preview-only. |

Parent references are redirected to the retained version by default.

## Preview a rollback

```text
rollback -filePath "Part.sldprt" -previous
```

The preview reports:

```text
ROLLBACK PREVIEW - no changes were made
Current version: 18
Rollback target: 17
Versions permanently deleted: 18-18
Parent references: redirect to the retained version
```

## Perform a rollback

After reviewing the preview, repeat the command with `-confirm`:

```text
rollback -filePath "Part.sldprt" -previous -comment "Incorrect release" -confirm
```

Additional examples:

```text
rollback -filePath "Part.sldprt" -version 12
rollback -filePath "Part.sldprt" -before "2026-07-01"
rollback -filePath "Part.sldprt" -revision "B"
```

Do not use `-deleteParentReferences` unless you intentionally want to remove references from parent versions to the versions being deleted.
