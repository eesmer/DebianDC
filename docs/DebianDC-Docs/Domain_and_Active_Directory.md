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
Responding to a client logging into the Domain.<br>

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

[DebianDC-Docs](https://github.com/eesmer/DebianDC/blob/master/docs/DebianDC-Docs)
