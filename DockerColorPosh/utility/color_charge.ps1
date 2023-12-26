$colorSchemeFilePath = "$PSScriptRoot\..\presets\colors.json"
# Function to convert the color in text to ConsoleColor
function Convert-ToConsoleColor($colorName) {
    [System.ConsoleColor]$resultColor = [System.ConsoleColor]::White
    if ([System.ConsoleColor]::TryParse($colorName, [ref]$resultColor)) {
        return $resultColor
    } else {
        Write-Warning "Color '$colorName' not found. Using default color."
        return [System.ConsoleColor]::White
    }
}

# Charge the configuration from the JSON file
$config = Get-Content -Path $colorSchemeFilePath | ConvertFrom-Json

# Assign colors
#
# General colors
$main_color = Convert-ToConsoleColor $config.GeneralColors.MainColor
$secondary_color = Convert-ToConsoleColor $config.GeneralColors.SecondaryColor
$header_color = Convert-ToConsoleColor $config.GeneralColors.HeaderColor
#
# Help colors
$help_flag_color = Convert-ToConsoleColor $config.HelpTypeCommands.HelpFlagColor
$help_header_color = Convert-ToConsoleColor $config.HelpTypeCommands.HelpHeaderColor
#
# List colors
## Container list colors
$container_status_up_color = Convert-ToConsoleColor $config.ListTypeCommands.ContainerListSubcommands.Up
$container_status_exited_color = Convert-ToConsoleColor $config.ListTypeCommands.ContainerListSubcommands.Exited
$containerStatusColors = @{
    "Up" = $container_status_up_color
    "Exited" = $container_status_exited_color
}
