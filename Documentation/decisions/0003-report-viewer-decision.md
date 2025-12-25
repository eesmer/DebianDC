# ADR-0003: Change in HTML Report Viewing Approach

## Status
Accepted

## Context

In earlier versions of the DebianDC project (under the Debian 11 + LXDE + Zenity architecture defined in ADR-0001), 
reports generated in HTML format were displayed inside a Zenity window using the `zenity --text-info --html` parameter.

