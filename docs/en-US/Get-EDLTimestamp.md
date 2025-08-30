---
external help file: DavinciTimestamp-help.xml
Module Name: DavinciTimestamp
online version: https://github.com/diecknet/DavinciTimestamp
schema: 2.0.0
---

# Get-EDLTimestamp

## SYNOPSIS
Gets Timestamp and Title Data from an Edit Decision List (EDL) file.

## SYNTAX

```
Get-EDLTimestamp [[-Path] <FileInfo>] [-IgnoreOnly01Timestamps] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
This cmdlet reads an EDL file specified by the user and extracts timestamps and titles from it.

## EXAMPLES

### EXAMPLE 1
```
Get-EDLTimestamp -Path "C:\Video\MyVideo.edl"
Reads the provided EDL file and outputs the extracted timestamps and titles.
```

## PARAMETERS

### -Path
The EDL file that should be processed.
This parameter is optional.
If no Path is specified, the cmdlet tries to find a EDL file.

```yaml
Type: FileInfo
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IgnoreOnly01Timestamps
{{ Fill IgnoreOnly01Timestamps Description }}

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

### None. You cannot pipe objects to Get-EDLTimestamp.
## OUTPUTS

### String. Outputs strings that combine a timestamp and a title, separated by a space.
## NOTES
Version:        1.0
Author:         Andreas Dieckmann
Creation Date:  2025-08-30
Purpose/Change: Initial development

## RELATED LINKS

[https://github.com/diecknet/DavinciTimestamp](https://github.com/diecknet/DavinciTimestamp)

