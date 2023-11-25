function ColorizeOutput {
    Param(
        [Parameter(ValueFromPipeline=$true)]
        [string]$InputLine
    )

    Begin {
        # Inicializar un array vacío al empezar a recibir objetos del pipeline
        $array_lines = @()
    }

    Process {
        # Añadir cada línea del input al array
        $array_lines += $InputLine
    }

    End {
        for ($i = 0; $i -lt $array_lines.Count; $i++) {
            if ($i -eq 0) {
                Write-Host $array_lines[$i] -ForegroundColor Yellow
                continue
            }
            Write-Host "$($array_lines[$i])" -ForegroundColor Cyan
        }
    }
}
# chance the format

function DockerColorPosh {
    Begin {
        $entire_command = "docker"
        $avaliable_commands_regex = "^docker (ps|images)(\s+.+)?$"
        }
    Process {
        # use $args to get all the input
        foreach($cmd in $args){
            $entire_command += " " + $cmd
        }
        # check if the command is in the list and show it with color
        if ($entire_command -match $avaliable_commands_regex) {
            $output = Invoke-Expression $entire_command
            $output | ColorizeOutput
        } else { # If not, execute the command and show the output whitout color
            Invoke-Expression $entire_command
        }

    }
}
