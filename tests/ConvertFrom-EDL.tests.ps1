BeforeAll {
    $EDLData_Normal =   "TITLE: Timeline",
                        "FCM: NON-DROP FRAME",
                        "",
                        "001  001      V     C        00:00:00:00 00:00:00:01 00:00:00:00 00:00:00:01  ",
                        " |C:ResolveColorBlue |M:Chapter 1 |D:1",
                        "",
                        "002  001      V     C        00:00:48:18 00:00:48:19 00:00:48:18 00:00:48:19  ",
                        " |C:ResolveColorBlue |M:Another Chapter |D:1"

    $EDLData_01Prefix = "TITLE: Timeline",
                        "FCM: NON-DROP FRAME",
                        "",
                        "001  001      V     C        01:00:00:00 01:00:00:01 01:00:00:00 01:00:00:01  ",
                        " |C:ResolveColorBlue |M:Chapter 1 |D:1",
                        "",
                        "002  001      V     C        01:00:48:18 01:00:48:19 01:00:48:18 01:00:48:19  ",
                        " |C:ResolveColorBlue |M:Another Chapter |D:1"
}

Describe "ConvertFrom-EDL" {

        It "Normal EDL data gets converted correctly" {

            ConvertFrom-EDL -Value $EDLData_Normal | Should -Be "00:00:00 Chapter 1","00:00:48 Another Chapter"
        }


        It "EDL data with 01: prefix gets converted correctly" {
            ConvertFrom-EDL -Value $EDLData_01Prefix -WarningAction SilentlyContinue | Should -Be "00:00:00 Chapter 1","00:00:48 Another Chapter"
        }

        It "EDL data with 01: prefix can be forced to be accepted via -IgnoreOnly01Timestamps" {
            ConvertFrom-EDL -Value $EDLData_01Prefix -WarningAction SilentlyContinue -IgnoreOnly01Timestamps | Should -Be "01:00:00 Chapter 1","01:00:48 Another Chapter"
        }

}
