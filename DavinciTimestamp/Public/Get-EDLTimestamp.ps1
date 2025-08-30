<#
.SYNOPSIS
Gets Timestamp and Title Data from an Edit Decision List (EDL) file.

.DESCRIPTION
This cmdlet reads an EDL file specified by the user and extracts timestamps and titles from it.
If no path an EDL file was specified, the cmdlet will try to find a .edl file itself.

Under the hood Get-EDLTimestamp reads the EDL file and then calls ConvertFrom-EDL.
There is also the "gts" alias for Get-EDLTimestamp.

.PARAMETER Path
The EDL file that should be processed. This parameter is optional. If no Path is specified, the cmdlet tries to find a EDL file.

.PARAMETER IgnoreOnly01Timestamps
Ignores that all Timestamps might start with '01:' and does not try to fix it by using '00:' instead.

.EXAMPLE
Get-EDLTimestamp -Path "C:\Video\MyVideo.edl"

Reads the provided EDL file and outputs the extracted timestamps and titles.

.EXAMPLE
Get-EDLTimestamp

Since no EDL file was provided, the cmdlet tries to automatically find an .edl file itself.
It looks in the following locations (in this order) $PWD.Path, $HOME, C:\temp, /tmp
It will only use the first file found.

.INPUTS
None. You cannot pipe objects to Get-EDLTimestamp.

.OUTPUTS
String. Outputs strings that combine a timestamp and a title, separated by a space.

.NOTES
Version:        1.0
Author:         Andreas Dieckmann
Creation Date:  2025-08-30
Purpose/Change: Initial development

.LINK
https://github.com/diecknet/DavinciTimestamp
#>

function Get-EDLTimestamp {
    [Alias("gts")]
    [CmdletBinding()]
    param(  [Parameter(Mandatory=$false)]
            [System.IO.FileInfo]
            $Path,
            [switch]$IgnoreOnly01Timestamps)

    $OptionalParametersPassThrough = @{}
    if($PSBoundParameters.ContainsKey("IgnoreOnly01Timestamps")) {
        $OptionalParametersPassThrough["IgnoreOnly01Timestamps"] = $IgnoreOnly01Timestamps
    }

    if([string]::IsNullOrEmpty($Path)) {
        Write-Verbose "No 'Path' specified by user, trying to find EDL file automatically instead..."
        $Path = Find-EDLFile
        if(-not $Path) {
            Write-Verbose "Found no EDL file. Aborting."
            throw "ERROR: Please provide the path of an EDL file with -Path"
        }
        Write-Verbose "Found EDL file: $Path"

    }

    if(Test-Path($Path)) {
        Write-Verbose "Reading content of EDL file: $Path"
        $EDLFileContent = Get-Content -Path $Path -ErrorAction Stop
        Write-Verbose "Calling ConvertFrom-EDL"
        ConvertFrom-EDL -Value $EDLFileContent @OptionalParametersPassThrough

    } else {
        throw "File does not exist ($Path)."
    }
}
