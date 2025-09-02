# DavinciTimestamp

Converts Davinci Resolve EDL files to Timestamps e.g. for YouTube.

## Overview

You can add markers in your Davinci Resolve Timeline - but there is no native way to export these
in a YouTube-compatible format. This PowerShell module helps by converting .edl files from Davinci Resolve
to usable Timestamps.

## Installation

The module is available via the [PowerShell Gallery](https://www.powershellgallery.com/packages/DavinciTimestamp).

It should work with Windows PowerShell 5.1 and PowerShell 7.x on Linux, macOS or Windows.

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

In Davinci Resolve on the "Edit" page: Right-click on your **active** Timeline in the Media Pool.
Click on `Timelines` -> `Export` -> `Timeline Markers to EDL` and save the file somewhere.

> [!WARNING]
> Do not use the Export option `AAF / XML / EDL / DRT /OTIO...`. Even though you can create `.edl` files with that option too, they're a bit different and are not supported with this module.

<img width="953" height="470" alt="image" src="https://github.com/user-attachments/assets/97813bfa-7236-45f8-8812-a853f03d9ffc" />

Then in PowerShell run `Get-EDLTimestamp -Path <PathToYourFile>`.

For example, if your .edl file was exported to C:\temp\MyTimeline.edl, run this:

```powershell
Get-EDLTimestamp -Path C:\temp\MyTimeline.edl
```

> [!TIP]
> `Get-EDLTimestamp` will try to automatically find a `.edl` file if you don't specify one. The cmdlet looks in your `$HOME` directory and `/tmp` (Linux/macOS) or `C:\temp` (Windows). It will just take the first `.edl` file it finds though.

## Open Source!

If you find any bugs or have feature requests, please open a [ISSUE](https://github.com/diecknet/DavinciTimestamp/issues) here in the GitHub repository. But I can't promise that I will do anything :P Issues and Pull Requests are welcome, but I deem this module as pretty much feature complete.
