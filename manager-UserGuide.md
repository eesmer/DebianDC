# Manager Interface
It is a graphical interface used with the manager command after installation.<br>
Until the Active Directory role is installed, the server management menu (Server Manager) will be active.<br>
After installing the Active Directory role, Active Directory management menus are used.<br>
<br>
You can continue reading the document for details.

## Server configuration and Active Directory setup with Manager
![alt text](screenshots/1-server_manager.png "DebianDC Server Menu")

## Set static IP
DebianDC recommends configuring static IP.<br>
Because if the DebianDC IP address changes after the domain setup, the Active Directory environment will not work properly.<br>
For this reason, it is necessary to give a fixed IP Address to the DebianDC machine using this menu.<br>
![alt text](screenshots/2-set_static_ip.png "Set Static IP")

## Install Active Directory Role
You can install the Domain and Active Directory environment by using the Install Active Directory Role menu.<br>
This process asks the server a new name, Domain Name, Domain Administrator password respectively.<br>
![alt text](screenshots/3-install_ad-1.png "Install AD")<br>
![alt text](screenshots/4-install_ad-2.png "Install AD")
![alt text](screenshots/5-install_ad-3.png "Install AD")
![alt text](screenshots/6-install_ad-4.png "Install AD")<br>
![alt text](screenshots/8-install_ad-6.png "Install AD")

## Manager Main Menu
The Manager Screen that you run with the manager command will display the management menus since the Active Directory role is installed.<br>
If the Kerberos ticket is not available, the Administrator creates it by asking for the password and opens the manager screen.<br>
![alt text](screenshots/9-manager_main_menu.png "Manager Main Menu")
