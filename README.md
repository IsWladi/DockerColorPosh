# IMPORTANT
**This repository has been archived because I no longer use Docker on Windows; I have migrated to WSL2. Feel free to fork the repository and use this module.**
<div align="center">
   
# DockerColorPosh
##### Colorful Docker outputs for enhanced readability.

<img alt="DockerColorPosh logo" height="280" src="/assets/DockerColorPoshLogo.png" />
</div>

## Table of contents
* [Module´s presentation](#-docker-color-posh-a-splash-of-color-to-your-docker-console-)
* [Project Status](#project-status)
* [Installation](#installation)
    * [Integration with the matt9ucci/DockerCompletion module (optional)](#integration-with-the-matt9uccidockercompletion-module-optional)
* [Usage](#usage)
* [Compatible Docker commands](#compatible-docker-commands)
* [Excluded subcommands](#excluded-subcommands)
* [Contributing](#contributing)
* [Disclaimer](#disclaimer)
* [License](#license)

## 🌈 Docker Color Posh: A Splash of Color to Your Docker Console 🚀
Make Your Docker Console Come Alive!
Welcome to the vibrant world of Docker Color Posh, a PowerShell script crafted to transform your Docker console into a kaleidoscope of colors! 🎨 This nifty module isn't just about looks; it's about making your Docker command outputs not only eye-catching but also incredibly easy to read and understand. Dive into a Docker experience where each output becomes a vivid story, helping you quickly identify and interpret various elements with ease.

## Why Docker Color Posh? Because Your Console Deserves to be Fun! 🎉
Our philosophy is simple: Docker is awesome, so why not make it visually awesome too? With docker_color_posh, you'll stick to what you know and love about Docker, but with an added zest of color. It's not just a module; it's your Docker experience, reimagined!

- 🚦 Non-Intrusive Yet Fashionable: It's like having a new paint job that doesn't change the engine. Our module is a stylish output formatter that works with your Docker commands without altering their essence.
- 🌐 Compatibility Meets Flexibility: Fear not if a command doesn't suit up in our color scheme; it will still run just as smoothly, minus the color flair. You get the best of both worlds - the complete Docker command set, with or without our colorful touch.

## Project Status
- As of now, the Docker Color Posh module is in its initial stages of development. Further enhancements and feature additions are planned.
- The module can already color a significant number of Docker [commands](#compatible-docker-commands), and it features compatibility and integration with the DockerCompletion tab completion module.
- Currently, the most complete coloring is available for list-type commands (e.g., `docker ps`, `docker volume ls`, `docker network ls`) and help-type commands (e.g., `docker <command> --help`).
- Response-type commands (e.g., `docker container start`, `docker rmi`) have coloring support but it is quite basic at the moment.
- Process-type commands (e.g., `docker build`, `docker run`, `docker pull`) are not compatible for coloring. Due to the complexity of coloring interactive and animated responses that are handled by Docker itself, the module does not intend to add coloring for these types of commands in the future. Docker already stylizes these commands with some colors and animations.
<div align="center">
  <img src="/assets/screenshots/docker_ps_all.png" alt="List-type: docker ps -a"/>
</div>


## Installation

To install the Docker Color Posh module and ensure it's automatically loaded in your PowerShell sessions, follow these steps:

1. Install the module into your PowerShell using the command:
   ```powershell
   Install-Module -Name DockerColorPosh
   ```

2. (Optional) For convenience, you can create an alias. This allows you to use your preferred shortcut for the commands. To set up an alias, use for example:
   ```powershell
   Set-Alias d DockerColorPosh
   ```

3. PowerShell profile example (for explicit loading):
   ```powershell
   Import-Module -Name DockerColorPosh
   Set-Alias d DockerColorPosh
   ```
   * After adding these lines to your profile, the module will be automatically loaded in all future PowerShell sessions, making it ready to use immediately.
   * For PowerShell 3.0 and above, the module will be automatically imported when any command from the module is used in a session, so you may not need to add the import command to your profile.

### Integration with the [matt9ucci/DockerCompletion](https://github.com/matt9ucci/DockerCompletion) module (optional)
**The DockerCompletion is a PowerShell module that provides tab completion for Docker commands. It is not required to use Docker Color Posh, but it is recommended for a better user experience.**
1. After installing the Docker Color Posh Module, [install the DockerCompletion module](https://github.com/matt9ucci/DockerCompletion#installation)
2. Execute the following line in your terminal to integrate the DockerCompletion module with Docker Color Posh: `IntegrateDockerCompletionWithDockerColorPosh`
3. To permanently integrate, add the line to your PowerShell profile. Make sure the line 'Invoke-Expression IntegrateDockerCompletion' is placed after the DockerColorPosh module's alias has been set up.
4. Powershell profile example:
    ```powershell
      Import-Module -Name DockerColorPosh
      Set-Alias d DockerColorPosh
      IntegrateDockerCompletionWithDockerColorPosh
     ```

## Usage
**The Docker Color Posh module enhances Docker command outputs with color and accepts any arguments. If a command is not supported, it will execute normally without colorization. Moreover, if you have installed and integrated the DockerCompletion module, you'll enjoy the best of both worlds: completion and colorized outputs!**

To use the module, you can invoke it directly with commands such as (replace `DockerColorPosh` with your alias if you have set one):
- `DockerColorPosh ps`
- `DockerColorPosh ps -a`
- `DockerColorPosh images`

## Compatible Docker commands
**It's important to note that while these are the primary commands supported, the module is designed to accommodate additional parameters for these commands, as with standard Docker usage. For example, you can use docker ps -a to list all containers, and the output will be colorized accordingly.**

| Command Type | Command |
|-----------------|---------|
| List | `docker container ls` |
| List | `docker container list` |
| List | `docker container ps` |
| List | `docker ps` |
| List | `docker image ls` |
| List | `docker image list` |
| List | `docker images` |
| List | `docker volume ls` |
| List | `docker volume list` |
| List | `docker network ls` |
| List | `docker network list` |
| List | `docker compose ps` |
| List | `docker system df` |
| Response | `docker volume create` |
| Response | `docker volume rm` |
| Response | `docker volume remove` |
| Response | `docker image rm` |
| Response | `docker image remove` |
| Response | `docker rmi` |
| Response | `docker container stop` |
| Response | `docker stop` |
| Response | `docker container start` |
| Response | `docker start` |
| Response | `docker container restart` |
| Response | `docker restart` |
| Help | `docker --help` |
| Help | `docker <command> --help` |

## Excluded subcommands
**Note: The excluded subcommands may be included in future versions of the application.**
| Command Type | Subcommand |
|--------------|------------|
| List | `docker system df -v` |
| List | `docker system df --verbose` |

## Contributing
Contributions to the Docker Color Posh module are warmly welcomed. If you have suggestions for improvements or new features, feel free to create an issue or submit a pull request on the project's repository.

## Disclaimer

"Docker Color Posh" is an independent project created by IsWladi. This module is not sponsored, endorsed by, or affiliated with Docker, Inc. or its affiliates in any way. Docker is a registered trademark of Docker, Inc. and is mentioned here only for descriptive purposes and with no intention of infringement. This module is an independent effort to enhance the user experience in using Docker and does not imply any legal, commercial, or economic relationship with Docker, Inc.

## License
A short and simple permissive license with conditions only requiring preservation of copyright and license notices. Licensed works, modifications, and larger works may be distributed under different terms and without source code.
