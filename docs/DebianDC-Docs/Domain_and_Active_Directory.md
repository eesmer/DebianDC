## About Domain Environment and General Concepts
Domain environment;<br>
It is a network environment where accounts, computers and other environment components are managed such as passwords and access.<br>
At least 1 Domain Controller is required for the domain environment. Domain Controller is the server computer on which the Active Directory application runs.<br>

## What is Active Directory?
Active Directory is a service that acts as a resource directory for network users.<br>
It stores network objects such as users, computers, printers, and presents them to network users.<br>
This service runs on the machine (Domain Controller) that has the DC role.<br>
Installing the DC role on a machine means installing the Active Directory service.<br>
Active Directory is the service that runs on the DC machine and runs the domain environment.<br>
<br>
The machine, which acquires the DC role by installing the Active Directory service, listens to the network and responds to it in accordance with AD services.<br>
For example;<br>
Responding to a client's request to become a member of the Domain.<br>
Responding to a client logging into the Domain. <br>

**The following basic ports are used in a domain.** <br>
These ports are distributed according to their roles above the DC. <br>

- **TCP/UDP 389** <br>
Used for LDAP (Lightweight Directory Access Protocol) communication. User authentication, directory queries, and other LDAP-based operations are performed through this port. <br>
- **TCP/UDP 636** <br>
Used for SSL/TLS secure connection over LDAP. This port is used for encryption and security of LDAP communication. <br>

- **TCP 3268** <br> Used for Global Catalog communication. The Global Catalog is a data directory used for quick searches that contains a concise summary of all objects (users, groups, resources, etc.) in the Active Directory environment. <br>
- **TCP 3269** <br> Used for SSL/TLS over Global Catalog <br>
- **TCP/UDP 88** <br> Used for Kerberos authentication. Kerberos is a secure protocol for authenticating users in an Active Directory environment. <br>


## What is Domain Controller?
Domain Controller is the machine on which the Active Directory service runs.<br>
Domain Controller is the role of a physical machine in the Active Directory environment.<br>

## Why does an Active Directory environment require DNS?
Active Directory registers every object in the domain with a name.<br>
It keeps the computer names and IP Addresses in these records.<br>
It is important for ease of use to access the computer or service by name instead of IP Address.<br>
Therefore, a mechanism is required that translates IP Address -> Machine / Machine -> IP Address.<br>
Like DNS servers in the Internet environment, DNS servers in the Domain environment also perform the same process.<br>
DNS is not required for the network to function, but DNS is required for the domain environment.<br>

<br>

---
[DebianDC Documentation](https://github.com/eesmer/DebianDC/blob/master/docs/DebianDC-Docs.md)
