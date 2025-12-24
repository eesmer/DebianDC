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
