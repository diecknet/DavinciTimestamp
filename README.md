# DavinciTimestamp

Converts Davinci Resolve EDL files to Timestamps e.g. for YouTube.

## Overview

You can add markers in your Davinci Resolve Timeline - but there is no native way to export these
in a YouTube-compatible format. This PowerShell module helps by converting .edl files from Davinci Resolve
to usable Timestamps.

## Installation

This should work with Windows PowerShell 5.1 and PowerShell 7.x on Linux, macOS or Windows.

```powershell
# Windows PowerShell
Install-Module DavinciTimestamp
```

or

```powershell
# PowerShell 7.x
Install-PSResource DavinciTimestamp
```

## Examples

In Davinci Resolve on the "Edit" page: Right-click on your Timeline in the Media Pool.
Click on Timelines -> Export -> AAF/XML/EDL/DRT/OTIO (or similar) and save the file somewhere.
Then in PowerShell run `Get-EDLTimestamp -Path <PathToYourFile>`.

For example, if your .edl file was exported to C:\temp\MyTimeline.edl, run this:

```powershell
Get-EDLTimestamp -Path C:\temp\MyTimeline.edl
```
