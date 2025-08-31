BeforeAll {
    $RandomFileName = "{0}.edl" -f (New-Guid).Guid
    if($IsWindows) {
        New-Item -ItemType Directory -Path C:\Temp -Force -ErrorAction SilentlyContinue
        $EDLPath = $(Join-Path -Path "C:\temp" -ChildPath $RandomFileName)
        Copy-Item Testdata/Timeline.edl -Destination $EDLPath
    }
    if($IsLinux -or $IsMacOS) {
        $EDLPath = $(Join-Path -Path "/tmp" -ChildPath $RandomFileName)
        Copy-Item Testdata/Timeline.edl -Destination $EDLPath
    }
    Copy-Item Testdata/Timeline.edl -Destination TestDrive:/
}

Describe "Get-EDLTimestamp" {

        It "Explicitly given EDL file gets converted correctly" {
            Push-Location TestDrive:/
            Get-EDLTimestamp -Path $EDLPath | Should -Be "00:00:00 Test Chapter 1","00:00:48 Test Chapter 2",
                "00:02:25 Hello","00:03:04 Test Chapter 4","00:03:55 Blablabla","00:08:30 Test 12345 Test"
            Pop-Location
        }

        It "Automatically determined EDL file gets converted correctly (TEMP directory)" {
            Push-Location TestDrive:/
            Get-EDLTimestamp | Should -Be "00:00:00 Test Chapter 1","00:00:48 Test Chapter 2",
                "00:02:25 Hello","00:03:04 Test Chapter 4","00:03:55 Blablabla","00:08:30 Test 12345 Test"
            Pop-Location
        }

        It "Automatically determined EDL file gets converted correctly (Current directory / Pester Drive)" {
            Remove-Item $EDLPath
            Push-Location TestDrive:/
            Get-EDLTimestamp | Should -Be "00:00:00 Test Chapter 1","00:00:48 Test Chapter 2",
                "00:02:25 Hello","00:03:04 Test Chapter 4","00:03:55 Blablabla","00:08:30 Test 12345 Test"
            Pop-Location
        }

}
