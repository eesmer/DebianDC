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

DebianDC also uses a lightweight Openbox-based desktop environment where the graphical UI exists only as a helper interface for administrators and not as an end-user desktop experience.

---

## Problem

In a minimal desktop environment such as Openbox, power actions shown in UI menus may appear but remain unavailable without the correct authorization layer.

At the same time, even if supported, Suspend and Hibernate are not meaningful (or desired) for a Domain Controller role:
- They interrupt critical services unexpectedly
- They may cause replication delays and operational inconsistencies
- They can contribute to Kerberos issues such as time drift/clock skew scenarios
- They reduce predictability and increase operational risk

Therefore, DebianDC must clearly define which power operations are supported.

---

## Decision

DebianDC intentionally does **not** support:
- Suspend
- Hibernate

DebianDC supports only the following power operations for administrators:
- Restart
- Shut Down

To ensure Restart/Shut Down actions work correctly in the Openbox environment, DebianDC includes the minimal authorization components required for systemd-logind power actions:
- `policykit-1`
- `lxqt-policykit` (provides `lxqt-policykit-agent`)

This provides a lightweight PolicyKit authentication agent without introducing a full desktop stack or additional power-management frameworks.

---

## Consequences and Impact

As a result of this decision:
- DebianDC aligns power behavior with the operational expectations of a Domain Controller
