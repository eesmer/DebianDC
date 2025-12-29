# ADR-0001: Initial Platform and User Interface Choices

## Status
Accepted (historical record)

## Context

When the DebianDC project was first initiated, the primary objective was to build a **lightweight, script-based, and controllable** system for deploying and managing Samba Active Directory environments.

During the early stages of the project, the following goals were prioritized:

- Making the installation process as automated as possible
- Solving graphical interface requirements using simple and lightweight tools
- Ensuring the system remains easy to understand and straightforward to intervene in when needed

In line with these goals, the following core technology stack was selected for the initial releases.

---

## Decisions

### Operating System Base: Debian 11

The initial versions of DebianDC were developed on top of **Debian 11 (Bullseye)**.

This choice was made because:
- Debian 11 provides long-term stability
- It offers a mature ecosystem for Samba and related packages
- It is widely preferred in enterprise environments

---

### Desktop Environment: LXDE

For management interfaces that required graphical interaction,
the **LXDE** desktop environment was selected.

The main reasons for choosing LXDE were:
- Low resource consumption
- Simple and predictable window management
- A deliberate avoidance of complex desktop components

In the early releases of DebianDC, LXDE provided a sufficient and balanced environment for graphical interaction.

---

### User Interface Tool: Zenity

In DebianDC, operations requiring graphical interaction
were implemented through Bash scripts using **Zenity**.

The advantages of this approach included:
- Natural integration with Bash scripts
- No requirement for additional programming languages or frameworks
- Rapid prototyping and development capability
- Transparent and traceable execution of operations

At the beginning of the project, Zenity was considered a suitable tool that aligned well with the goal of a “lightweight graphical interface.”

---

### Application Development Approach: Bash Scripts

All management tools in DebianDC were developed as **Bash scripts**.

The primary motivations behind this decision were:
- Bash being a familiar language for system administrators
- Direct interaction with command-line tools
- Operations being easy to inspect and modify
- Providing a structure close to distribution independence

As a result, DebianDC evolved into a system that is learnable and modifiable, rather than a closed and opaque management tool.

---

## Consequences

With this initial technology stack:
- DebianDC could be developed rapidly
- Samba Active Directory deployment and management tools became functional in a short time
- The project’s core philosophy and direction were clearly established

This document records the platform and tool choices made during the early versions of DebianDC, together with their historical context.
Subsequent decisions were built upon this foundational layer.

## References

- Debian 11 (Bullseye) – General Information:
  https://www.debian.org/releases/bullseye/

- Debian Long Term Support (LTS) Policy:
  https://wiki.debian.org/LTS

- Samba Official Documentation:
  https://www.samba.org/samba/docs/

- LXDE Project:
  https://www.lxde.org/

- Zenity Official Documentation:
  https://help.gnome.org/users/zenity/stable/

- Bash Scripting – GNU Bash Manual: 
  https://www.gnu.org/software/bash/manual/

---

[Back to Documentation](https://github.com/eesmer/DebianDC/blob/master/Documentation/#decisions)
