## Management of FSMO Roles
Flexible Single-Master Operations (FSMO) Roles<br>
FSMO roles are tasks managed from 1 DC machine belonging to the AD environment.<br>
These roles cannot exist on more than one DC machine at the same time, but can be transferred from one DC machine to another DC machine.<br>
Additionally, if the DC machine that holds the role becomes inaccessible, another DC machine can take over this role.<br>
These tasks are called FSMO because they are managed from a single DC machine and can be transferred between DC machines.<br>
It is called Flexible Single Master Operations.<br>

---

These roles;<br>
- **PDC Emulator**
  - Manages the time service. Client machines synchronize time with the DC machine running the PDC task.
  - Keeps password changes. If the account password is made from a DC machine that does not operate the PDC role, the change is sent to the DC machine that also operates the PDC role.
  - Executes account lockouts with the DC machine operating this role.
  - An incorrect password entry in the domain environment is sent to the DC machine operating this role before being transmitted to the relevant client.
  - The Group Policy management screen works with the DC machine that holds the PDC Emulator role.

   The DC machine operating this role must be running at all times.<br>
   With the following command from any client that is a member of the domain, the DC machine running the "PDC emulator" role will be listed.
  ```
  dig -t SRV _ldap._tcp.pdc._msdcs.$DOMAIN
  ```

- **RID Master**<br>
  In the Active Directory environment, all objects (user accounts, machine accounts, groups) have a SID definition and this definition is unique.
  The SID definition of a object also includes the SID of the domain.<br>
  So, for example, just as objects that are members of the example.lan domain have their own SIDs, this SID definition also includes the SID of the example.lan domain.<br>
  Thus, objects have a common definition that includes the SID definition of the domain they are a member of.<br>
  In addition to the domain SID, the objects contained in the domain also have a domain-specific and unique RID definition.<br>
  <br>
  **Example:**<br>
  *Domain SID:* S-1-5-21-3134998938-619743855-3616620706 <br>
  *Object SID:* S-1-5-21-3134998938-619743855-3616620706-1121 <br>

- **Schema Master**
- **Domain Naming Master**
- **Infrastructure Master**
- **Domain DNS Master**
- **Forest DNS Master**

<br>

[DebianDC Handbook](https://github.com/eesmer/DebianDC/blob/master/DebianDC-Handbook.md)
