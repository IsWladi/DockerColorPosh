$docker_compatible_commands_type_list = @("(container ls|container list|container ps|ps)",
        "(image ls|image list|images)",
        "(volume ls|volume list)",
        "(network ls|network list)",
        "compose ps",
        "system df")

$big_string_commands = ""
for ($i = 0; $i -lt $docker_compatible_commands_type_list.Count; $i++) {
    $docker_compatible_commands_type_list[$i] = $docker_compatible_commands_type_list[$i].Replace("(", "")
    $docker_compatible_commands_type_list[$i] = $docker_compatible_commands_type_list[$i].Replace(")", "")
    $docker_compatible_commands_type_list[$i] = $docker_compatible_commands_type_list[$i].Replace("|", ",")

    if ($i -eq 0) {
        $big_string_commands = $docker_compatible_commands_type_list[$i]
    } else {
        $big_string_commands += "," + $docker_compatible_commands_type_list[$i]
    }
}
$big_array_commands = $big_string_commands.Split(",")

$test_number = 0

Write-Host "Executing compatible commands" -ForegroundColor Cyan
Write-Host "-----------------------------" -ForegroundColor DarkGray

#type list
Write-Host "Executing commands list type" -ForegroundColor Cyan
for ($i = 0; $i -lt $big_array_commands.Count; $i++) {
    $test_number += 1
    Write-Host "Test ${test_number}: docker $($big_array_commands[$i])" -ForegroundColor Green
    Invoke-Expression "DockerColorPosh $($big_array_commands[$i])"
}
