<#
.SYNOPSIS
Gets Timestamp and Title Data from an Edit Decision List (EDL) file.

.DESCRIPTION
This cmdlet reads an EDL file specified by the user and extracts timestamps and titles from it.

.PARAMETER Path
The EDL file that should be processed. This parameter is optional. If no Path is specified, the cmdlet tries to find a EDL file.

.EXAMPLE
Get-EDLTimestamp -Path "C:\Video\MyVideo.edl"
Reads the provided EDL file and outputs the extracted timestamps and titles.

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
    [CmdletBinding()]
    param(  [Parameter(Mandatory=$false)]
            [System.IO.FileInfo]
            $Path)

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
        ConvertFrom-EDL -Value $EDLFileContent

    } else {
        throw "File does not exist ($Path)."
    }
}
