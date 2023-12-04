# 🌈 Docker Color Posh: A Splash of Color to Your Docker Console 🚀
Make Your Docker Console Come Alive!
Welcome to the vibrant world of Docker Color Posh, a PowerShell script crafted to transform your Docker console into a kaleidoscope of colors! 🎨 This nifty module isn't just about looks; it's about making your Docker command outputs not only eye-catching but also incredibly easy to read and understand. Dive into a Docker experience where each output becomes a vivid story, helping you quickly identify and interpret various elements with ease.

# Why Docker Color Posh? Because Your Console Deserves to be Fun! 🎉
Our philosophy is simple: Docker is awesome, so why not make it visually awesome too? With docker_color_posh, you'll stick to what you know and love about Docker, but with an added zest of color. It's not just a module; it's your Docker experience, reimagined!

- 🚦 Non-Intrusive Yet Fashionable: It's like having a new paint job that doesn't change the engine. Our module is a stylish output formatter that works with your Docker commands without altering their essence.
- 🌐 Compatibility Meets Flexibility: Fear not if a command doesn't suit up in our color scheme; it will still run just as smoothly, minus the color flair. You get the best of both worlds - the complete Docker command set, with or without our colorful touch.

# Project Status
As of now, the Docker Color Posh module is in its initial stages of development. Further enhancements and feature additions are planned.
![image](https://github.com/IsWladi/Docker-Color-Posh/assets/133131317/327df00a-aa68-4b77-9745-ba3ae631ad62)

# Table of contents
- [Module´s presentation](https://github.com/IsWladi/Docker-Color-Posh/#-docker-color-posh-a-splash-of-color-to-your-docker-console-)
- [Compatible Docker commands](https://github.com/IsWladi/Docker-Color-Posh/#compatible-docker-commands)
- [Excluded subcommands](https://github.com/IsWladi/Docker-Color-Posh/#excluded-subcommands)
- [Installation](https://github.com/IsWladi/Docker-Color-Posh/#installation)
- [Integration with the matt9ucci/DockerCompletion module (optional)](https://github.com/IsWladi/Docker-Color-Posh/#integration-with-the-matt9uccidockercompletion-module-optional)
- [Usage](https://github.com/IsWladi/Docker-Color-Posh/#usage)
- [Contributing](https://github.com/IsWladi/Docker-Color-Posh/#contributing)
- [License](https://github.com/IsWladi/Docker-Color-Posh/#license)
  
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

## Installation
To install the Docker Color Posh module and ensure its automatic loading in your PowerShell sessions, follow these steps:
1. Download the `docker_color_posh.psm1` file from the repository.
2. Import the module into your PowerShell session using the command: `Import-Module -Name /path/to/docker_color_posh.psm1`
3. For convenience, you can create an alias. This allows you to use your preferred shortcut for the commands. To set up an alias, use: `Set-Alias d DockerColorPosh`
4. To make the module load automatically in future sessions, add the import command and your alias to your PowerShell profile.
5. After adding this line to your profile, the module will be automatically loaded in all future PowerShell sessions, making it ready to use immediately.
6. Powershell profile example:
    ```powershell
      Import-Module -Name C:\your\path\to\docker-color-posh\docker_color_posh.psm1
      Set-Alias d DockerColorPosh
     ```



## Integration with the [matt9ucci/DockerCompletion](https://github.com/matt9ucci/DockerCompletion) module (optional)
**The DockerCompletion is a PowerShell module that provides tab completion for Docker commands. It is not required to use Docker Color Posh, but it is recommended for a better user experience.**
1. After installing the Docker Color Posh Module, [install the DockerCompletion module](https://github.com/matt9ucci/DockerCompletion#installation)
2. Execute the following line in your terminal to integrate the DockerCompletion module with Docker Color Posh: `Invoke-Expression IntegrateDockerCompletion`
3. To permanently integrate, add the line to your PowerShell profile. Make sure the line 'Invoke-Expression IntegrateDockerCompletion' is placed after the DockerColorPosh module's alias has been set up.
4. Powershell profile example:
    ```powershell
      Import-Module -Name C:\your\path\to\docker-color-posh\docker_color_posh.psm1
      Set-Alias d DockerColorPosh
      Invoke-Expression IntegrateDockerCompletion
     ```


## Usage
**The Docker Color Posh module enhances Docker command outputs with color and accepts any arguments. If a command is not supported, it will execute normally without colorization. Moreover, if you have installed and integrated the DockerCompletion module, you'll enjoy the best of both worlds: completion and colorized outputs!**

To use the module, you can invoke it directly with commands such as (replace `DockerColorPosh` with your alias if you have set one):
- `DockerColorPosh ps`
- `DockerColorPosh ps -a`
- `DockerColorPosh images`

## Contributing
Contributions to the Docker Color Posh module are warmly welcomed. If you have suggestions for improvements or new features, feel free to create an issue or submit a pull request on the project's repository.

## License
A short and simple permissive license with conditions only requiring preservation of copyright and license notices. Licensed works, modifications, and larger works may be distributed under different terms and without source code.
