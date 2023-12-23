$ModulePath = "$PSScriptRoot\DockerColorPosh"
Publish-Module -Path $ModulePath -NuGetApiKey $Env:API_KEY
