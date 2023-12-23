function ContainerFormatter {
    param (
            [Parameter(Mandatory = $true)]
            [string[]]$array_lines,
            [Parameter(Mandatory = $true)]
            [int]$i
          )

                if ($i -eq 0) {
                    Write-Host $array_lines[$i] -ForegroundColor Yellow
                        return
                }
                # determine the state of the container
                # One of created, restarting, running, removing, paused, exited, or dead
                $container_state = "Other"# Prevents the variable from being null

                # check every state possible and assign it to the variable
                if ($array_lines[$i] -match "Up") {
                    $container_state = "Up"
                } elseif ($array_lines[$i] -match "Exited") {
                    $container_state = "Exited"
                }

                $color_command = if ($i % 2 -eq 0) { "DarkCyan" } else { "Cyan" }

                # Create a hashtable to store the colors of each state
                $stateColors = @{
                        "Up" = "Green"
                        "Exited" = "Red"
                        "Other"= $color_command
                }
                $color_subcommand = $stateColors[$container_state]

                # if the state it´s not Up or Exited, colorize it without resalt the state
                if ($container_state -eq "Other") {
                    Write-Host $array_lines[$i] -ForegroundColor $color_command
                } else {
                ParseSubExpressionRegex -full_cmd $array_lines[$i] -regex $container_state -sub_cmd_color $color_subcommand -main_color $color_command
                }
}
