# Path to the module color scheme file (JSON format)
# No edit this file, you can create a new color scheme in a external file
$colorSchemeFilePath = "$PSScriptRoot\..\presets\colors.json"

# Path to the target color scheme file (of the module or custom if exists)
$targetColorSchemeFilePath = if ($null -eq $dcpCustomColorSchemePath) {$colorSchemeFilePath} else {$dcpCustomColorSchemePath}
Write-Warning "targetColorSchemeFilePath: $targetColorSchemeFilePath"

# by default, use the DEFAULT color scheme
# if the user has set a color scheme, use it
# The $dcpColorScheme variable applies to both the module and custom color schemes, based on $targetColorSchemeFilePath.
$colorScheme = if ($null -eq $dcpColorScheme) { "DARK" } else { $dcpColorScheme }
Write-Warning "colorScheme: $colorScheme"

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
$config = Get-Content -Path $targetColorSchemeFilePath | ConvertFrom-Json

# Check if the color scheme is well defined
# Get the list of color schemes
$colorSchemesList = @()
    foreach ($scheme in $config.ColorSchemes.PSObject.Properties.Name) {
        $colorSchemesList += $scheme
    }
# validate the color scheme with the list of color schemes
if ($null -ne $dcpColorScheme -and $colorSchemesList -notcontains $dcpColorScheme  ) {
    Write-Warning "Color scheme '$dcpColorScheme' not found in the $targetColorSchemeFilePath file. Using default configuration instead."
        $config = Get-Content -Path $colorSchemeFilePath | ConvertFrom-Json
        $colorScheme = "DARK"
}

$config = $config.ColorSchemes.$colorScheme

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
