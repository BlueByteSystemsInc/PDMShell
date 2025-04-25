# CLEARCACHE Command Documentation

## DESCRIPTION:
Clears the local cache of a folder or many files.

## SYNTAX:
```bash
clearcache -directory -search -toolboxflag -source
```

## PARAMETERS:
- `-directory`: The directory to clear the local cache of.
- `-search`: Search query.
- `-toolboxflag`: Ignore toolbox files.
- `-source`: CSV files containing complete local file paths to clear. First row is header.

## EXAMPLES:
```bash
clearcache -search "*.sldprt"
# Clears the cache of all `.sldprt` files in the current directory.

clearcache -directory project -toolboxflag
# Clears the directory called project whiling ignore toolbox files.

clearcache -source "source.csv"
# Clears the cache for the specified source.
```
