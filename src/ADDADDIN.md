# ADDADDIN Command Documentation

## DESCRIPTION:
Adds an addin to the logged-in vault. Overrides any existing version.

## SYNTAX:
addaddin -add <addin_name> [-force]

## PARAMETERS:
addin_name - The name of the addin to be added.
-force - Forces the addin to be added even if it already exists.

## EXAMPLES:
addaddin -add 'MyAddin' -force
