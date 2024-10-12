# sdl-tutorial

This project sets up a development environment for SDL (Simple
DirectMedia Layer) using Docker. It allows you to develop SDL
applications in a containerized Debian environment, which can be run on
both Windows and Linux hosts.

## Prerequisites

- Docker installed on your system
- X server (VcXsrv for Windows, built-in for Linux)

## Dockerfile Explanation

The `Dockerfile` in this project sets up a Debian-based environment with
SDL2 and necessary development tools. Here's a breakdown of what it
does:

1. Uses Debian Bullseye as the base image
2. Installs essential development tools, SDL2 libraries, and X11
   utilities
3. Sets up a non-root user named 'devuser'
4. Installs and configures Zsh with Oh My Zsh
5. Sets up the working directory and environment for X11 forwarding

## Building the Docker Image

To build the Docker image, run the following command in the directory
containing the Dockerfile:

```bash
docker build -t sdl-dev .
```

This command builds the Docker image and tags it as 'sdl-dev'.

## Running the Docker Container

To run the Docker container, use the following command:

```bash
docker run -it --rm --name sdl-dev-container \
    -v $(pwd):/workspace \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    sdl-dev
```

This command does the following:
- `-it`: Runs the container interactively with a pseudo-TTY
- `--rm`: Automatically removes the container when it exits
- `--name sdl-dev-container`: Names the container for easy reference
- `-v $(pwd):/workspace`: Mounts the current directory to /workspace in
  the container
- `-e DISPLAY=$DISPLAY`: Sets the DISPLAY environment variable for X11
  forwarding
- `-v /tmp/.X11-unix:/tmp/.X11-unix`: Mounts the X11 socket for graphics
  forwarding

## Additional Setup for Windows Users

If you're using Windows:

1. Install VcXsrv Windows X Server
2. Launch XLaunch and configure it (Multiple windows, Display number 0,
   Start no client, Disable access control)
3. Find your IP address using `ipconfig` in Command Prompt
4. Modify the Docker run command:

```bash
docker run -it --rm --name sdl-dev-container \
    -v %cd%:/workspace \
    -e DISPLAY=YOUR_IP:0.0 \
    sdl-dev
```

Replace `YOUR_IP` with your actual IP address.

## Exiting the Container

To exit the container, simply type `exit` or use the `Ctrl+D` shortcut.

## Troubleshooting

If you encounter issues with X11 forwarding:
- On Linux, ensure you've run `xhost +local:docker` before starting the
  container
- On Windows, check that VcXsrv is running and your firewall isn't
  blocking connections

