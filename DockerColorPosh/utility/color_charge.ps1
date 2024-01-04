# Path to the module color scheme file (JSON format)
# No edit this file, you can create a new color scheme in a external file
$colorSchemeFilePath = "$PSScriptRoot\..\presets\colors.json"

# Path to the target color scheme file (of the module or custom if exists)
$targetColorSchemeFilePath = if ($null -eq $dcpCustomColorSchemePath) {$colorSchemeFilePath} else {$dcpCustomColorSchemePath}

# by default, use the DEFAULT color scheme
# if the user has set a color scheme, use it
# The $dcpColorScheme variable applies to both the module and custom color schemes, based on $targetColorSchemeFilePath.
$colorScheme = if ($null -eq $dcpColorScheme) { "DARK" } else { $dcpColorScheme }

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
$SchemeConfigFile = $null

# Check if the color scheme file exists
$useDefaultColorScheme = $false
if (Test-Path -Path $targetColorSchemeFilePath) {
    $SchemeConfigFile = Get-Content -Path $targetColorSchemeFilePath | ConvertFrom-Json
} else {
    Write-Warning "Color scheme file not found. Using default configuration file instead."
    $SchemeConfigFile = Get-Content -Path $colorSchemeFilePath | ConvertFrom-Json
    $useDefaultColorScheme = $true
}

# Check if the color scheme is well defined
# Get the list of color schemes
$colorSchemesList = @()

foreach ($scheme in $SchemeConfigFile.ColorSchemes.PSObject.Properties.Name) {
    $colorSchemesList += $scheme
}
# validate the color scheme with the list of color schemes
if ($null -ne $dcpColorScheme -and $colorSchemesList -notcontains $dcpColorScheme  ) {
    if ($useDefaultColorScheme) {
        Write-Warning "Theme '$dcpColorScheme' not found in the default scheme configuration file. Using 'DARK' theme instead."
    }
    else {
        Write-Warning "Theme '$dcpColorScheme' not found in the $targetColorSchemeFilePath custom configuration file. Using default configuration instead."
    }

    $SchemeConfigFile = Get-Content -Path $colorSchemeFilePath | ConvertFrom-Json
    $colorScheme = "DARK"
}

$SchemeConfigFile = $SchemeConfigFile.ColorSchemes.$colorScheme

# Assign colors
#
# General colors
$main_color = Convert-ToConsoleColor $SchemeConfigFile.GeneralColors.MainColor
$secondary_color = Convert-ToConsoleColor $SchemeConfigFile.GeneralColors.SecondaryColor
$header_color = Convert-ToConsoleColor $SchemeConfigFile.GeneralColors.HeaderColor
#
# Help colors
$help_flag_color = Convert-ToConsoleColor $SchemeConfigFile.HelpTypeCommands.HelpFlagColor
$help_header_color = Convert-ToConsoleColor $SchemeConfigFile.HelpTypeCommands.HelpHeaderColor
#
# List colors
## Container list colors
$container_status_up_color = Convert-ToConsoleColor $SchemeConfigFile.ListTypeCommands.ContainerListSubcommands.Up
$container_status_exited_color = Convert-ToConsoleColor $SchemeConfigFile.ListTypeCommands.ContainerListSubcommands.Exited
$containerStatusColors = @{
    "Up" = $container_status_up_color
    "Exited" = $container_status_exited_color
}
