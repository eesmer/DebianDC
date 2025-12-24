# ADR-0002: Decision to Transition to Debian 13 and Openbox

## Status
Accepted

## Context

The initial versions of the DebianDC project were developed using the Debian 11 (Bullseye) base and the LXDE desktop environment.

As the project evolved:
- The number and scope of tools increased
- More scripts and supporting components were added for Samba Active Directory management
- Long-term maintenance, release upgrades, and package lifecycle considerations became more prominent

At this stage, the platform and desktop environment were re-evaluated to ensure the long-term sustainability of DebianDC.

---

## Considerations

### Debian Release

Debian 11 was a correct choice at the beginning of the project in terms of stability and maturity.

However, over time:

- Debian 13 (Trixie) introduced more up-to-date Samba, Python, and core system components
- A need emerged to move to a more forward-looking release from a long-term maintenance perspective
- There was a desire to avoid constraining new projects and development efforts with limitations imposed by older releases

For these reasons, updating the Debian base release became a key consideration.

---

### Desktop Environment and UI Approach

The graphical interface requirements of DebianDC are:
- Not intended to provide an end-user desktop experience
- Limited to helper screens that assist system administrators in performing specific tasks

For this reason, instead of a full-featured desktop environment, a **lightweight and controllable window management approach** was considered more appropriate.

---

## Decisions

### Operating System: Debian 13 (Trixie)

It was decided that new versions of DebianDC would be developed on top of **Debian 13 (Trixie)**.

The main reasons for this decision include:
