#!/bin/bash

docker run -it --rm --name sdl-dev-container \
    -v $(pwd):/workspace \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    sdl-dev