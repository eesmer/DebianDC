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

An important detail is that DNS configuration does not need to occur at a single fixed point in this sequence. <br>
Multiple components may attempt to update it.

### 4. Static IP Configuration in DebianDC
DebianDC implements static IP configuration as follows:

- `/etc/network/interfaces`
- `/etc/network/interfaces.d/debiandcnw`

Basic principles:
- DHCP lines are explicitly removed
- Static configuration is isolated in a dedicated file
- The main interface file contains only `interfaces.d/*`

This separation ensures that DebianDC settings are not mixed with distribution defaults or legacy configurations.

### 5. DNS Persistence Strategy

### 6. if-up.d Hook Mechanism
DebianDC installs a special script in the following location: <br>
/etc/network/if-up.d/debiandc-resolv
This script is automatically executed by ifupdown when a network interface becomes active. <br>

The hook performs the following actions:
- Reads the DNS servers defined in DebianDC's interface configuration
- Re-creates the /etc/resolv.conf file
- Ensures the system uses the intended DNS configuration after boot and reboot

Because the hook runs after the interface is active, it overrides earlier or intermediate DNS changes.

---

[Back to Documentation](https://github.com/eesmer/DebianDC/blob/master/Documentation/#architecture)
