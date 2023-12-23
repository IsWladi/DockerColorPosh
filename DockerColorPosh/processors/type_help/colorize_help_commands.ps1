function ParseSubExpressionRegex2 {
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

    # returnan array of strings
    return $left_part, $sub_cmd, $right_part
    }

function PrintParsedSubExpressionRegex {
    Param(
        [Parameter(Mandatory=$false, Position=0)]
        [string]$left_part,

        [Parameter(Mandatory=$true, Position=1)]
        [string]$sub_cmd,

        #colors
        [Parameter(Mandatory=$true, Position=2)]
        [string]$main_color,

        [Parameter(Mandatory=$true, Position=3)]
        [string]$sub_cmd_color

    )
    Write-Host $left_part -ForegroundColor $main_color -NoNewline
    Write-Host $sub_cmd -ForegroundColor $sub_cmd_color -NoNewline

    }

# This function is used to colorize the flags in the help command
function ColorizeFlagsInHelpCommands {
    Param(
        [Parameter(Mandatory=$true)]
        [string]$full_cmd,

        [Parameter(Mandatory=$true)]
        [System.Collections.ArrayList]$to_extract,

        [Parameter(Mandatory=$true)]
        [System.Collections.ArrayList]$regex,

        [Parameter(Mandatory=$true)]
        [string]$sub_cmd_color,

        [Parameter(Mandatory=$true)]
        [string]$main_color
    )
    $i = 0
    foreach ($reg in $regex) {
        if ($full_cmd -match $reg){
            $left_part, $sub_cmd, $right_part = ParseSubExpressionRegex2 -full_cmd $full_cmd -regex $to_extract[$i] -sub_cmd_color $sub_cmd_color -main_color $main_color
            PrintParsedSubExpressionRegex -left_part $left_part -sub_cmd $sub_cmd -main_color $main_color -sub_cmd_color $sub_cmd_color
            $full_cmd = $right_part
            }
        else {
            $i++
            continue
            }
        $i++
        }
    Write-Host $full_cmd -ForegroundColor $main_color

    }
