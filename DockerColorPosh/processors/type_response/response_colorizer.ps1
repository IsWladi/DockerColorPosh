function Write-ColorizedResponseTypeOutput {
    param (
            [Parameter(Mandatory = $true)]
            [string[]]$array_lines,
            [Parameter(Mandatory = $true)]
            [int]$i
          )
    Write-Host $array_lines[$i] -ForegroundColor $main_color

}
