# DebianDC-Handbook / User Guide

The document contains detailed information about the use for the DebianDC Active Directory Domain Environment GUI.

- [1. Installation](#1-installation)
  - 1.1 Installing DebianDC on the ready Debian installation
  - 1.2 Installing DebianDC with DebianDC-buster-installer.iso
- [2. Access to DebianDC Host](#2-access-to-debiandc-host)
  - 2.1 Remote Desktop Access
    - 2.1.1 from Linux
    - 2.1.2 from Windows
  - 2.2 SSH
- [3. DebianDC Manager](#3-debiandc-manager)
  - 3.1 DebianDC-Manager Screen
    - 3.1.1 Static ip Assignment
    - 3.1.2 Setting up the Active Directory role
    - 3.1.3 Using the Manager application after domain setup
      - 3.1.3.1 User Management
      - 3.1.3.2 Group Management
      - 3.1.3.3 OU Management
      - 3.1.3.4 Computer Management
      - 3.1.3.5 DNS Management
      - 3.1.3.6 Domain Operations
      - 3.1.3.7 Active Directory Settings
 - [4. DebianDC Host Management](#4-debiandc-host_management)
      - 4.1 Manage Windows Host
 - [5. Usage Scenarios / Best Practies](#5-scenarios-practies)
 - [6. FAQ](#4-faq)
---
## 4. DebianDC-Host_Management
Host machines can be managed from this menu.<br>
The purpose of this screen; is to try to make daily work from central point.

### 4.1 Windows Host Management
DebianDC accesses the Windows machine with ansible and winrm.<br>
To use this feature on a Windows machine, the following steps are required.<br>
<br>
**download:** https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1 <br>
save this .ps1 content to the Administrator desktop on the Windows machine
Example filename: debiandc_config.ps1<br>
**run:** Then you can run it from the powershell screen.
```
PS C:\Users\Administrator> cd .\Desktop\
PS C:\Users\Administrator\Desktop> powershell.exe .\debiandc_config.ps1
```
**control:** in the powershell screen
```
winrm enumerate winrm/config/Listener
```
in the output of the command;<br>
It should be seen that the HTTP:5985 and HTTPS:5986 ports are in listening mode.<br>
<br>
After these processes, you can use the Windows host machine over DebianDC.<br>
You can use a special user account or Administrator account for access with winrm.
<br>
<br>
![alt text](screenshots/handbook/manage_windows_host-1.png "DebianDC Manage Windows")
<br>
<br>
### use of Ping Action
![alt text](screenshots/handbook/manage_windows_host-2_ping.png "DebianDC Manage Windows Host ping action")
![alt text](screenshots/handbook/manage_windows_host-3_ping.png "DebianDC Manage Windows Host access for ping action")
![alt text](screenshots/handbook/manage_windows_host-4_ping_result.png "DebianDC Manage Windows Host result of ping action")
