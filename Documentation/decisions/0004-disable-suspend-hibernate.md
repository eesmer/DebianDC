# ADR-0004: Disabling Suspend and Hibernate in DebianDC

## Status
Accepted

## Context

DebianDC is designed and deployed as a Samba Active Directory Domain Controller (AD DC) platform.

A Domain Controller is an always-on infrastructure component that commonly provides:
- Authentication and authorization services
- Kerberos ticketing
- DNS services (often integrated with AD)
- Directory replication and time-sensitive operations

Because of these characteristics, a DC is expected to remain continuously available.
Power states that pause execution (Suspend) or persist memory to disk and stop services (Hibernate)
are not aligned with the operational model of directory services in enterprise environments.

