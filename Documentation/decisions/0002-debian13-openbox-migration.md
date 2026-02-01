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
- A more up-to-date package ecosystem
- A longer forward-looking maintenance horizon
- Easier integration of new tools and technologies
- Reduction of long-term technical debt

---

---

### Desktop Environment: Openbox

Instead of LXDE, the lightweight window manager **Openbox** was selected.

The reasons for choosing Openbox include:
- Minimal resource consumption
- Full control over desktop components
- Clearer management of autostart behavior, window handling, and user interactions
- Easier construction of a DebianDC-specific user experience

This approach aligns with DebianDC’s goal of being a **focused management environment** rather than a general-purpose desktop distribution.

---

### Graphical Tooling Approach

Graphical interaction in DebianDC will continue to be provided through Zenity-based Bash scripts, as in previous versions.
The transition to Debian 13 and Openbox does not imply a complete change in the UI approach; however, it does require re-evaluating the existing tools under the conditions of the new platform.

---

## Consequences and Impact

As a result of this decision:
- DebianDC has been moved to a more modern platform
- The desktop environment has been simplified and made more customizable
- Changes in package and tool behavior have become more visible
- Some previous approaches (such as HTML rendering via Zenity) have required reconsideration

This document records the decision to transition DebianDC to Debian 13 and Openbox, together with its technical and historical context.

## References

- Debian 13 (Trixie) – General Information:
  https://www.debian.org/releases/trixie/

- Debian Release Cycle and Support Lifetimes:
  https://www.debian.org/releases/

- Openbox Official Project:
  http://openbox.org/

- Openbox Wiki:
  https://openbox.org/wiki/Main_Page

- Debian Openbox package:
  https://packages.debian.org/trixie/openbox

- Zenity Debian package:
  https://packages.debian.org/trixie/zenity

---

[Back to Documentation](https://github.com/eesmer/DebianDC/blob/master/Documentation/#decisions)
