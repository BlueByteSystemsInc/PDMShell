---
description: Builds a recursive where-used tree for one file or files found by search.
title: WHEREUSEDTREE Command Documentation | PDMShell | SOLIDWORKS PDM
---

# WHEREUSEDTREE Command Documentation

## DESCRIPTION:
The `whereusedtree` command builds a recursive where-used tree for one file or for each file found by a search in the current directory.

Use this when you need to see not only the direct parents of a file, but also the parents of those parents.

The command prints a tree in the session output and can optionally export the results to CSV.

---

## SYNTAX:

```bash
whereusedtree (-filePath <path> | -search <query>) [-depth <number>] [-csv <file.csv>]
```

---

## PARAMETERS:

- `filePath`
  Full or relative path of the file to evaluate. Use either `-filePath` or `-search`, not both.

- `search`
  Search query used to find files in the current directory. Use either `-search` or `-filePath`, not both.

- `depth`
  Optional maximum number of parent levels to traverse. Defaults to `10`.

- `csv`
  Optional CSV output file. Include the `.csv` extension.

---

## EXAMPLES:

### Example 1: Recursive Where Used For One File

```bash
whereusedtree -filePath "C:\Vault\Parts\Bracket.SLDPRT"
```

### Example 2: Limit The Tree Depth

```bash
whereusedtree -filePath "C:\Vault\Parts\Bracket.SLDPRT" -depth 3
```

### Example 3: Run Against Files Found In The Current Directory

```bash
whereusedtree -search "%.SLDPRT"
```

### Example 4: Export To CSV

```bash
whereusedtree -search "%.SLDASM" -depth 5 -csv whereusedtree.csv
```

The CSV includes:

- RootFileID
- RootFileName
- RootFolderPath
- ChildFileID
- ChildFileName
- ParentFileID
- ParentFileName
- ParentFolderPath
- Level
- Chain
- Circular

---

## REMARKS:

- `-filePath` and `-search` are mutually exclusive. You must specify exactly one.
- `-search` is scoped to the current PDMShell directory.
- Circular parent chains are detected and marked as `Circular` in CSV output.
