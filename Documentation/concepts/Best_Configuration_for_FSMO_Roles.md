
## Best Configuration for FSMO Roles with DebianDC
When you set up a new domain with DebianDC, all FSMO roles are installed on a single server (the first DC created with the installation). <br>
The best application of this is; It is to distribute FSMO roles among different DC servers. <br>
The minimum configuration at all times and in all situations is 2 DC servers.<br>

Accordingly, for example; <br>
- **Forest-wide** FSMO roles are run on a server. <br>
    - RIDMaster
    - InfrastructureMaster
    - PDC Emulator
- **domain-wide** FSMO roles run on another server. <br>
    - SchemaMaster
    - DomainMaster

**The following configuration items must be applied for domain environment management.** <br>
1- domain-wide FSMO roles must be run on the same server <br>
2- PDC Emulator and RidMaster roles must be run on the same server. <br>
3- The InfrastructureMaster role must be run on a server that does not have the Global Catalog role installed. <br>
4- DC servers should not be assigned any role other than AD service. <br>
<br>

---
[DebianDC Documentation](https://github.com/eesmer/DebianDC/blob/master/docs/DebianDC-Docs.md)
