# Import scripts

## Charge presets
. $PSScriptRoot/utility/color_charge.ps1
## List-type scripts
. $PSScriptRoot/processors/type_list/list_processor.ps1
. $PSScriptRoot/processors/type_list/list_container_colorizer.ps1
. $PSScriptRoot/processors/type_list/list_colorizer.ps1

## Help-type scripts
. $PSScriptRoot/processors/type_help/help_processor.ps1
. $PSScriptRoot/processors/type_help/help_colorizer.ps1

## Response-type scripts
. $PSScriptRoot/processors/type_response/response_processor.ps1
. $PSScriptRoot/processors/type_response/response_colorizer.ps1

## Utility scripts
. $PSScriptRoot/utility/utility_functions.ps1

# Set the encoding to UTF8 to avoid problems with special characters
$OutputEncoding = [Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8


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
            $output = Invoke-Expression $entire_command
            $output | Format-TypeHelpCommand
        }

        elseif ($entire_command -match $regex_docker_excluded_subcommands) {
            Invoke-Expression $entire_command
        }

        elseif ($entire_command -match $regex_docker_commands_type_list) {
            $output = Invoke-Expression $entire_command
            $output | Format-TypeListCommand

        } elseif ($entire_command -match $regex_docker_commands_type_response){
            $output = Invoke-Expression $entire_command
            $output | Format-TypeResponseCommand
            }
        else { # If not, execute the command and show the output whitout color
            Invoke-Expression $entire_command
        }

    }
}

# Integrate the DockerCompletion module with the DockerColorPosh module
# This function has to be called after the DockerCompletion module is installed
# DockerCompletion module: https://github.com/matt9ucci/DockerCompletion
function Enable-DockerCompletionWithinDockerColorPosh{
    # Import and get the DockerCompletion's PSModuleInfo
    Import-Module DockerCompletion
    [System.Management.Automation.PSModuleInfo]$DockerCompletion = Get-Module DockerCompletion

    # Get the `$argumentCompleter` from the DockerCompletion's PSModuleInfo.
    # The `$argumentCompleter` is the scriptblock for `docker` command.
    # It is not an exported variable, but we can access it with the `PSModuleInfo.Invoke()` method like this.
    [scriptblock]$completer = $DockerCompletion.Invoke({ $argumentCompleter })

    # Register the `$argumentCompleter` for DockerColorPosh
    Register-ArgumentCompleter -CommandName DockerColorPosh -ScriptBlock $completer
    # get all the aliases for the DockerColorPosh function
    $aliases = (Get-Alias -Definition DockerColorPosh -ErrorAction SilentlyContinue).Name
    # Register the `$argumentCompleter` for each alias
    foreach ($alias in $aliases){
        Register-ArgumentCompleter -CommandName $alias -ScriptBlock $completer
    }
}

# This function is for open the color-scheme file and being able to edit it by the user
function Open-ColorSchemeFile {
    Write-Host "Opening the color scheme file at $colorSchemeFilePath"
    Start-Process colorSchemeFilePath

}
