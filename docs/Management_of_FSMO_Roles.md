## Management of FSMO Roles
Flexible Single-Master Operations (FSMO) Roles<br>
FSMO roles are tasks managed from 1 DC machine belonging to the AD environment.<br>
These roles cannot exist on more than one DC machine at the same time, but can be transferred from one DC machine to another DC machine.<br>
Additionally, if the DC machine that holds the role becomes inaccessible, another DC machine can take over this role.<br>
These tasks are called FSMO because they are managed from a single DC machine and can be transferred between DC machines.<br>
It is called Flexible Single Master Operations.<br>

---

These roles;<br>
- PDC Emulator<br>
  - Manages the time service. Client machines synchronize time with the DC machine running the PDC task.
  - Keeps password changes. If the account password is made from a DC machine that does not operate the PDC role, the change is sent to the DC machine that also operates the PDC role.
  - Executes account lockouts with the DC machine operating this role.
  - An incorrect password entry in the domain environment is sent to the DC machine operating this role before being transmitted to the relevant client.
  - The Group Policy management screen works with the DC machine that holds the PDC Emulator role.

- RID Master<br>
- Schema Master<br>
- Domain Naming Master<br>
- Infrastructure Master<br>
- Domain DNS Master<br>
- Forest DNS Master<br>

<br>

[DebianDC Handbook](https://github.com/eesmer/DebianDC/blob/master/DebianDC-Handbook.md)
