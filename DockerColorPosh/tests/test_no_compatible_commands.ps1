Remove-Module docker_color_posh
Import-Module ..\docker_color_posh.psm1

$some_invalid_docker_commands = @("volume")

Write-Host "Executing invalid commands" -ForegroundColor Cyan
Write-Host "-----------------------------" -ForegroundColor DarkGray
for ($i = 0; $i -lt $some_invalid_docker_commands.Count; $i++) {
    $test_number = $i + 1
    Write-Host "Test ${test_number}: docker $($some_invalid_docker_commands[$i])" -ForegroundColor Red
    Invoke-Expression "DockerColorPosh $($some_invalid_docker_commands[$i])"
}

