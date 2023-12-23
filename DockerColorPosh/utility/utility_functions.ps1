function ParseSubExpressionRegex {
    Param(
        [Parameter(Mandatory=$true)]
        [string]$full_cmd,

        [Parameter(Mandatory=$true)]
        [string]$regex,

        [Parameter(Mandatory=$true)]
        [string]$sub_cmd_color,

        [Parameter(Mandatory=$true)]
        [string]$main_color
    )
    # Get the subcommand from the full command if exists
    $sub_cmd_match = $full_cmd | Select-String -Pattern $regex

    $sub_cmd = $sub_cmd_match.Matches.Value
    $left_part = $full_cmd.Substring(0, $sub_cmd_match.Matches[0].Index)
    $right_part = $full_cmd.Substring($sub_cmd_match.Matches[0].Index + $sub_cmd_match.Matches[0].Length)

    Write-Host $left_part -ForegroundColor $main_color -NoNewline
    Write-Host $sub_cmd -ForegroundColor $sub_cmd_color -NoNewline
    Write-Host $right_part -ForegroundColor $main_color
    }
