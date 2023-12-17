function ColorizeTypeList {
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
        # if the list is of type "container list"
        if ($array_lines[0] -match "CONTAINER ID") {
            for ($i = 0; $i -lt $array_lines.Count; $i++) {
                ContainerFormatter -array_lines $array_lines -i $i
            }
            }
        else {
            for ($i = 0; $i -lt $array_lines.Count; $i++) {
                GenericFormatter -array_lines $array_lines -i $i
            }
            }
    }
}
