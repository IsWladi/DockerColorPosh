# 🌈 Docker Color Posh: A Splash of Color to Your Docker Console 🚀
Make Your Docker Console Come Alive!
Welcome to the vibrant world of Docker Color Posh, a PowerShell script crafted to transform your Docker console into a kaleidoscope of colors! 🎨 This nifty module isn't just about looks; it's about making your Docker command outputs not only eye-catching but also incredibly easy to read and understand. Dive into a Docker experience where each output becomes a vivid story, helping you quickly identify and interpret various elements with ease.

# Why Docker Color Posh? Because Your Console Deserves to be Fun! 🎉
Our philosophy is simple: Docker is awesome, so why not make it visually awesome too? With docker_color_posh, you'll stick to what you know and love about Docker, but with an added zest of color. It's not just a module; it's your Docker experience, reimagined!

- 🚦 Non-Intrusive Yet Fashionable: It's like having a new paint job that doesn't change the engine. Our module is a stylish output formatter that works with your Docker commands without altering their essence.
- 🌐 Compatibility Meets Flexibility: Fear not if a command doesn't suit up in our color scheme; it will still run just as smoothly, minus the color flair. You get the best of both worlds - the complete Docker command set, with or without our colorful touch.

## Project Status
As of now, the Docker Color Posh module is in its initial stages of development. Further enhancements and feature additions are planned.
![image](https://github.com/IsWladi/Docker-Color-Posh/assets/133131317/327df00a-aa68-4b77-9745-ba3ae631ad62)


## Compatibility
The module is currently compatible with the following Docker commands:
 - `docker ps`
 - `docker images`

It's important to note that while these are the primary commands supported, the module is designed to accommodate additional parameters for these commands, as with standard Docker usage. For example, you can use docker ps -a to list all containers, and the output will be colorized accordingly.

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

For convenience, you can create an alias in your PowerShell profile. This allows you to use your preferred shortcut for the commands. To set up an alias, use: `Set-Alias d DockerColorPosh`

## Contributing
Contributions to the Docker Color Posh module are warmly welcomed. If you have suggestions for improvements or new features, feel free to create an issue or submit a pull request on the project's repository.

## License
A short and simple permissive license with conditions only requiring preservation of copyright and license notices. Licensed works, modifications, and larger works may be distributed under different terms and without source code.
