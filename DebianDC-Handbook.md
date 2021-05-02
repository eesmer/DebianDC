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
---

### 1. Installation

You can use the DebianDC application in two ways.
#### 1.1- Installing DebianDC on the ready Debian installation
This setup; It is made from the DebianDC repository to the existing Debian installed machine.

As the `root`: <ins>Unless otherwise stated, perform operations as root user.!!</ins>

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

Either way, after the installation is complete
By logging in from the login screen (with the root password specified during the installation)
or

```bash
ssh -X -p40022 root@DEBIANDC_IP_ADDRESS
run the 'manager' command
manager
```
can be used in the form.

**You can download the abc.iso file from this link.**
https://sourceforge.net/projects/debiandc/files/latest/download

### 2. DebianDC-Manager
After the installation is complete
You can log in with the root user you specified during the installation.

![alt text](screenshots/login1.png "DebianDC Login")

You can access the Manager application from the opened DebianDC desktop environment.
![alt text](screenshots/Desktop_menu1.png "DebianDC Manager Menu")
![alt text](screenshots/Desktop_folder1.png "DebianDC Manager Menu")

#### 2.1- DebianDC-Manager Screen
After the DebianDC desktop installation, the Active Directory role must be installed.
When you open the Manager application, a menu will open with setup and configuration options if Active Directory Role is not installed.

![alt text](screenshots/1-Manager_MainMenu1.png "Manager Main Menu")

`Important Notice`: <ins> You must give a fixed IP to the DC machine. </ins>

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



