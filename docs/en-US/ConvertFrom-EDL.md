---
external help file: DavinciTimestamp-help.xml
Module Name: DavinciTimestamp
online version: https://github.com/diecknet/DavinciTimestamp
schema: 2.0.0
---

# ConvertFrom-EDL

## SYNOPSIS
Converts an Edit Decision List (EDL) string to timestamps and titles.

## SYNTAX

```
ConvertFrom-EDL [-Value] <String[]> [-IgnoreOnly01Timestamps] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
This cmdlet reads an EDL string specified by the user and extracts timestamps and titles from it.

## EXAMPLES

### EXAMPLE 1
```
ConvertFrom-EDL -Value $MyEDLData
Reads the provided EDL String data and outputs the extracted timestamps and titles.
```

## PARAMETERS

### -Value
The EDL string data that should be processed.
This parameter is mandatory.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IgnoreOnly01Timestamps
Ignores that all Timestamps might start with '01:' and does not try to fix it by using '00:' instead.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. You cannot pipe objects to Convert-EDL2Timestamp.ps1.
## OUTPUTS

### String. Outputs strings that combine a timestamp and a title, separated by a space.
## NOTES
Version:        1.0
Author:         Andreas Dieckmann
Creation Date:  2025-08-30
Purpose/Change: Initial development

## RELATED LINKS

[https://github.com/diecknet/DavinciTimestamp](https://github.com/diecknet/DavinciTimestamp)

