# Extract the subcommand from the full command if exists
# Return an array of strings; left_part, sub_cmd, right_part
function ParseSubExpressionRegex {
    Param(
        [Parameter(Mandatory=$true)]
        [string]$full_cmd,

        [Parameter(Mandatory=$true)]
        [string]$regex
    )
    # Get the subcommand from the full command if exists
    $sub_cmd_match = $full_cmd | Select-String -Pattern $regex

    $sub_cmd = $sub_cmd_match.Matches.Value
    $left_part = $full_cmd.Substring(0, $sub_cmd_match.Matches[0].Index)
    $right_part = $full_cmd.Substring($sub_cmd_match.Matches[0].Index + $sub_cmd_match.Matches[0].Length)

    # returnan array of strings
    return $left_part, $sub_cmd, $right_part
    }

# Colorize the subcommand in the full command
# It will colorize the subcommand and the left and right parts of the full command
# The right part is optional
# Its ideal to use this function with the output of the function ParseSubExpressionRegex
function PrintParsedSubExpressionRegex {
    Param(
        #colors
        [Parameter(Mandatory=$true)]
        [string]$main_color,

        [Parameter(Mandatory=$true)]
        [string]$sub_cmd_color,

        [Parameter(Mandatory=$false)]
        [string]$left_part,

        [Parameter(Mandatory=$true)]
        [string]$sub_cmd,

        [Parameter(Mandatory=$false)]
        [string]$right_part

    )
    Write-Host $left_part -ForegroundColor $main_color -NoNewline
    Write-Host $sub_cmd -ForegroundColor $sub_cmd_color -NoNewline
    if ($right_part) {
        Write-Host $right_part -ForegroundColor $main_color
    }

    }
