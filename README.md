# Docker Color Posh PowerShell Module

## Overview
The Docker Color Posh module, a PowerShell script, is designed to enhance the visual presentation of Docker command outputs. By colorizing the output, it aims to improve readability and user experience, making it easier to identify and understand various components of the Docker output.

## Project Status
As of now, the Docker Color Posh module is in its initial stages of development. Further enhancements and feature additions are planned.

## Installation
To install the Docker Color Posh module and ensure its automatic loading in your PowerShell sessions, follow these steps:
1. Download the `docker_color_posh.psm1` file from the repository.
2. Import the module into your PowerShell session using the command: `Import-Module -Name /path/to/docker_color_posh.psm1`
3. To make the module load automatically in future sessions, add the import command to your PowerShell profile.
4. After adding this line to your profile, the module will be automatically loaded in all future PowerShell sessions, making it ready to use immediately.

## Usage
The Docker Color Posh module enhances Docker command outputs with color. Currently, it supports colorization for `docker ps` and `docker images` commands, accepting any arguments. If a command is not supported, it will execute normally without colorization.

To use the module, you can invoke it directly with commands such as:
- `DockerColorPosh ps`
- `DockerColorPosh ps -a`
- `DockerColorPosh images`

For convenience, you can create an alias in your PowerShell profile. This allows you to use your preferred shortcut for the commands. To set up an alias, use:

## Contributing
Contributions to the Docker Color Posh module are warmly welcomed. If you have suggestions for improvements or new features, feel free to create an issue or submit a pull request on the project's repository.
