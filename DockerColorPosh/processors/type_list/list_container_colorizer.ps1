function Write-ColorizedContainerTypeOutput {
    param (
            [Parameter(Mandatory = $true)]
            [string[]]$array_lines,
            [Parameter(Mandatory = $true)]
            [int]$i
          )

                if ($i -eq 0) {
                    Write-Host $array_lines[$i] -ForegroundColor $header_color
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

                $color_command = if ($i % 2 -eq 0) { $secondary_color} else { $main_color }

                $color_subcommand = if ($containerStatusColors[$container_state]) {
                    $containerStatusColors[$container_state]
                } else {
                    $color_command
                }

                # if the state it´s not Up or Exited, colorize it without resalt the state
                if ($container_state -eq "Other") {
                    Write-Host $array_lines[$i] -ForegroundColor $color_command
                } else {

                $left_part, $sub_cmd, $right_part = Split-SubExpressionRegex -full_cmd $array_lines[$i] -regex $container_state
                Write-SubExpressionRegex -left_part $left_part -sub_cmd $sub_cmd -right_part $right_part -main_color $color_command -sub_cmd_color $color_subcommand

                }
}
