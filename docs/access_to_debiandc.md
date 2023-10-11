## 2. Access to DebianDC Host
DebianDC is configured with XRDP for remote desktop access support.<br>
Remote desktop access can be made with any RDP client.<br>
www.xrdp.org
### 2.1 Remote Desktop Access
#### 2.1.1 From Linux
```
xfreerdp /w:1366 /h:768 /v:DebianDC_Server:3389
```
![alt text](screenshots/handbook/xrdp-login1.png "XRDP Login Screen")

#### 2.1.2 From Windows

![alt text](screenshots/handbook/rdp_fromwindows1.png "Windows RDP Screen")

#### 2.2 SSH
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
