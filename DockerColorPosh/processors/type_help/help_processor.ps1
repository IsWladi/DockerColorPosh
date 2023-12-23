function ColorizeTypeHelp {
    Param(
        [Parameter(ValueFromPipeline=$true)]
        [string]$InputLine
    )

    Begin {
        # Create an array to store each line of the docker command output
        $array_lines = @()
        $main_color = "Cyan"
        $abrev_flag_color = "Red"
        $help_enunciate_color = "Green"
    }

    Process {
        # Add each line to the array
        $array_lines += $InputLine
    }

    End {
            for ($i = 0; $i -lt $array_lines.Count; $i++) {
                # If the line starts with a word followed by a : symbol, it's a help enunciation
                if ($array_lines[$i] -match "^\w+:") {
                    Write-Host $array_lines[$i] -ForegroundColor $help_enunciate_color
                    }
                # Colorize the "-" and "--" in the flags
                elseif ($array_lines[$i] -match "^\s*(-|--)[a-z]+") {
                    ColorizeFlagsInHelpCommands -full_cmd $array_lines[$i] `
                                               -regex @("^\s*-[a-z],",
                                                        "--[a-z]+-?",
                                                        "[a-z]-[a-z]",
                                                        "[a-z]-[a-z]") `
                                               -to_extract @("-", "--", "-", "-") -sub_cmd_color $abrev_flag_color -main_color $main_color
                }
                else {
                    Write-Host $array_lines[$i] -ForegroundColor $main_color
                    }
            }
    }
}
