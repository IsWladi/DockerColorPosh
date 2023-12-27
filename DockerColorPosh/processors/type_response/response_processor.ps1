function Format-TypeResponseCommand {
    Param(
        [Parameter(ValueFromPipeline=$true)]
        [string]$InputLine
    )

    Begin {
        # Create an array to store each line of the docker command output
        $array_lines = @()
    }

    Process {
        # Add each line to the array
        $array_lines += $InputLine
    }

    End {
        for ($i = 0; $i -lt $array_lines.Count; $i++) {
            Write-ColorizedResponseTypeOutput -array_lines $array_lines -i $i
        }
    }
}
