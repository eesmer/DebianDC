## DebianDC-Handbook / User Guide

The document contains detailed information about the use for the DebianDC Active Directory Domain Environment GUI.

- [1. Installation](#1-installation)
  - 1.1 Installing DebianDC on the ready Debian installation
  - 1.2 Installing DebianDC with DebianDC-buster-installer.iso
- [2. DebianDC-Manager](#2-debiandc-manager)
  - 2.1 DebianDC-Manager Screen
    - 2.1.1 Static ip Assignment
    - 2.1.2 Setting up the Active Directory role
    - 2.1.3 Using the Manager application after domain setup
      - 2.1.3.1 User Management
      - 2.1.3.2 Group Management
      - 2.1.3.3 OU Management
      - 2.1.3.4 Computer Management
      - 2.1.3.5 DNS Management
      - 2.1.3.6 Domain Operations
      - 2.1.3.7 Active Directory Settings
 - [3. Usage Scenarios / Best Practies](#3-scenarios-practies)
 - [4. FAQ](#4-faq)
---

### 1. Installation

You can use the DebianDC application in two ways.
#### 1.1- Installing DebianDC on the ready Debian installation <br>
For fresh Debian installation: https://www.debian.org/distrib/
<br>
This setup; It is made from the DebianDC repository to the existing Debian installed machine.

As the `root`: <ins>perform operations as root user.!!</ins>

```bash
# wget https://raw.githubusercontent.com/eesmer/DebianDC/master/debiandc-installer.sh
# bash debiandc-installer.sh
```
**If a desktop environment is not installed in the system, the DebianDC installation installs the lxde-core desktop environment.**

#### 1.2- Installing DebianDC with DebianDC-buster-installer.iso
This installation is done automatically from the installer.iso file.
Auto install creates shortcuts for lxde-core desktop and DebianDC-Manager application on Debian distribution.
To install, it is sufficient to attach the installer.iso file to the machine.
The setup itself will do the rest.

**You can download the debiandc_buster_installer.iso file from this link.**<br>
https://sourceforge.net/projects/debiandc/files/latest/download
<br>

![alt text](screenshots/handbook/install-1.png "DebianDC Install")

The screen that started the installation.<br>
You can start the installation by pressing the enter button on this screen.

![alt text](screenshots/handbook/install-2.png "DebianDC Install")

You can continue by adjusting the location and keyboard settings.

![alt text](screenshots/handbook/install-3.png "DebianDC Install")

You can set a machine name

![alt text](screenshots/handbook/install-4.png "DebianDC Install")

The domain name is asked after the machine name.<br>
Leave this blank

![alt text](screenshots/handbook/install-5.png "DebianDC Install")

Set password for root user<br>
You will be logged into the system by this

![alt text](screenshots/handbook/install-6.png "DebianDC Install")

At this stage, the installation will start and then it will ask you to set the repo address for the package archive.

![alt text](screenshots/handbook/install-7.png "DebianDC Install")

You can make the best choice according to your location and continue.
The installation will then continue and complete without asking any further questions.
<br>

After the installation is complete
You can log in with the root user you specified during the installation.

![alt text](screenshots/login1.png "DebianDC Login")

or

```bash
ssh -X -p22 root@DEBIANDC_IP_ADDRESS (-p22 or the server's ssh access port)
run the 'manager' command
manager
```
can be used in the form.

### 2. DebianDC-Manager
You can access the Manager application from the opened DebianDC desktop environment.
![alt text](screenshots/Desktop_menu1.png "DebianDC Manager Menu")
![alt text](screenshots/Desktop_folder1.png "DebianDC Manager Menu")

#### 2.1- DebianDC-Manager Screen
After the DebianDC desktop installation, the Active Directory role must be installed.
When you open the Manager application, a menu will open with setup and configuration options if Active Directory Role is not installed.

![alt text](screenshots/1-Manager_MainMenu1.png "Manager Main Menu")

`Important Notice`: <ins> You must give a static IP to the DC machine. </ins>

##### 2.1.1- Static ip assignment
The IP address of the DC machine must be fixed.
Otherwise, the changed ip address later may cause the Active Directory role to not work.

![alt text](screenshots/2-set_static_ip-1.png "Manager Static ip assignment")
![alt text](screenshots/2-set_static_ip-2.png "Manager Static ip assignment")

DebianDC will prompt you to reboot for ip definition to take effect.

##### 2.1.2- Setting up the Active Directory role
Active Directory Role can be installed after fixed ip definition.
The installation of this role is done with the "Setup a New Domain" option from the same menu.

The process of installing the AD role;
It asks for the new name of the machine, the domain name to be installed, and the password of the Administrator user, respectively.

![alt text](screenshots/4-install_ad-2.png "Manager install AD Role")
![alt text](screenshots/5-install_ad-3.png "Manager install AD Role")
![alt text](screenshots/6-install_ad-4.png "Manager install AD Role")

After getting the information required to install the role, a screen will appear asking for confirmation for installation.
After the confirmation of this screen, the Active Directory role installation begins.

![alt text](screenshots/7-install_ad-5.png "Manager install AD Role")
<br>
![alt text](screenshots/8-install_ad-6.png "Manager install AD Role")

When the installation is complete, DebianDC will ask for a reboot.
After DebianDC restarts, you can log in with the root user and use the manager application.

Once the Domain setup is complete and DebianDC restarts, log in again.
You can now use the Manager application with its new menus.

![alt text](screenshots/login1.png "DebianDC Login")

#### 2.1.3 Using the Manager application after domain setup
The DebianDC-Manager application is used by obtaining a kerberos ticket.
For this reason, if you do not have a kerberos ticket, the Manager will ask you for the Administrator user password when opening the Kerberos ticket.
(Administrator password is the password you entered when setting up the domain.)
Thus, it can be used in menus that require Administrator password without entering a password.

##### 2.1.3.1 User Management
This screen is where Active Directory user management is done.

![alt text](screenshots/handbook/user-management-1.png "DebianDC User Management")

From this menu,
can create new users, user can delete, can determine the duration of stay active, can disable the use of the user account, <br>
can set new password or force password change, and you can get the list of the user accounts.
<br>
<br>
opening a new user account<br>
![alt text](screenshots/handbook/create-user-1.png "DebianDC User Management")
![alt text](screenshots/handbook/create-user-2.png "DebianDC User Management")
<br>
<br>
active directory user account list<br>
![alt text](screenshots/handbook/user-list-report-1.png "DebianDC User Management")

#### 2.1.3.2 Group Management
This screen is where Active Directory group management is done.

![alt text](screenshots/handbook/group-management-1.png "DebianDC Group Management")

From this menu
You can create a group, delete the group, add members to the group, remove the group, group list and member list report can be obtained.

#### 2.1.3.3 OU Management
This screen is where Active Directory organization unit management is done.

![alt text](screenshots/handbook/ou-management-1.png "DebianDC OU Management")

From this menu
You can create and delete organizational units, Members can be added to or removed from organizational units, OU list and OU member list report are created.

#### 2.1.3.4 Computer Management
This screen is where Active Directory Computer Management is done

From this menu
List of Domain Controller machines can be taken, A list of computer accounts that are members of the domain can be retrieved, Moving computer accounts between OUs
and the computer account can be removed.

![alt text](screenshots/handbook/computer-management-1.png "DebianDC Computer Management")

#### 2.1.3.5 DNS Management
This screen is where Active Directory DNS management is done.

From this menu
DNS Zone information can be obtained, DNS records can be added, deleted and updated

![alt text](screenshots/handbook/dns-management-1.png "DebianDC DNS Management")

#### 2.1.3.6 Domain Operations
This screen is where domain operations is done

There are 2 menus on this screen.
From the Domain Controller Operations screen; DC machine can be removed and dropped from the environment.
From the FSMO Operations screen; FSMO roles can be transferred to DC machines.

![alt text](screenshots/handbook/domain-operations-1.png "DebianDC Domain Operations") ![alt text](screenshots/handbook/domain-operations-2.png "DebianDC Domain Operations") 

The operations here will be covered in detail in the Sample Scenarios and Best Practies title.

#### 2.1.3.7 Active Directory Settings
This screen is where Active Directory settings is done

This menu
For user accounts; Password complexity, length, expiration time, etc. are set.

![alt text](screenshots/handbook/ad-settings-1.png "DebianDC Active Directory Settings")
