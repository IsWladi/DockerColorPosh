function Write-ColorizedListTypeOutput {
    param (
            [Parameter(Mandatory = $true)]
            [string[]]$array_lines,
            [Parameter(Mandatory = $true)]
            [int]$i
          )
            # if the line is the first one, colorize it with $header_color
                if ($i -eq 0) {
                    Write-Host $array_lines[$i] -ForegroundColor $header_color
                        return
                }
            # if the line is pair, colorize it better readability
                if ($i % 2 -eq 0) {
                    Write-Host $($array_lines[$i]) -ForegroundColor $secondary_color
                        return
                }
            # if the line is impair, colorize it better readability
                Write-Host $($array_lines[$i]) -ForegroundColor $main_color
}
