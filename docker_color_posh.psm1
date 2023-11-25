# Set the encoding to UTF8 to avoid problems with special characters
$OutputEncoding = [Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8

# This function colorize the output of the docker command
# This function is called by the DockerColorPosh function
# This function is not intended to be called directly
function ColorizeOutput {
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
            # if the line is the first one, colorize it with yellow
            if ($i -eq 0) {
                Write-Host $array_lines[$i] -ForegroundColor Yellow
                continue
            }
            # if the line is pair, colorize it better readability
            if ($i % 2 -eq 0) {
                Write-Host $($array_lines[$i]) -ForegroundColor DarkCyan
                continue
            }
            # if the line is impair, colorize it better readability
            Write-Host $($array_lines[$i]) -ForegroundColor Cyan
        }
    }
}

# This function is the main function of the module
# Is the only function exported by the module
# It´s for call the docker command and validate if the command is in the compatible list of commands and then call the ColorizeOutput function
# If the command is not in the list, the output will be shown without color
function DockerColorPosh {
    Begin {
        $entire_command = "docker"
        # This regex validate if the command is supported by the module.
        # If the command is not supported, the output will be shown without color
        # If you want to add more commands, add the command name to the regex
        # The regex accept the command with or without arguments
        $avaliable_commands_regex = "^docker (ps|images)(\s+.+)?$"
        }
    Process {
        # use $args to get all the input
        foreach($cmd in $args){
            $entire_command += " " + $cmd
        }
        # check if the command is in the list and show it with color
        if ($entire_command -match $avaliable_commands_regex) {
            $output = Invoke-Expression $entire_command
            $output | ColorizeOutput
        } else { # If not, execute the command and show the output whitout color
            Invoke-Expression $entire_command
        }

    }
}

# Export only the DockerColorPosh function
Export-ModuleMember -Function 'DockerColorPosh'
