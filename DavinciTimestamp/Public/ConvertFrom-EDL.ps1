<#
.SYNOPSIS
Converts an Edit Decision List (EDL) string to timestamps and titles.

.DESCRIPTION
This cmdlet reads an EDL string specified by the user and extracts timestamps and titles from it.

.PARAMETER Value
The EDL string data that should be processed. This parameter is mandatory.

.EXAMPLE
ConvertFrom-EDL -Value $MyEDLData
Reads the provided EDL String data and outputs the extracted timestamps and titles.

.INPUTS
None. You cannot pipe objects to Convert-EDL2Timestamp.ps1.

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
function ConvertFrom-EDL {
    [CmdletBinding()]
    param(  [Parameter(Mandatory=$true)]
            [AllowEmptyString()]
            [String[]]
            $Value
    )

    # If EDL was provided as one multi-line string instead of an array
    if($Value.Count -eq 1) {
        $Value = $Value -split "`n"
    }

    $Result = [Ordered]@{}

    for($i = 0; $i -lt $Value.Count ; $i++){
        $Title = $null # Reset title
        if($Value[$i] -match "^\d{3}\s+\d{3}.+?(\d{2}:\d{2}:\d{2})") {
            $Timestamp = $Matches[1]
            Write-Verbose "Found timestamp on line ${i}: $Timestamp"
            $i++ # Move to next line
            if($Value[$i] -match "\|M:(.+?) \|") {
                $Title = $Matches[1]
                Write-Verbose "Found title on line ${i}: $Title"
            }
            $Result[$Timestamp] = $Title
        }
    }

    # if there are only Timestamps that start with "01:" there might be something wrong
    if($Result.Keys -like "01:*" -and $Result.Keys -notlike "00:*" -and (-not $IgnoreOnly01Timestamps)) {
        Write-Warning "There were only Timestamps that start with '01:', which seems wrong, so they got replaced by '00:'"
        Write-Warning "You can prevent this behavior by specifying -IgnoreOnly01Timestamps (or provide EDL data where the Timestamps start with '00:')"
        foreach($Key in $Result.Keys) {
            "00:{0} {1}" -f ($Key -split ":",2)[1],$($Result[$Key])
        }
    } else {
        foreach($Key in $Result.Keys) {
            "{0} {1}" -f $Key,$($Result[$Key])
        }
    }

}
