# Set the encoding to UTF8 to avoid problems with special characters
$OutputEncoding = [Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8

# This function colorize the output of the docker command of the list type
# This function is called by the DockerColorPosh function
# This function is not intended to be called directly
function ColorizeTypeList {
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
# It´s for call the docker command and validate if the command is in a compatible list of commands and then colorize the output
# If the command is not in the list, the output will be shown without color
function DockerColorPosh {
    Begin {
        $entire_command = "docker"
        # This array contains the list of commands compatible with the module
        # You must not add the command "docker" before the command name or the arguments after the command name
        $docker_compatible_commands_type_list = @("(container ls|container list|container ps|ps)",
                                                  "(image ls|image list|images)",
                                                  "(volume ls|volume list)",
                                                  "(network ls|network list)",
                                                  "compose ps",
                                                  "system df")

        $docker_compatible_commands_type_response = @("volume create",
                                                      "(volume rm|volume remove)",
                                                      "(image rm|image remove|rmi)",
                                                      "(stop|container stop)",
                                                      "(start|container start)",
                                                      "(restart|container restart)")

        $docker_excluded_subcommands = @("(system df -v|system df --verbose)")

        # This regexs validates if the command is supported by the module.
        $regex_docker_commands_type_help = "^(docker .+ --help|docker --help)$"
        $regex_docker_excluded_subcommands = "^docker (" + ($docker_excluded_subcommands -join "|") + ")(\s+.+)?$"
        $regex_docker_commands_type_list = "^docker (" + ($docker_compatible_commands_type_list -join "|") + ")(\s+.+)?$"
        $regex_docker_commands_type_response = "^docker (" + ($docker_compatible_commands_type_response -join "|") + ")(\s+.+)?$"
        }
    Process {
        # use $args to get all the input
        foreach($cmd in $args){
            $entire_command += " " + $cmd
        }
        # Colorize the output with the apropiate colorize for each type of command
        if ($entire_command -match $regex_docker_commands_type_help){
            Invoke-Expression $entire_command | ForEach-Object { Write-Host $_ -ForegroundColor Green }
        }
        elseif ($entire_command -match $regex_docker_excluded_subcommands) {
            Invoke-Expression $entire_command
        }
        elseif ($entire_command -match $regex_docker_commands_type_list) {
            $output = Invoke-Expression $entire_command
            $output | ColorizeTypeList
        } elseif ($entire_command -match $regex_docker_commands_type_response){
            $output = Invoke-Expression $entire_command
            $output | ForEach-Object { Write-Host $_ -ForegroundColor Cyan }
            }
        else { # If not, execute the command and show the output whitout color
            Invoke-Expression $entire_command
        }

    }
}

# Export only the DockerColorPosh function
Export-ModuleMember -Function 'DockerColorPosh'
