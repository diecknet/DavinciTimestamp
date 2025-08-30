function Find-EDLFile {
    [CmdletBinding()]
    param()

    Get-ChildItem -Path $PWD.Path,$HOME,"C:\temp","/tmp" -Filter *.edl -File -ErrorAction SilentlyContinue | Select-Object -First 1
}
