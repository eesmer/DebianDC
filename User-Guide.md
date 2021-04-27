## DebianDC User Guide

The document contains detailed information about the use for the DebianDC Active Directory Domain Environment GUI.

- [1. Installation](#1-installation)
  - 1.1 Installing DebianDC on the ready Debian installation
  - 1.2 Installing DebianDC with DebianDC-buster-installer.iso
- [2. Configuration](#2-configuration)
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

download link will be added

### 1. Configuration
After the installation is complete
You can log in with the root user you specified during the installation.

![alt text](screenshots/login1.png "DebianDC Login")

You can access the Manager application from the opened DebianDC desktop environment.
![alt text](screenshots/Desktop_menu1.png "DebianDC Manager Menu")
![alt text](screenshots/Desktop_folder1.png "DebianDC Manager Menu")

