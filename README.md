# DebianDC
Debian Domain Controller and Samba AD Manager<br>
DebianDC provides a Domain Controller installation and <i>graphical interface manage environment</i> for Samba Active Directory.<br>
DebianDC installs a graphical interface called AD-Manager and manages the Active Directory environment with zenity screens.<br>

## Features
- Domain and Domain Controller setup
- User Management
- Group Management
- DNS Management (Samba Internal DNS)

## Requirements
desktop environment (mate,lxde etc.)<br>
*This work has been done on Debian distribution. (Debian10 buster)

## Installation and Usage
```sh
$ wget https://raw.githubusercontent.com/eesmer/DebianDC/blob/master/debiandc-installer.sh
$ bash debiandc-installer.sh
```
Use DebianDC and AD-Manager with root user
#### DC Setup
Run the server-setup command from the terminal screen
```sh
$ server-setup
```
#### AD-Manager
Run the manager command from the terminal screen
```sh
$ manager
```
