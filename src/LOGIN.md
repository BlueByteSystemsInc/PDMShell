# LOGIN Command Documentation

## DESCRIPTION:
Authenticates a user to a specified vault.

## SYNTAX:
login [-a|-win|-ex] -u username -p password -v vault_name

## PARAMETERS:
Auto -a  Automatic authentication with current user. Displays login dialog box if not logged in.

win -w  Automatic Windows authentication with current user. Does not display login dialog box.

External -ex Toggle ensures that a license is consumed.

Username -u  Username.

Password -p  Password.

vaultName -v  Vault Name.

## EXAMPLES:
login -u admin -p "password" -v "bluebyte"
