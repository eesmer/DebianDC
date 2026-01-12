# DebianDC Networking Architecture

This document describes how network configuration is handled in DebianDC, with a particular focus on static IP assignment and DNS stability.
DebianDC does not aim to provide a flexible, user-oriented networking stack. Instead, it focuses on predictable behavior suitable for Samba Active Directory, Kerberos authentication, and infrastructure services.

---

### 1. Scope and Design Goals
DebianDC network communication is designed for controlled server environments. <br>
It is assumed that network parameters are known in advance and should not change implicitly during system operation.

**The primary objectives are:**
- Stable behavior during reboots
- Clear ownership of network configuration
- Minimal dependency on background services
- DNS behavior that reliably supports AD and Kerberos
- Easy analysis when problems arise

Clarity and control are prioritized over convenience and automatic adaptation. <br>

### 2. Problem Description: Why Does DNS Become Unstable?
In Debian systems, the DNS configuration file /etc/resolv.conf is not always static.

Depending on the system state and boot timing, the following may occur:
- It may be rewritten during network startup.
- It may be affected by previous DHCP usage.
- It may be rebuilt when the interface state changes.
- It may be affected by the type of reboot or boot order.

As a result, the DNS configuration may appear correct in initial tests, but may change unexpectedly after subsequent reboots. <br>
This behavior can directly impact AD discovery and Kerberos operations.

### 3. Debian Network Lifecycle Overview

Simplified view of the Debian network startup sequence:
- System boot begins.
- Network interfaces are initialized.
- Interfaces become active.
- DNS configuration is applied or modified.
- User space services start.

An important detail is that DNS configuration does not need to occur at a single fixed point in this sequence.

---

[Back to Documentation](https://github.com/eesmer/DebianDC/blob/master/Documentation/#architecture)
