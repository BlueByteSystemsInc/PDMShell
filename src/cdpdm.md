# Continuous Delivery

> [!Video https://www.loom.com/embed/0caf90c77d4344cab8d88b0d318d6dcf?sid=ecf596af-8fe9-460c-9177-a568db909600]


CDPDM is a PDM add-in by Blue Byte Systems Inc. that facilitates the deployment of PDM and task add-ins developed for you.

The add-in communicates with our servers and allows the installation and uninstallation of all versions of your PDM add-ins.

## Advantages

The advantages of using CDPDM are numerous:

- ✔️ No need to ask for or download CEX files.
- ✔️ Ability to switch between versions.
- ✔️ The conventional process of installing and updating add-ins is very tedious and time-consuming.

## Where to Find CDPDM

### If we have a developed a custom solution for you:

- CDPDM is provided in your project onboarding email.
- The email contains:
  - Link to the CEX file.
  - Link to this page with installation instructions.
  - Link to your Customer Configuration File.


### If you have purchased a PDM product from us:

- Your Blue Byte Systems Inc account has all the information you need. You can access your account from this link [here](https://bluebyte.biz/account).
- From the Downloads tab, please download the archive file that contains `CDPDM.cex` and the Customer Configuration File.

>[!NOTE]
> If you have purchased one of our PDM products and have had us develop a custom solution for you, please reach to us so we can generate a Customer Configuration File that lets you access all of your assets.

## How to Install

- Locate `CDPDM.cex`.
- In Windows 11, 10, and 7, internet downloads are blocked. Right-click on the CEX file, go to Properties, check Unblock, then click Apply and OK.
- Open the Administration tool.
- Log in to the vault. Please ensure you use a PDM user with Edit Add-Ins permission.
- In the Administration tool, click File > Open and browse to the `CDPDM.cex` file.
- Drag and drop the add-in from the CEX window onto the Add-ins node and wait for a few moments for CDPDM to be installed.

![CDPDM Installation](../images/cdpdm.png)

## Configuration

- Locate your Customer Configuration File.
- You can upload the Customer Configuration File via the Administration tool. 
- Right-click on the add-in and click Upload Customer Configuration File...
- Browse to the Customer Configuration File.


![CDPDM Menu](../images/cdpdm_menu.png)

>[!NOTE]
> You can configure the settings of CDPDM by adding the credentials of the Customer Configuration File manually. Contact support for help.


## Updating Add-ins

- Right-click on CDPDM under Add-ins in the Administration tool and click Update Add-ins...
- This process may take a few moments depending on how many add-ins are in your vault.
- You will be prompted with a window like the following:

![CDPDM Update](../images/cdpdm_updateaddins.png)

You can:

- Install the selected add-in from the list. From the *Version To Install* dropdown, you can select which version to install and make sure to check the add-in.
- Uninstall the selected add-in from the vault (if it is installed).

The installation process will ask you if you want to restart PDM. This may be beneficial to do after every upgrade, especially if you're validating a feature.

>[!NOTE]
> Please allow for a few moments after you click Install/Update. The add-in will be downloaded unblocked and added to the vault. This operation includes suppressing some PDM dialog boxes.