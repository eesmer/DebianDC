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
