## Management of FSMO Roles
Flexible Single-Master Operations (FSMO) Roles<br>
FSMO roles are tasks managed from 1 DC machine belonging to the AD environment.<br>
These roles cannot exist on more than one DC machine at the same time, but can be transferred from one DC machine to another DC machine.<br>
Additionally, if the DC machine that holds the role becomes inaccessible, another DC machine can take over this role.<br>
These tasks are called FSMO because they are managed from a single DC machine and can be transferred between DC machines.<br>
It is called Flexible Single Master Operations.<br>

---

These roles;<br>
1- PDC Emulator<br>
2- RID Master<br>
3- Schema Master<br>
4- Domain Naming Master<br>
5- Infrastructure Master<br>
6- Domain DNS Master<br>
7- Forest DNS Master<br>

<br>

[DebianDC Handbook](https://github.com/eesmer/DebianDC/blob/master/DebianDC-Handbook.md)
