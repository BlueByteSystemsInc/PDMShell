---
description: Search SOLIDWORKS PDM variables with PDMShell advanced search.
title: Variable Search | PDMShell | SOLIDWORKS PDM
---

# Variable Search

Conditions beginning with `@` search PDM variables.

```bash
@VariableName Operator Value
```

Examples:

```bash
@Description=Pump
@Weight>=10
@Revision!=A
@Material~Steel
@ProjectCode!~TEST
```

You can combine variable conditions with file-name and PDM search tokens. All conditions must match.

```bash
Name=%Pump%;@Description~Steel;StateName=Released;@Weight>=5
```

## Supported Operators

| Symbol | Meaning |
|--------|---------|
| = | Equal |
| != | Not equal |
| <> | Not equal |
| > | Greater than |
| < | Less than |
| >= | Greater than or equal |
| <= | Less than or equal |
| ~ | Contains |
| !~ | Does not contain |

## Operator Mapping

String variables use these operator mappings.

| Symbol | Enum |
|--------|------|
| = | Equals |
| != or <> | Different |
| > | Greater |
| < | Less |
| >= | Greater or equal |
| <= | Less or equal |
| ~ | Contains |
| !~ | Not contains |

Numeric and date variables use the corresponding numeric or date operator sets.

Dates must use `yyyyMMdd`.

```bash
@ApprovedDate>=20260101
```

## Operator Detection

Operators are detected longest-first to avoid ambiguity.

| Order | Operator |
|-------|----------|
| 1 | >= |
| 2 | <= |
| 3 | != |
| 4 | <> |
| 5 | !~ |
| 6 | ~ |
| 7 | > |
| 8 | < |
| 9 | = |

This prevents `>=` from being parsed as `>`.

## Invalid Input

Invalid expressions are ignored silently. PDMShell continues applying valid conditions.

Examples that may be ignored:

```bash
@MissingVar=Test
HistoryBefore=BADDATE
UnknownKey=Value
```

## Related Articles

- [Advanced search overview](advancedsearch.md)
- [Search tokens](search-tokens.md)
- [Result shaping](search-result-shaping.md)
