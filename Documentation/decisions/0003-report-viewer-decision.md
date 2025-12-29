# ADR-0003: Change in HTML Report Viewing Approach

## Status
Accepted

## Context

In earlier versions of the DebianDC project (under the Debian 11 + LXDE + Zenity architecture defined in ADR-0001), 
reports generated in HTML format were displayed inside a Zenity window using the `zenity --text-info --html` parameter.

With ADR-0002, DebianDC was decided to transition to a Debian 13 (Trixie) and Openbox–based platform.

During this transition, the tools used for displaying reports and their behavior on the new platform were re-evaluated.

---

## Problem

During evaluations in the Debian 13 environment, it was observed that:
- The `zenity --text-info --html` option is disabled in Debian’s Zenity packages
- This limitation is not caused by missing dependencies, but by packaging and build-time decisions
- The YAD package also does not provide HTML rendering support

As a result, the previously used approach of “displaying HTML reports inside Zenity” is no longer sustainable on the new platform.

---

## Considered Options

### 1. Using Zenity Markup (Pango)

Zenity’s supported markup and colored text features were evaluated.

**Pros:**
- Compatible with Zenity
- Allows short, colored, and formatted output

**Cons:**
- Not suitable for long reports requiring scrolling
- Insufficient for tables, sectioning, and complex report structures
- Struggles to meet enterprise reporting requirements

For these reasons, the markup approach was considered suitable only for short messages and was not selected for report viewing.

---

### 2. Custom Viewer Application (GTK / Python)

The option of displaying HTML or markup content using a custom viewer application was evaluated.

**Pros:**
- Supports colored output and scrolling
- Does not require a web browser

**Cons:**
- Requires an additional application beyond Zenity
- Introduces maintenance and distribution overhead
- Expands DebianDC’s intentionally minimal toolset

This approach was rejected as it would introduce unnecessary complexity.

---

### 3. Using a Lightweight HTML Viewer (netsurf-gtk)

The option of displaying HTML reports using a lightweight graphical browser was evaluated.

**Pros:**
- True HTML rendering support
- Suitable for long and complex reports
- Lightweight and fast
- Requires minimal dependencies

**Cons:**
- Requires opening a separate window outside of the Zenity interface

Since DebianDC already considers displaying reports in a separate window outside Zenity to be acceptable, this drawback was deemed acceptable.

---

## Decision

In the DebianDC project, it was decided to use **netsurf-gtk** for displaying reports generated in HTML format.

Accordingly:
- Reports will continue to be generated in HTML format
- Zenity will remain the primary user interaction interface
- HTML reports will be opened in a separate viewer window, outside of Zenity

---

## Consequences and Impact

As a result of this decision:

- A sustainable report viewing approach, independent of Debian 13 packaging decisions, has been adopted
- Report readability and extensibility have improved
- The reporting infrastructure is now suitable for future content expansion
- The display layer has been decoupled from the report generation logic

This document records why and how the report viewing approach in DebianDC was changed, together with its historical and technical context.

## References

- Debian Zenity package:
  https://packages.debian.org/trixie/zenity

- Zenity upstream project page:
  https://gitlab.gnome.org/GNOME/zenity

- Debian YAD package:
  https://packages.debian.org/trixie/yad

- NetSurf web browser:
  https://www.netsurf-browser.org/

- Debian NetSurf package:
  https://packages.debian.org/trixie/netsurf-gtk

---

[Back to Documentation](https://github.com/eesmer/DebianDC/blob/master/Documentation/#guides)
