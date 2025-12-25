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

