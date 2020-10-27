# Study Notes
===


#### Static ip must be used in DC. Otherwise, resolv.conf setting may becorrupted.<br>
Static ipr must be used in DC. Otherwise, resolv.conf setting may be corrupted.<br>
https://wiki.debian.org/NetworkConfiguration#Configuring_the_interface_manually

#### Network interfaces
Currently, the installation of DebianDC, assumes that there is only one network interface on the server.
For this reason, if there is more than one network interface for now, server-setup will cause problems.
(We will deal with this in the first future.)

### Samba Active Directory

#### samba-tool and `domain provision` parameter

- domain provision <br>
Creates the Active Directory database.
Creates the first AD records. For example: Administrator user account
It creates the necessary DNS entries for the AD environment.

- --use-rfc2307 (enables the NIS extensions) <br>
This parameter allows the AD database to hold Unix attributes.<br>
These;<br>
  - user IDs (UID)
  - home directory paths
  - group IDs (GID)

- --realm <br>
It is the name of AD DNS Domain and it is expressed in capital letters. (EXAMPLE.COM, KURUM.LOC)

- --domain <br>
NetBIOS domain name (WORKGROUP)
It can be anything. It should consist of only one word.
The first part of AD DNS Domain is usually used for this value. (EXAMPLE,KURUM)

- --server-role <br>
Installs the DC role of the AD DNS environment.

- --dns-backend <br>
It is the DNS side of the AD DNS environment.
When AD DNS environment is installed for the first time, the machine that takes the DC role should be determined by setting DNS.

- --adminpass <br>
Sets the password for the administrator of the AD environment.
The provisioning will fail if the password is not complex enough.

### AD DNS backend
BIND9_DLZ DNS environment was used in DebianDC. (--dns-backend=BIND9_DLZ)

#### BIND9 DLZ
- /var/lib/samba/private/dns_update_list <br>
Server ip address is entered in this file.

- /etc/default/bind9
the content is as follows.<br>
```
RESOLVCONF=no
OPTIONS="-u bind -4"
```
- /etc/bind/named.conf.options

### Kerberos Configuration
Kerberos is used in the AD environment to authenticate users, machines and services.<br>
During the domain provision process Samba creates a Kerberos configuration file.<br>
During the installation, the Kerberos file is created for DC.<br>
We can copy this to the operating system by copying it to the / etc directory.<br>
```bash
cp /var/lib/samba/private/krb5.conf /etc/krb5.conf
```