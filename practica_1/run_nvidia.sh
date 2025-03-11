# If you have problems:
#   1. Check nvidia-smi: This should display NVIDIA GPU info
#   2. Check OpenGL:
#      - apt-get update
#      - apt-get install -y mesa-utils libgl1-mesa-glx
#      - glxinfo | grep "OpenGL renderer"
#      This should return your NVIDIA GPU

# --gpus all -> Allow the container to access all GPUs available on the host
# -e -> Set DISPLAY environment variable for X11 forwarding
# -v -> Mount the X11 Unix socket to allow GUI applications from the container to display on the host
# --network host -> Use the host's network stack directly
# --name -> Name the container 'ros'
# --runtime=nvidia -> Use the NVIDIA runtime to enable GPU acceleration
# -e -> Make all NVIDIA GPUs visible to the container
# -e -> Enable all driver capabilities such as video, compute, and graphics
# -e -> Set terminal type to support color output
# -v -> Mount the local ./src directory to /home/ros-foxy/src in the container
# ros2 -> The Docker image to run (in this case, the 'ros2' image)

#!/bin/bash

export containerName=ros_noetic
sleep 3 && \
        xhost +local:`docker inspect --format='{{ .Config.Hostname }}' $containerName` >/dev/null 2>&1 &

docker run --rm -it --gpus all -e DISPLAY=${DISPLAY} \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw --network host \
    --workdir="/workspace" \
    --name $containerName --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all -e "TERM=xterm-256color" \
    --volume="$PWD:/workspace:rw" \
    ros_noetic:latest bash