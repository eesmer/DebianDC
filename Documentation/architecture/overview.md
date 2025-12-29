# What is DebianDC?

DebianDC is a **customized system and toolset** developed on top of Debian GNU/Linux
with the purpose of **deploying, managing, and operating Samba Active Directory (AD) environments**.

The project aims to manage the Samba AD infrastructure in a more
**controlled, transparent, and sustainable** manner,
both during the **initial deployment phase** and throughout the **operational lifecycle**.

Rather than being a general-purpose desktop Linux distribution,
DebianDC is designed as a **focused infrastructure component for enterprise directory services**.

---

## Project Purpose

The primary goal of DebianDC is to simplify the lifecycle management of
Samba Active Directory environments and to provide system administrators with a
**clear and transparent control surface**.

Within this scope, DebianDC:

- Provides automated and repeatable installation processes
- Simplifies the deployment of Samba Active Directory Domain Controllers
- Eases the management of DNS, Kerberos, and related AD components
- Supports daily administration and auditing tasks with
  lightweight graphical tools
- Aims for script-based, traceable, and auditable operations

---

## Target Use Scenarios

DebianDC is developed with the following use cases in mind:

- Deployment of new Samba Active Directory domain environments
- Management of existing Samba AD infrastructures
- Monitoring, validating, and reporting on
  Linux-based AD environments
- Using the **same administrative approach** across
  training, testing, and production environments
- Reducing the daily operational workload of system administrators
  in enterprise environments

---

## Design Principles

The following principles guide the development of DebianDC:

### 1. Balance Between Automation and Control
- Installation and repetitive tasks are automated
- Visibility into system behavior is always prioritized
  for the system administrator

### 2. Lightweight Graphical Interface Approach
- Graphical interfaces are used only where they add real value
- Heavy desktop components are deliberately avoided
- Tools must remain simple, fast, and auditable

### 3. Script-Based and Traceable Structure
- Management tools are script-based
- Operations remain readable and can be
  performed manually when necessary

### 4. Alignment with Debian Standards
- Debian’s official packages and infrastructure are preferred
- Custom forks and aggressive patching are avoided
- Debian release transitions are handled in a controlled manner

### 5. Documentation and Continuity
- Architectural choices and tool selections are documented
  together with their rationale
- Decisions should remain traceable and understandable over time
- The development process should progress in a structured
  and disciplined manner

---

## What DebianDC Is Not

DebianDC does **not** aim to be:

- A general-purpose desktop Linux distribution
- An end-user–oriented computing environment
- A one-to-one replica of Windows Active Directory
- A closed management tool that hides all underlying operations

DebianDC is developed with an approach that
**keeps control in the hands of the system administrator**
and values transparency and learnability.

---

## Documentation Structure

DebianDC documentation is organized under two main sections:

- **Architecture/**  
  Describes the project’s timeless architectural approach
  and core design principles

- **Decisions/**  
  Records technical and design decisions made over time,
  together with their rationale

This structure is intended to ensure that DebianDC’s maintenance
and development process remains **systematic, transparent, and traceable**.

---

[Back to Documentation](https://github.com/eesmer/DebianDC/blob/master/Documentation/#architecture)
