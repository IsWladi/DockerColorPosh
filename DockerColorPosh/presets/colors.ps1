# General colors
$main_color = [System.ConsoleColor]::Cyan
$secondary_color = [System.ConsoleColor]::DarkCyan
$header_color = [System.ConsoleColor]::Yellow

# Help-type commands - specific colors

# List-type commands - specific colors

## Container-list-type subcommands
$containerStateColors = @{
    "Up" = [System.ConsoleColor]::Green
    "Exited" = [System.ConsoleColor]::Red
    "Other"= $color_command
}

# Response-type commands - specific colors

