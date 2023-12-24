# This function is used to colorize the "-" and "--" flags in the help command
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
            $left_part, $sub_cmd, $right_part = ParseSubExpressionRegex -full_cmd $full_cmd -regex $to_extract[$i]
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
