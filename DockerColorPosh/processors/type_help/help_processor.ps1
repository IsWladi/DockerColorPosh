function ColorizeTypeHelp {
    Param(
        [Parameter(ValueFromPipeline=$true)]
        [string]$InputLine
    )

    Begin {
        # Create an array to store each line of the docker command output
        $array_lines = @()
    }

    Process {
        # Add each line to the array
        $array_lines += $InputLine
    }

    End {
            for ($i = 0; $i -lt $array_lines.Count; $i++) {
                # If the line starts with a word followed by a : symbol, it's a help header
                if ($array_lines[$i] -match "^\w+:") {
                    Write-Host $array_lines[$i] -ForegroundColor $help_header_color
                    }
                # Colorize the "-" and "--" in the flags
                elseif ($array_lines[$i] -match "^\s*(-|--)[a-z]+") {
                    ColorizeFlagsInHelpCommands -full_cmd $array_lines[$i] `
                                               -regex @("^\s*-[a-z],",
                                                        "^\s*.*--[a-z]+-?",
                                                        "^\s*\w*[a-z]-[a-z]",
                                                        "^\s*\w*[a-z]-[a-z]",
                                                        "^\b\w+\s+\w+-\w+\b") `
                                               -to_extract @("-", "--", "-", "-", "-") -sub_cmd_color $help_flag_color -main_color $main_color
                }
                # Generic color
                else {
                    Write-Host $array_lines[$i] -ForegroundColor $main_color
                    }
            }
    }
}
