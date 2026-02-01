# ADR-0006: Post-Initial Setup Tools

## Status
Accepted

## Context

DebianDC is distributed as an automated Debian-based system image.
While the base operating system and core packages are installed during the ISO-based installation process, several tasks specific to DebianDC must be performed.

These tasks include (but are not limited to):

- Applying DebianDC-specific system customizations
- Initial environment setup
- Desktop or session-level adjustments (if applicable)
- Displaying post-installation guides or warnings
- Ensuring these steps are performed **only once**

Placing all these actions directly into the installer phase (pre-configured or late command) would reduce visibility, debugging, and long-term maintenance ease.

Therefore, a clear distinction between *installation* and *post-installation startup* was necessary.

---

## Decision

DebianDC uses a **first-boot, one-time post-installation mechanism** implemented through the following components:

- `debiandc-postinstall-ui.sh` a shell script specific to DebianDC responsible for executing post-installation tasks and providing necessary user output.
- `debiandc-postinstall.service` a systemd service unit that automatically triggers the post-installation script during the first boot after installation.

The service is designed as follows:

- Runs after the system becomes available
- Runs exactly once
- Disables itself after successful completion

---

## Rationale

This approach was chosen for the following reasons:

### 1. Separation of Concerns

- The ISO installation focuses solely on providing a bootable, consistent base system
- DebianDC customization is performed *after* installation in a controlled environment

### 2. Ease of Maintenance

- Post-installation behavior can evolve independently of the ISO compilation process.
- Changes do not require recompiling or deep modification of the installer logic.
- Debugging is significantly simpler compared to pre-configured solutions.

### 3. Repeatability and Security

- systemd provides a reliable execution model.
- One-time services ensure actions are not unintentionally repeated
- Error conditions are clearly detectable and manageable

---

## Results

### Positive

- Clear and predictable system startup flow
- Improved debugging during development and testing
- Easier future expansion of post-installation steps
- Better alignment with Debian and systemd best practices

### Pros and Cons

- Requires careful design to ensure that running the script only once is truly safe
- Additional logic is required to disable or mask the service after execution
- Slightly more complexity compared to monolithic loader logic

---

## Alternatives Considered

### 1. Preseed `late_command` Only

Reason for rejection:

- Logic becomes unclear and debugging is difficult
- Access to post-installation loader logs is more difficult
- Difficult to extend or modify over time

### 2. Manual Post-Installation Instructions

Reasons for rejection:

- Inconsistent execution across environments
- High risk of human error
- Not suitable for automated or large-scale deployments

---

## Related Components

- `debiandc-postinstall-ui.sh`
- `debiandc-postinstall.service`
- DebianDC ISO build process
- DebianDC documentation under `Architecture/`
Any additional first-boot logic should be integrated
with this mechanism rather than introducing
parallel or temporary solutions.

---

## Notes
This decision forms the basis for all future post-installation workflows in DebianDC.

---

[Back to Documentation](https://github.com/eesmer/DebianDC/blob/master/Documentation/#architecture)
