---
description: Authenticates a user to a specified vault.
title: LOGIN Command Documentation | PDMShell | SOLIDWORKS PDM
---
# LOGIN Command Documentation

## DESCRIPTION:
Authenticates a user to a specified vault.


## SYNTAX:
```bash
login [-auto|-win -username -password|-external -username -password ] -vaultname 
```

## PARAMETERS:
`Auto`: Automatic authentication with current user. Displays login dialog box if not logged in.

`Win`: Automatic Windows authentication with current user. Does not display login dialog box.

`External`: Toggle ensures that a license is consumed.

`Username`:  Username.

`Password`:  Password.

`vaultName`: Vault Name.

## EXAMPLES:
```bash
login -username admin -password ******** -vaultName bluebyte #logs into the bluebyte vault with a username ans a password
login -auto -vaultName bluebyte #logs into the blue byte vault using the existing PDM session
```

# REMARKS: 

- You must have a local vault view before you can start using PDMShell.
- The `external` parameter allows an application that is not supplied and supported by SOLIDWORKS Corporation to:
  - Log into SOLIDWORKS PDM Professional
  - Log into a vault view


## TUTORIAL:
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/login.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>