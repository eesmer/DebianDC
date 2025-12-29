## Access to DebianDC Host
DebianDC is configured with XRDP for remote desktop access support.<br>
Remote desktop access can be made with any RDP client.<br>
www.xrdp.org
### 1- Remote Desktop Access
#### From Linux
```
xfreerdp /u:root /p:$PASSWORD /w:1366 /h:768 /v:$DEBIANDC_SERVER:3389
```
![alt text](https://github.com/eesmer/DebianDC/blob/master/Documentation/assets/screenshots/handbook/xrdp-login1.png "XRDP Login Screen")

#### From Windows

![alt text](https://github.com/eesmer/DebianDC/blob/master/Documentation/assets/screenshots/handbook/rdp_fromwindows1.png "Windows RDP Screen")

### 2- SSH
```
ssh -p22 root@DebianDC_server
```
You can console access to the DebianDC server via SSH. <br>
You can use TUI as an alternative to DebianDC GUI. <br>
<br>

```
wget https://raw.githubusercontent.com/eesmer/sambad-tui/master/sambadtui.sh
```
```
bash sambadtui.sh
```
### 3- RSAT Tool for alternative GUI usage
You can connect to the Active Directory Domain environment with the Windows RSAT tool, which can be installed on some Windows versions. <br>
RSAT is the same as the Microsoft Active Directory usage screen. <br>
<br>

For example, the screenshot below is a screenshot of RSAT connected to the Samba Active Directory environment. <br>

![alt text](https://github.com/eesmer/DebianDC/blob/master/Documentation/assets/screenshots/handbook/rsat-screenshot1.png "RSAT Screen")

You can see the link below for details. <br>
https://wiki.samba.org/index.php/Installing_RSAT
<br>
<br>
[Documentation](https://github.com/eesmer/DebianDC/blob/master/Documentation/#guides)
