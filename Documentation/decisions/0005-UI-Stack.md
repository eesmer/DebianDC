# UI Stack and Tools

This document summarizes the approach and toolset adopted by DebianDC for user interaction (UI) and report visualization layers.

## Goal

DebianDC's UI approach does not aim to provide a general-purpose desktop experience;
instead, it focuses on executing Samba AD operations in a **fast, lightweight, and controllable** manner.

Therefore, the primary goals of the UI layer are:

- Minimal dependencies
- Script-based transparency
- Low resource consumption
- Easy field maintenance / simple troubleshooting

## Components

### 1. Window Manager / Desktop

DebianDC uses a lightweight desktop approach tailored to focused management scenarios.

- **Openbox** provides more control over window behavior, auto-start mechanisms, and user workflow.

> For the decision doc on this choice, see: `Documentation/decisions/0002-debian13-openbox-migration.md`

### 2. Interaction Dialogs: Zenity

In DebianDC, screens requiring user interaction (menus, selections, questions, warnings, etc.) are implemented using **Zenity** via Bash scripts.

Reasons for choosing Zenity:

- Local integration with Bash
- Rapid development
- Simple dependency chain
- Maintains operational transparency

### 3. Report Generation: HTML

The reporting layer in DebianDC uses the **HTML** format to ensure readability and extensibility.

HTML-based reporting approach:

- Suitable for long content
- simplifies structures such as tables, sections, and tables of contents
- improves visual readability

### 4. Report Viewing: NetSurf GTK

Since Zenity does not provide HTML viewing support in the Debian 13 environment, HTML reports are viewed using a lightweight viewer.

- **netsurf-gtk** is used as the default viewer for HTML reports

> For the decision doc on this choice, see: `Documantation/decisions/0003-report-viewer-decision.md`

## UI Flow

General flow:

1. The user selects a task from a Zenity-based menu.
2. The relevant script executes the task.
3. If output is required:
   - brief information/warnings → Zenity message dialog
   - report output → HTML generation + viewing with NetSurf
4. When the NetSurf window is closed, the user flow returns to the Zenity menu.

## Design Notes

- The UI layer should be separated from the business logic.
  - Scripts aim to make a clear distinction between “doing the job” and “presenting the result.”
- If the report viewer changes (e.g., NetSurf is replaced with another option), report generation (HTML) remains unchanged; only the “viewer” layer is modified.
