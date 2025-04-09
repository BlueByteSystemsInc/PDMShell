# LOGIN Command Documentation

## DESCRIPTION:
Authenticates a user to a specified vault.


## SYNTAX:
```bash
login [-auto|-win|-external] -username <username> -password <password> -vaultname <vault_name>
```

## PARAMETERS:
Auto: Automatic authentication with current user. Displays login dialog box if not logged in.

win: Automatic Windows authentication with current user. Does not display login dialog box.

External: Toggle ensures that a license is consumed.

Username:  Username.

Password:  Password.

vaultName: Vault Name.

## EXAMPLES:
```bash
login -username admin -password "password" -vaultName "bluebyte"
```

# REMARKS: 
The `external` parameter allows an application that is not supplied and supported by SOLIDWORKS Corporation to:
- Log into SOLIDWORKS PDM Professional
- Log into a vault view