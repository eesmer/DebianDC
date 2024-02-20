This document describes recommended best configurations for DebianDC installation and management of AD services. <br>

---

### Best Configuration for FSMO Roles with DebianDC <br>
When you set up a new domain with DebianDC, all FSMO roles are installed on a single server (the first DC created with the installation). <br>
The best application of this is; It is to distribute FSMO roles among different DC servers. <br>
The minimum configuration at all times and in all situations is 2 DC servers.
